//! The searches of levels 1 to 9 as they are run.
//!
//! They find what `levels.rs` finds, match for match.  That file is the
//! plain statement of each search, which follows libdeflate's line by line,
//! and what these are tested against; it also takes the payloads of fewer
//! than eight bytes.  Here the same decisions are made with less work:
//!
//! * input is read eight bytes at a time through pointers, and what can be
//!   computed without a branch is;
//! * the tables hold positions in a form that needs no care at the
//!   beginning of a payload, nothing done to them in a payload of up to
//!   64 KiB, and one pass less than libdeflate makes in a longer one;
//! * the steps that find nothing, which in a payload that does not repeat
//!   itself much are most steps, are loops of their own with nothing else
//!   in them (`literals`, `chain_literals`).
//!
//! `BIG` marks a search of a payload of more than 32768 bytes: matches reach
//! no further back than that, so the tables must forget, and the payload is
//! more than one block if libdeflate would make it more than one.  A search
//! of a shorter payload is the same code with all of that left out, and its
//! tables are smaller, in proportion to the payload.

use crate::tables::*;
use crate::write::{token, Token};
use core::ptr;

/// How far back libdeflate's tables reach, and how many positions those
/// here tell apart.
pub(crate) const WINDOW: usize = 32768;

#[inline(always)]
unsafe fn rd32(p: *const u8, i: usize, n: usize) -> u32 {
    debug_assert!(i + 4 <= n);
    u32::from_le(ptr::read_unaligned(p.add(i) as *const u32))
}

/// The four bytes at `base + i`, where `base` itself may lie one byte before
/// what it points into.
#[inline(always)]
unsafe fn at32(base: *const u8, i: usize) -> u32 {
    u32::from_le(ptr::read_unaligned(base.wrapping_add(i) as *const u32))
}

/// Where in `Chains::next` an entry has its link.  A payload of up to 32768
/// bytes has no entry that large, and that table holds nothing but entries
/// of the payload at hand.  (`Chains::links` can hold what an earlier
/// payload left, which is read, though never followed: there the index is
/// always cut to size.)
#[inline(always)]
fn link_of<const BIG: bool>(entry: usize) -> usize {
    debug_assert!(BIG || entry < WINDOW);
    if BIG {
        entry & (WINDOW - 1)
    } else {
        entry
    }
}

/// Four bytes as they lie, for comparing with four others.
#[inline(always)]
unsafe fn raw32(p: *const u8, i: usize, n: usize) -> u32 {
    debug_assert!(i + 4 <= n);
    ptr::read_unaligned(p.add(i) as *const u32)
}

#[inline(always)]
unsafe fn rd64(p: *const u8, i: usize, n: usize) -> u64 {
    debug_assert!(i + 8 <= n);
    u64::from_le(ptr::read_unaligned(p.add(i) as *const u64))
}

/// Asks for the memory at `p`, which is about to be written, to be brought
/// near.  Changes nothing but when it gets there.
#[inline(always)]
#[allow(unused_variables)]
unsafe fn fetch<T>(p: *const T) {
    #[cfg(all(target_arch = "x86_64", not(miri)))]
    core::arch::x86_64::_mm_prefetch::<{ core::arch::x86_64::_MM_HINT_T0 }>(p.cast());
    #[cfg(all(target_arch = "aarch64", not(miri)))]
    core::arch::asm!("prfm pstl1keep, [{p}]", p = in(reg) p, options(nostack, preserves_flags, readonly));
}

/// libdeflate's hash: the top `bits` bits of a product.
#[inline(always)]
fn lz_hash(seq: u32, bits: u32) -> usize {
    (seq.wrapping_mul(0x1E35_A7BD) >> (32 - bits)) as usize
}

/// How many bytes are equal at `a` and at `b`: at least `len`, which are
/// known to be, and at most `max`.  `a` < `b`, and `max` bytes can be read
/// at `b`.
#[inline(always)]
unsafe fn extend(ip: *const u8, n: usize, a: usize, b: usize, mut len: usize, max: usize) -> usize {
    debug_assert!(a < b && b + max <= n && len <= max);
    while len + 8 <= max {
        let d = rd64(ip, a + len, n) ^ rd64(ip, b + len, n);
        if d != 0 {
            return len + (d.trailing_zeros() >> 3) as usize;
        }
        len += 8;
    }
    while len < max && *ip.add(a + len) == *ip.add(b + len) {
        len += 1;
    }
    len
}

/// Where a search writes down what it finds.  Raw pointers, and the counts
/// of what was written are kept by the search in variables of its own: a
/// store through any of these must not make the compiler think that the
/// search's own state may have changed.
#[derive(Clone, Copy)]
pub(crate) struct Sink {
    /// Symbol counts: `[u32; NUM_LL]` and `[u32; NUM_OFF]`, zeroed.
    pub f_ll: *mut u32,
    pub f_off: *mut u32,
    pub seqs: *mut Token,
    pub max_seqs: usize,
}

/// Counts a match and writes it down.  `$run_start` and `$n_seqs` are the
/// search's variables.
macro_rules! matched {
    ($sink:expr, $run_start:ident, $n_seqs:ident, $pos:expr, $len:expr, $dist:expr) => {{
        let (pos, len, dist): (usize, usize, usize) = ($pos, $len, $dist);
        debug_assert!((MIN_MATCH..=MAX_MATCH).contains(&len) && (1..=32768).contains(&dist));
        debug_assert!(pos >= $run_start && $n_seqs < $sink.max_seqs);
        let (t, slot) = token(pos - $run_start, len, dist);
        *$sink.f_ll.add(FIRST_LEN + *LEN_SLOT.as_ptr().add(len) as usize) += 1;
        *$sink.f_off.add(slot) += 1;
        *$sink.seqs.add($n_seqs) = t;
        $n_seqs += 1;
        $run_start = pos + len;
    }};
}

// ---- level 1 -----------------------------------------------------------
//
// A table of buckets, each two entries of 16 bits, the more recent one in
// the low half.  An entry is a position less `off`.
//
// A match may reach 32767 bytes back.  libdeflate keeps its positions
// relative to the beginning of a window, and moves the window on by 32768
// bytes when a search reaches its end, or just before the positions of a
// match that runs across that end are entered.  What was before the old
// beginning is forgotten then; no later search could have reached it.  The
// window is moved here where it is moved there.
//
// `off` is 0 while the window begins at 0 or at 32768, and from then on
// 32768 less than the window's beginning.  So an entry is the position
// itself in the first 65536 bytes of a payload; the first move of the
// window changes nothing in the table; and at every later one each entry is
// reduced by 32768, or becomes 0 if it is no more than that, 0 being what
// stands for nothing.
//
// An entry of 0 is also what the first position of the payload has.
// libdeflate enters that position under hash 0 whatever its bytes are, so
// it is only ever found again by a position that has hash 0 and the same
// four bytes: only in a payload whose first four bytes have hash 0.  In
// such a payload an entry of 0 is taken to be the first position for as
// long as that position is within reach, which is right for the bucket it
// was entered in and makes no difference in any other, where the four bytes
// cannot be the same.  In every other payload 0 is nothing.

/// Reduces every entry of the tables by 32768; those that stand for what a
/// match can no longer reach become 0.
#[cold]
#[inline(never)]
unsafe fn rebase(tables: &[(*mut u16, usize)]) {
    for &(t, len) in tables {
        for e in core::slice::from_raw_parts_mut(t, len) {
            *e = e.saturating_sub(WINDOW as u16);
        }
    }
}

/// Level 1's steps over literals.  Positions are given as their entries
/// (`ent` is where the byte of entry 0 is): from `e` up to `end`, until a
/// position has a candidate with the same four bytes.  Returns that
/// position (or `end`) and its hash; it has not been entered.
///
/// A step loads the bucket of its position and, without asking whether it
/// holds anything, eight bytes at both of its entries (an entry of 0 reads
/// what is there too).  One branch then tells a literal from the rest.
///
/// A function of its own so that this loop is all the compiler sees: inside
/// the search it shared its registers with everything a match needs, and
/// took a third more instructions for the same work.
#[inline(never)]
unsafe fn literals<const ORDER: u32>(
    ent: *const u8,
    tab: *mut u32,
    f_ll: *mut u32,
    mut e: usize,
    end: usize,
    mut h: usize,
) -> (usize, usize) {
    #[inline(always)]
    unsafe fn at(ent: *const u8, e: usize) -> u64 {
        u64::from_le(ptr::read_unaligned(ent.add(e) as *const u64))
    }
    while e < end {
        let w = at(ent, e);
        debug_assert!(h < 1 << ORDER);
        let bucket = *tab.add(h);
        let x1 = at(ent, (bucket & 0xFFFF) as usize) ^ w;
        let x2 = at(ent, (bucket >> 16) as usize) ^ w;
        if (x1 as u32 == 0) | (x2 as u32 == 0) {
            break;
        }
        *tab.add(h) = bucket << 16 | e as u32;
        h = lz_hash((w >> 8) as u32, ORDER);
        *f_ll.add(w as u8 as usize) += 1;
        e += 1;
    }
    (e, h)
}

/// A block of level 1, from where `st` says: what `levels::Search::fastest`
/// finds.  Returns the number of matches; `st` then says where the next
/// block begins.
///
/// `tab` has `1 << ORDER` buckets and was zeroed before the payload's first
/// block.  `BIG` for a payload of more than 32768 bytes, in which the
/// window moves and a block ends at `soft_end` or after
/// `levels::FAST_MAX_SEQS` matches, as libdeflate's does; any other payload
/// is one block.  The payload has at least 8 bytes.
pub(crate) unsafe fn fastest<const ORDER: u32, const BIG: bool>(
    inp: &[u8],
    tab: *mut u32,
    sink: Sink,
    st: &mut Resume,
    soft_end: usize,
    early: bool,
) -> usize {
    use crate::levels::FAST_MAX_SEQS;
    let n = inp.len();
    debug_assert!(n >= 8 && (BIG || (n <= WINDOW && soft_end == n)));
    let ip = inp.as_ptr();
    let f_ll = sink.f_ll;
    let (mut n_seqs, mut run_start) = (0usize, st.pos);
    let mut pos = st.pos;
    let mut h = st.nh.1;
    // Where the window begins, and what follows from it (see above).
    let mut base = st.win;
    let mut off = if BIG { base.saturating_sub(WINDOW) } else { 0 };
    let mut ent = ip.add(off);
    let tables = [(tab.cast::<u16>(), 2usize << ORDER)];
    macro_rules! slide {
        () => {{
            if base != 0 {
                rebase(&tables);
                off += WINDOW;
                ent = ip.add(off);
            }
            base += WINDOW;
        }};
    }
    // The lowest entry that stands for a position within reach of the one
    // whose entry is `$e`: no more than 32767 back, and not an entry of 0
    // unless that is the payload's first position (see above).
    let first = WINDOW - 1 + (lz_hash(rd32(ip, 0, n), ORDER) != 0) as usize;
    macro_rules! lowest {
        ($e:expr) => {
            if BIG {
                $e.max(first) - (WINDOW - 1)
            } else {
                first - (WINDOW - 1)
            }
        };
    }
    // A step reads eight bytes at its position.
    let fast_end = n - 7;
    // Steps are taken without a question up to here: the end of the eight
    // bytes, of the block, or of the window.
    macro_rules! stop_at {
        () => {
            if BIG {
                fast_end.min(soft_end).min(base + WINDOW)
            } else {
                fast_end
            }
        };
    }

    if pos == 0 {
        // Nothing is before the first position: a literal.  It is entered
        // under hash 0, where its entry of 0 already is.
        debug_assert!(h == 0 && *tab == 0);
        let wd = rd64(ip, 0, n);
        h = lz_hash((wd >> 8) as u32, ORDER);
        *f_ll.add(wd as u8 as usize) += 1;
        pos = 1;
    }
    let mut stop = stop_at!();
    let ended = 'block: {
        loop {
            if pos >= stop {
                if BIG && pos >= soft_end {
                    break 'block true;
                }
                if pos >= fast_end {
                    break;
                }
                debug_assert!(BIG && pos == base + WINDOW);
                slide!();
                stop = stop_at!();
            }
            // A step.  First what the literal loop asks too: does either
            // entry of the bucket of `pos` have the same four bytes?
            let mut wd = rd64(ip, pos, n);
            let mut e = pos - off;
            debug_assert!(h < 1 << ORDER && e < 2 * WINDOW);
            let mut bucket = *tab.add(h);
            let mut x1 = rd64(ent, (bucket & 0xFFFF) as usize, n - off) ^ wd;
            let mut x2 = rd64(ent, (bucket >> 16) as usize, n - off) ^ wd;
            if (x1 as u32 != 0) & (x2 as u32 != 0) {
                // A literal, and the literals after it.
                *tab.add(h) = bucket << 16 | e as u32;
                h = lz_hash((wd >> 8) as u32, ORDER);
                *f_ll.add(wd as u8 as usize) += 1;
                debug_assert!(stop + 7 <= n);
                (e, h) = literals::<ORDER>(ent, tab, f_ll, e + 1, stop - off, h);
                pos = e + off;
                if pos == stop {
                    continue;
                }
                wd = rd64(ip, pos, n);
                bucket = *tab.add(h);
                x1 = rd64(ent, (bucket & 0xFFFF) as usize, n - off) ^ wd;
                x2 = rd64(ent, (bucket >> 16) as usize, n - off) ^ wd;
            }
            // One does.  The position is entered, and each candidate is
            // given the number of bytes it has in common with it, up to 8
            // (which stands for 8 or more), or none if it is out of reach.
            debug_assert!(h < 1 << ORDER && e < 2 * WINDOW);
            *tab.add(h) = bucket << 16 | e as u32;
            h = lz_hash((wd >> 8) as u32, ORDER);
            let (s1, s2) = ((bucket & 0xFFFF) as usize, (bucket >> 16) as usize);
            let lo = lowest!(e);
            let l1 = if s1 >= lo { (x1.trailing_zeros() >> 3) as usize } else { 0 };
            let l2 = if s2 >= lo { (x2.trailing_zeros() >> 3) as usize } else { 0 };
            // The longer one; the more recent one if they are equal.
            let (mut len, mut s) = if l2 > l1 { (l2, s2) } else { (l1, s1) };
            if len < 4 {
                // The four bytes were at a position out of reach.
                *f_ll.add(wd as u8 as usize) += 1;
                pos += 1;
                continue;
            }
            if len == 8 {
                let max_len = (n - pos).min(MAX_MATCH);
                let e1 = if l1 == 8 { extend(ip, n, s1 + off, pos, 8, max_len) } else { l1 };
                len = e1;
                s = s1;
                // libdeflate does not look at the second candidate once the
                // first is 32 bytes long.
                if e1 < 32 && l2 == 8 {
                    let e2 = extend(ip, n, s2 + off, pos, 8, max_len);
                    if e2 > e1 {
                        len = e2;
                        s = s2;
                    }
                }
            }
            matched!(sink, run_start, n_seqs, pos, len, e - s);
            // The positions of the match are entered, unless the payload
            // ends within five bytes of it.  If the last of them is beyond
            // the window's end, the window moves first.
            let end = pos + len;
            if n - end >= 5 {
                if BIG && early {
                    // The bucket of the position after the match is asked
                    // for before the match's own positions are entered.
                    fetch(tab.add(lz_hash(rd32(ip, end, n), ORDER)));
                }
                if BIG && end - 1 - base >= WINDOW {
                    slide!();
                    stop = stop_at!();
                }
                let mut q = pos + 1 - off;
                let q_end = end - off;
                while q < q_end {
                    debug_assert!(h < 1 << ORDER && q < 2 * WINDOW);
                    let b = *tab.add(h);
                    *tab.add(h) = b << 16 | q as u32;
                    h = lz_hash(rd32(ent, q + 1, n - off), ORDER);
                    q += 1;
                }
            }
            pos = end;
            if BIG && n_seqs >= FAST_MAX_SEQS {
                break 'block true;
            }
        }
        // The last seven positions of the payload, a byte at a time.
        while n - pos >= 5 {
            if BIG && pos - base == WINDOW {
                slide!();
            }
            let max_len = n - pos;
            let seq = rd32(ip, pos, n);
            let e = pos - off;
            let bucket = *tab.add(h);
            *tab.add(h) = bucket << 16 | e as u32;
            h = lz_hash(rd32(ip, pos + 1, n), ORDER);
            let (s1, s2) = ((bucket & 0xFFFF) as usize, (bucket >> 16) as usize);
            let lo = lowest!(e);
            let (mut len, mut s) = (0, 0);
            if s1 >= lo {
                if rd32(ent, s1, n - off) == seq {
                    len = extend(ip, n, s1 + off, pos, 4, max_len);
                    s = s1;
                }
                if s2 >= lo && len < max_len && rd32(ent, s2, n - off) == seq {
                    let l2 = extend(ip, n, s2 + off, pos, 4, max_len);
                    if l2 > len {
                        len = l2;
                        s = s2;
                    }
                }
            }
            if len == 0 {
                *f_ll.add(seq as u8 as usize) += 1;
                pos += 1;
            } else {
                // The payload ends within five bytes of this match.
                matched!(sink, run_start, n_seqs, pos, len, e - s);
                pos += len;
            }
            if BIG && (pos >= soft_end || n_seqs >= FAST_MAX_SEQS) {
                break 'block true;
            }
        }
        false
    };
    if !ended {
        // Fewer than five bytes are left: literals, and the payload is done.
        while pos < n {
            *f_ll.add(*ip.add(pos) as usize) += 1;
            pos += 1;
        }
    }
    st.pos = pos;
    st.nh.1 = h;
    st.win = base;
    n_seqs
}

// ---- levels 2 to 9 ----------------------------------------------------
//
// Two tables that say where a hash of three and of four bytes was last
// seen, and for every position the one before it with the same hash of four
// bytes: a chain to walk.  An entry is a position plus 1 less `off`, and 0
// stands for nothing.
//
// As at level 1, what a search finds does not depend on when libdeflate
// moves its window: a candidate is within reach if it is at most 32767
// bytes back, and whatever a move of the window makes libdeflate forget is
// further back than that.  So `off` is 0 for as long as entries fit in 16
// bits, which is the first 65535 bytes of a payload, and is then raised by
// 32768 whenever they no longer do, every entry being reduced by as much
// (`rebase`).  That is one pass over the tables less than libdeflate
// makes, and none at all for a payload of up to 65535 bytes.

/// Table sizes of levels 2 to 9 for a payload of up to `1 << LG` bytes:
/// `1 << O3` entries for hashes of three bytes, `1 << O4` for four.  With
/// `LG` = 15 they are libdeflate's, and those are also what a payload of any
/// greater length gets.
pub(crate) struct Orders<const LG: u32>;

impl<const LG: u32> Orders<LG> {
    pub(crate) const O3: u32 = crate::levels::chain_orders(LG).0;
    pub(crate) const O4: u32 = crate::levels::chain_orders(LG).1;
}

/// The input and the tables of levels 2 to 9 (see `levels::Tables`).  The
/// hash tables have been zeroed.
#[derive(Clone, Copy)]
pub(crate) struct Chains {
    pub ip: *const u8,
    pub n: usize,
    pub h3: *mut u16,
    pub h4: *mut u16,
    pub next: *mut u16,
    /// What a search with `HOPS` has in place of `next`: for every position
    /// the four before it with the same hash of four bytes (see
    /// `hc_longest`).  The first of them has been zeroed.
    pub links: *mut u64,
    /// How many candidates to look at, and the length at which to stop.
    pub depth: u32,
    pub nice: usize,
}

/// Where a search stopped, to go on from when the block after it is
/// searched.
#[derive(Clone, Copy, Default)]
pub(crate) struct Resume {
    pub pos: usize,
    /// The hashes of `pos`, of three and of four bytes; level 1 has only
    /// the second.
    pub nh: (usize, usize),
    /// At level 1 where the window begins, at the other levels `off`.
    pub win: usize,
}

/// Makes room for more entries (see above).  Returns the new `off`.  (By
/// value, not through a reference: a search keeps `off` in a register, and
/// could not if this function, which it calls once in 32768 bytes, were
/// given its address.)
#[cold]
#[inline(never)]
unsafe fn slide_chains(c: Chains, off: usize, hops: bool) -> usize {
    // A link is four entries, whichever way round the machine keeps them.
    let chain = if hops { (c.links.cast::<u16>(), 4 * WINDOW) } else { (c.next, WINDOW) };
    rebase(&[(c.h3, 1 << 15), (c.h4, 1 << 16), chain]);
    off + WINDOW
}

/// libdeflate's `hc_matchfinder_longest_match` (see `levels.rs`): the
/// longest match at `p` that is longer than `best_len`, among the first
/// `depth` candidates, as (length, distance); `p` is entered into the
/// tables, and `nh` becomes the hashes of the position after it.
///
/// The candidates are a chain: each position leads to the one before it
/// with the same hash.  Followed one by one (`c.next`), every step waits for
/// the load of the step before it, and where the chains are long that wait
/// is most of a search's time.  With `HOPS` a position holds its next four
/// (`c.links`, 16 bits each, the nearest lowest), as libdeflate has it at
/// the levels that search deeply: one load in four steps then waits for
/// another, and it is started four steps ahead.  The positions looked at
/// are the same, in the same order.  What it costs is a second load when a
/// position is entered: its link is the head of its chain followed by the
/// first three of that head's.
#[inline(always)]
#[allow(clippy::too_many_arguments)]
unsafe fn hc_longest<const LG: u32, const BIG: bool, const HOPS: bool, const W: bool>(
    c: Chains,
    off: &mut usize,
    nh: &mut (usize, usize),
    p: usize,
    mut best_len: usize,
    max_len: usize,
    nice_len: usize,
    mut depth: u32,
) -> (usize, usize) {
    let (ip, n) = (c.ip, c.n);
    if BIG && p + 1 - *off == 2 * WINDOW {
        *off = slide_chains(c, *off, HOPS);
    }
    if max_len < 5 {
        return (best_len, 0); // four bytes cannot be read at p + 1
    }
    let off = if BIG { *off } else { 0 };
    // The entry of `p`; the entries above `lim` stand for positions within
    // reach of it; and the byte of entry s is at `ent + s`.  (So `ent` is
    // one byte before the payload when `off` is 0, and never read there:
    // an entry that stands for a position is at least 1.)
    let e = p + 1 - off;
    let lim = if BIG { e.saturating_sub(WINDOW) } else { 0 };
    let ent = ip.wrapping_add(off).wrapping_sub(1);
    debug_assert!(e < 2 * WINDOW && nh.0 < 1 << Orders::<LG>::O3 && nh.1 < 1 << Orders::<LG>::O4);
    let node3 = *c.h3.add(nh.0) as usize;
    let node4 = *c.h4.add(nh.1) as usize;
    *c.h3.add(nh.0) = e as u16;
    *c.h4.add(nh.1) = e as u16;
    // With `HOPS`: the four candidates after `node4`.
    let mut ahead = 0u64;
    if HOPS {
        ahead = *c.links.add(node4 & (WINDOW - 1));
        *c.links.add(e & (WINDOW - 1)) = ahead << 16 | node4 as u64;
    } else {
        *c.next.add(link_of::<BIG>(e)) = node4 as u16;
    }
    let next_seq = rd32(ip, p + 1, n);
    *nh = (
        lz_hash(next_seq & 0xFF_FFFF, Orders::<LG>::O3),
        lz_hash(next_seq, Orders::<LG>::O4),
    );
    if BIG {
        // Tables of this size are not at hand: what the next position will
        // need of them is asked for now.
        fetch(c.h3.add(nh.0));
        fetch(c.h4.add(nh.1));
    }
    let mut best = p;
    'out: {
        let seq4 = rd32(ip, p, n);
        if best_len < 4 {
            if node3 <= lim {
                break 'out;
            }
            if best_len < 3 && (at32(ent, node3) ^ seq4) & 0xFF_FFFF == 0 {
                best_len = 3;
                best = node3 + off - 1;
            }
            if node4 <= lim {
                break 'out;
            }
        } else if node4 <= lim || best_len >= nice_len {
            break 'out;
        }

        if !W && !HOPS {
            // The walk in two parts: up to the first candidate with the
            // same four bytes, then for longer ones.
            let mut node4 = node4;
            macro_rules! advance {
                ($out:lifetime) => {
                    debug_assert!(node4 + off - 1 < p);
                    node4 = *c.next.add(link_of::<BIG>(node4)) as usize;
                    depth -= 1;
                    if node4 <= lim || depth == 0 {
                        break $out;
                    }
                };
            }
            if best_len < 4 {
                loop {
                    if at32(ent, node4) == seq4 {
                        break;
                    }
                    advance!('out);
                }
                best = node4 + off - 1;
                best_len = extend(ip, n, best, p, 4, max_len);
                if best_len >= nice_len {
                    break 'out;
                }
                advance!('out);
            }
            loop {
                loop {
                    debug_assert!(node4 + off - 1 + best_len + 1 <= n);
                    if at32(ent, node4 + best_len - 3) == rd32(ip, p + best_len - 3, n) && at32(ent, node4) == seq4 {
                        break;
                    }
                    advance!('out);
                }
                let m = node4 + off - 1;
                let len = extend(ip, n, m, p, 4, max_len);
                if len > best_len {
                    best_len = len;
                    best = m;
                    if best_len >= nice_len {
                        break 'out;
                    }
                }
                advance!('out);
            }
        }

        // The chain, from `node4` on.  Nearly all of this is stepping past
        // candidates that are no better than the best so far, so that is
        // what a step is made of: one comparison of the four bytes that
        // would make the candidate longer than the best (its first four, as
        // long as there is no match of four), and what leads to the next
        // candidate.  Only a candidate that passes is looked at further.
        let mut tail_at = best_len.max(3) - 3;
        let mut tail = raw32(ip, p + tail_at, n);
        let mut tails = ent.wrapping_add(tail_at);
        macro_rules! passes {
            ($node:expr) => {{
                let node: usize = $node;
                debug_assert!(node >= 1 && node + off - 1 < p && node + off - 1 + tail_at + 4 <= n);
                ptr::read_unaligned(tails.wrapping_add(node) as *const u32) == tail
            }};
        }
        let mut node = node4;
        let mut pass = passes!(node);
        // With `HOPS`: the candidates in hand after `node`, how many they
        // are, and (`ahead`) those that come after them, asked for as soon
        // as it is known where they are.
        let (mut link, mut in_hand) = (0u64, 0u32);
        loop {
            if pass {
                let m = node + off - 1;
                if rd32(ip, m, n) == seq4 {
                    let len = extend(ip, n, m, p, 4, max_len);
                    if len > best_len {
                        best_len = len;
                        best = m;
                        if best_len >= nice_len {
                            break 'out;
                        }
                        tail_at = best_len - 3;
                        tail = raw32(ip, p + tail_at, n);
                        tails = ent.wrapping_add(tail_at);
                    }
                }
            }
            depth -= 1;
            if depth == 0 {
                break 'out;
            }
            // On to the next candidate that passes.
            if HOPS {
                node = 'found: loop {
                    // What is left of the four in hand.
                    while in_hand != 0 {
                        let nd = (link & 0xFFFF) as usize;
                        link >>= 16;
                        in_hand -= 1;
                        if nd <= lim {
                            break 'out;
                        }
                        if passes!(nd) {
                            break 'found nd;
                        }
                        depth -= 1;
                        if depth == 0 {
                            break 'out;
                        }
                    }
                    // Four at a time, while more than four may still be
                    // looked at: nothing is counted on the way.
                    while depth > 4 {
                        link = ahead;
                        ahead = *c.links.add((link >> 48) as usize & (WINDOW - 1));
                        macro_rules! hop {
                            ($k:literal) => {
                                let nd = (link & 0xFFFF) as usize;
                                link >>= 16;
                                if nd <= lim {
                                    break 'out;
                                }
                                if passes!(nd) {
                                    in_hand = 3 - $k;
                                    depth -= $k;
                                    break 'found nd;
                                }
                            };
                        }
                        hop!(0);
                        hop!(1);
                        hop!(2);
                        hop!(3);
                        depth -= 4;
                    }
                    link = ahead;
                    ahead = *c.links.add((link >> 48) as usize & (WINDOW - 1));
                    in_hand = 4;
                };
            } else {
                loop {
                    node = *c.next.add(link_of::<BIG>(node)) as usize;
                    if node <= lim {
                        break 'out;
                    }
                    if passes!(node) {
                        break;
                    }
                    depth -= 1;
                    if depth == 0 {
                        break 'out;
                    }
                }
            }
            pass = true;
        }
    }
    (best_len, p - best)
}

/// libdeflate's `hc_matchfinder_skip_bytes`: enters `count` positions from
/// `from` on, unless the payload ends within five bytes of them.
#[inline(always)]
unsafe fn hc_skip<const LG: u32, const BIG: bool, const HOPS: bool>(
    c: Chains,
    off: &mut usize,
    nh: &mut (usize, usize),
    from: usize,
    count: usize,
    early: bool,
) {
    if count + 5 > c.n - from {
        return;
    }
    if BIG && early {
        // What the position after these will need of the tables is asked
        // for before they are entered.
        let s = rd32(c.ip, from + count, c.n);
        fetch(c.h3.add(lz_hash(s & 0xFF_FFFF, Orders::<LG>::O3)));
        fetch(c.h4.add(lz_hash(s, Orders::<LG>::O4)));
    }
    let (mut h3, mut h4) = *nh;
    let mut q = from;
    let end = from + count;
    loop {
        // As far as entries fit in 16 bits, if that comes first.
        let stop = if BIG { end.min(*off + 2 * WINDOW - 1) } else { end };
        let off_now = if BIG { *off } else { 0 };
        while q < stop {
            let e = q + 1 - off_now;
            debug_assert!(e < 2 * WINDOW);
            *c.h3.add(h3) = e as u16;
            let head = *c.h4.add(h4);
            if HOPS {
                *c.links.add(e & (WINDOW - 1)) = *c.links.add(head as usize & (WINDOW - 1)) << 16 | head as u64;
            } else {
                *c.next.add(link_of::<BIG>(e)) = head;
            }
            *c.h4.add(h4) = e as u16;
            let s = rd32(c.ip, q + 1, c.n);
            h3 = lz_hash(s & 0xFF_FFFF, Orders::<LG>::O3);
            h4 = lz_hash(s, Orders::<LG>::O4);
            q += 1;
        }
        if !BIG || q == end {
            break;
        }
        *off = slide_chains(c, *off, HOPS);
    }
    if BIG && !early {
        fetch(c.h3.add(h3));
        fetch(c.h4.add(h4));
    }
    *nh = (h3, h4);
}

/// What `chain_literals` works on.
pub(crate) struct Plain {
    ip: *const u8,
    n: usize,
    h3: *mut u16,
    h4: *mut u16,
    /// `Chains::links` with `HOPS`, `Chains::next` without.
    chain: *mut u8,
    f_ll: *mut u32,
    /// `Split::new_obs`, if the block may be ended early.  Made anew before
    /// every use: the search also reaches the counts through references,
    /// after which a pointer made before must not be used again.
    kinds: *mut u32,
}

impl Plain {
    unsafe fn of(c: Chains, hops: bool, sink: Sink) -> Self {
        Plain {
            ip: c.ip,
            n: c.n,
            h3: c.h3,
            h4: c.h4,
            chain: if hops { c.links.cast() } else { c.next.cast() },
            f_ll: sink.f_ll,
            kinds: ptr::null_mut(),
        }
    }
}

/// The positions from `q` on that have no candidate at all, up to `stop`:
/// they are literals.  Each is entered and counted; `nh` is as in
/// `hc_longest`.  Returns the first position that has a candidate, or
/// `stop`.
///
/// A search asks for the longest match longer than some length.  If that
/// length is less than 4, the first thing it looks at is where the three
/// bytes at hand were last seen, and if that is nowhere within reach it has
/// its answer.  In a payload that does not repeat itself much that is how
/// most searches end, and this loop is those searches with nothing else in
/// it: `hc_longest` up to that point, and what its caller does with the
/// answer.  `stop` is where the caller has something else to do first: the
/// block may end there, the tables need room, or the payload has fewer than
/// five bytes left.
#[inline(never)]
unsafe fn chain_literals<const LG: u32, const BIG: bool, const HOPS: bool, const SPLIT: bool>(
    t: &Plain,
    off: usize,
    nh: &mut (usize, usize),
    mut q: usize,
    stop: usize,
) -> usize {
    let (mut h3, mut h4) = *nh;
    let off = if BIG { off } else { 0 };
    debug_assert!(stop + 4 <= t.n && (BIG || stop <= WINDOW) && (!BIG || stop - off < 2 * WINDOW));
    while q < stop {
        let e = q + 1 - off;
        let lim = if BIG { e.saturating_sub(WINDOW) } else { 0 };
        debug_assert!(h3 < 1 << Orders::<LG>::O3 && h4 < 1 << Orders::<LG>::O4);
        if *t.h3.add(h3) as usize > lim {
            break;
        }
        *t.h3.add(h3) = e as u16;
        let head = *t.h4.add(h4);
        *t.h4.add(h4) = e as u16;
        if HOPS {
            let links = t.chain.cast::<u64>();
            *links.add(e & (WINDOW - 1)) = *links.add(head as usize & (WINDOW - 1)) << 16 | head as u64;
        } else {
            *t.chain.cast::<u16>().add(link_of::<BIG>(e)) = head;
        }
        let s = rd32(t.ip, q + 1, t.n);
        h3 = lz_hash(s & 0xFF_FFFF, Orders::<LG>::O3);
        h4 = lz_hash(s, Orders::<LG>::O4);
        let b = *t.ip.add(q);
        *t.f_ll.add(b as usize) += 1;
        if SPLIT {
            *t.kinds.add(crate::levels::Split::kind(b)) += 1;
        }
        q += 1;
    }
    *nh = (h3, h4);
    q
}

/// What the searches of levels 2 to 9 have in common: their variables, and
/// how a literal and a match are written down.
macro_rules! chain_search {
    ($BIG:ident, $c:ident, $sink:ident, $st:ident, $split:ident;
     $n:ident, $begin:ident, $pos:ident, $nh:ident, $off:ident, $n_seqs:ident, $run_start:ident, $splitting:ident) => {
        let $n = $c.n;
        debug_assert!($n >= 8 && ($BIG || $n <= WINDOW));
        let $begin = $st.pos;
        let mut $pos = $begin;
        let mut $nh = $st.nh;
        let mut $off = if $BIG { $st.win } else { 0 };
        let (mut $n_seqs, mut $run_start) = (0usize, $begin);
        let $splitting = !$split.is_null();
    };
}
/// Up to where `chain_literals` may go from `pos` without the search
/// looking up: the end of the block as far as it is known, the last
/// position at which five bytes are left, where `hc_longest` would make
/// room in the tables, where a lazy search next counts the bytes in use
/// (`$recalc`), and where the block could be ended early.
macro_rules! chain_stop {
    ($BIG:ident, $split:ident, $splitting:ident, $n:ident, $begin:ident, $soft_end:ident,
     $pos:ident, $off:ident, $recalc:expr) => {{
        let mut stop = $soft_end.min($n.saturating_sub(4)).min($recalc);
        if $BIG {
            stop = stop.min($off + 2 * WINDOW - 1);
        }
        if $splitting {
            if let Some(at) = (*$split).may_end_at($pos - $begin, $n - $pos) {
                stop = stop.min($begin + at);
            }
        }
        stop
    }};
}
/// The literals at `pos` that `chain_literals` can tell.  For a search
/// that asks for a match longer than fewer than four bytes, after a
/// position that turned out a literal: where there is one there are often
/// more.  Evaluates to whether the block goes on.
macro_rules! chain_run {
    ($LG:ident, $BIG:ident, $HOPS:ident, $c:ident, $plain:ident, $st:ident, $split:ident, $splitting:ident,
     $n:ident, $begin:ident, $soft_end:ident, $pos:ident, $nh:ident, $off:ident, $n_seqs:ident, $sink:ident,
     $stop:ident, $recalc:expr) => {{
        let mut on = true;
        if $pos >= $stop {
            $stop = chain_stop!($BIG, $split, $splitting, $n, $begin, $soft_end, $pos, $off, $recalc);
        }
        if $pos < $stop {
            let lim = if $BIG { ($pos + 1 - $off).saturating_sub(WINDOW) } else { 0 };
            if *$c.h3.add($nh.0) as usize <= lim {
                let mut hashes = $nh;
                let q = if $splitting {
                    $plain.kinds = ptr::addr_of_mut!((*$split).new_obs).cast();
                    chain_literals::<$LG, $BIG, $HOPS, true>(&$plain, $off, &mut hashes, $pos, $stop)
                } else {
                    chain_literals::<$LG, $BIG, $HOPS, false>(&$plain, $off, &mut hashes, $pos, $stop)
                };
                $nh = hashes;
                if $splitting {
                    (*$split).num_new += (q - $pos) as u32;
                }
                $pos = q;
                on = chain_goes_on!($BIG, $st, $split, $splitting, $n, $begin, $soft_end, $pos, $nh, $off, $n_seqs, $sink);
            }
        }
        on
    }};
}
macro_rules! chain_literal {
    ($c:ident, $sink:ident, $split:ident, $splitting:ident, $p:expr) => {{
        let b = *$c.ip.add($p);
        *$sink.f_ll.add(b as usize) += 1;
        if $splitting {
            (*$split).literal(b);
        }
    }};
}
macro_rules! chain_match {
    ($sink:ident, $split:ident, $splitting:ident, $run_start:ident, $n_seqs:ident,
     $p:expr, $len:expr, $dist:expr) => {{
        let len: usize = $len;
        matched!($sink, $run_start, $n_seqs, $p, len, $dist);
        if $splitting {
            (*$split).matched(len);
        }
    }};
}
/// Does the block go on at `pos`?  It ends at `soft_end`, when the room for
/// its matches is used up, or where what it holds changes.  If it ends, the
/// search's state is written back for the block after it.
macro_rules! chain_goes_on {
    ($BIG:ident, $st:ident, $split:ident, $splitting:ident, $n:ident, $begin:ident, $soft_end:ident,
     $pos:ident, $nh:ident, $off:ident, $n_seqs:ident, $sink:ident) => {{
        debug_assert!($n_seqs < $sink.max_seqs && ($BIG || $soft_end == $n));
        // A payload of up to 32768 bytes has neither a block of the
        // greatest length nor that many matches.
        let on = if $BIG { $pos < $soft_end && $n_seqs < crate::levels::MAX_SEQS } else { $pos < $n }
            && !($splitting && (*$split).ends_at($pos - $begin, $n - $pos));
        if !on {
            $st.pos = $pos;
            $st.nh = $nh;
            $st.win = $off;
        }
        on
    }};
}

/// A block of levels 2 to 4: what `levels::Search::greedy` finds.  Returns
/// the number of matches.  `BIG` for a payload of more than 32768 bytes;
/// `soft_end` is where the block ends at the latest (see `levels.rs`).
pub(crate) unsafe fn greedy<const LG: u32, const BIG: bool, const W: bool>(
    c: Chains,
    (quick, early): (bool, bool),
    min_len: usize,
    sink: Sink,
    st: &mut Resume,
    split: *mut crate::levels::Split,
    soft_end: usize,
) -> usize {
    chain_search!(BIG, c, sink, st, split; n, begin, pos, nh, off, n_seqs, run_start, splitting);
    const HOPS: bool = false;
    let mut plain = Plain::of(c, HOPS, sink);
    let mut stop = 0;
    loop {
        let max_len = (n - pos).min(MAX_MATCH);
        let nice_len = c.nice.min(max_len);
        let (len, dist) =
            hc_longest::<LG, BIG, HOPS, W>(c, &mut off, &mut nh, pos, min_len - 1, max_len, nice_len, c.depth);
        let matched = len >= min_len && (len > MIN_MATCH || dist <= 4096);
        if matched {
            chain_match!(sink, split, splitting, run_start, n_seqs, pos, len, dist);
            hc_skip::<LG, BIG, HOPS>(c, &mut off, &mut nh, pos + 1, len - 1, early);
            pos += len;
        } else {
            chain_literal!(c, sink, split, splitting, pos);
            pos += 1;
        }
        if !chain_goes_on!(BIG, st, split, splitting, n, begin, soft_end, pos, nh, off, n_seqs, sink) {
            break;
        }
        if !matched
            && quick
            && min_len <= 4
            && !chain_run!(LG, BIG, HOPS, c, plain, st, split, splitting, n, begin, soft_end, pos, nh, off, n_seqs,
                           sink, stop, usize::MAX)
        {
            break;
        }
    }
    n_seqs
}

/// A block of levels 5 to 9: what `levels::Search::lazy` finds.  Returns the
/// number of matches.  `BIG` and `soft_end` as for `greedy`; `HOPS` as in
/// `hc_longest`.
#[allow(clippy::too_many_arguments)]
pub(crate) unsafe fn lazy<const LG: u32, const BIG: bool, const HOPS: bool, const W: bool>(
    c: Chains,
    (quick, early): (bool, bool),
    mut min_len: usize,
    two: bool,
    sink: Sink,
    st: &mut Resume,
    split: *mut crate::levels::Split,
    soft_end: usize,
) -> usize {
    chain_search!(BIG, c, sink, st, split; n, begin, pos, nh, off, n_seqs, run_start, splitting);
    let mut next_recalc = pos + (n - pos).min(10000);
    let better = |nl: usize, no: usize, cl: usize, co: usize, by: i32| {
        nl >= cl
            && 4 * (nl - cl) as i32 + (no.leading_zeros() as i32 - co.leading_zeros() as i32) > by
    };
    // The longest match libdeflate allows at `p`, and the length it calls
    // good enough there.
    let limits = |p: usize| {
        let max_len = (n - p).min(MAX_MATCH);
        (max_len, c.nice.min(max_len))
    };
    let mut plain = Plain::of(c, HOPS, sink);
    let mut stop = 0;
    loop {
        // A step; true if it was a position without a match.
        let literal = 'step: {
            if pos >= next_recalc {
                min_len = crate::levels::later_min_len(&*(sink.f_ll as *const [u32; NUM_LL]), c.depth);
                next_recalc += (n - next_recalc).min(pos - begin);
            }
            let (max_len, nice_len) = limits(pos);
            let (mut cur_len, mut cur_dist) = hc_longest::<LG, BIG, HOPS, W>(
                c, &mut off, &mut nh, pos, min_len - 1, max_len, nice_len, c.depth,
            );
            if cur_len < min_len || (cur_len == MIN_MATCH && cur_dist > 8192) {
                chain_literal!(c, sink, split, splitting, pos);
                pos += 1;
                break 'step true;
            }
            pos += 1;
            // A match at pos - 1, found with the limits of that position.
            loop {
                if cur_len >= limits(pos - 1).1 {
                    chain_match!(sink, split, splitting, run_start, n_seqs, pos - 1, cur_len, cur_dist);
                    hc_skip::<LG, BIG, HOPS>(c, &mut off, &mut nh, pos, cur_len - 1, early);
                    pos += cur_len - 1;
                    break 'step false;
                }
                // The next position, with half the candidates.
                let (max_len, nice_len) = limits(pos);
                let (next_len, next_dist) = hc_longest::<LG, BIG, HOPS, W>(
                    c, &mut off, &mut nh, pos, cur_len - 1, max_len, nice_len, c.depth >> 1,
                );
                pos += 1;
                if better(next_len, next_dist, cur_len, cur_dist, 2) {
                    chain_literal!(c, sink, split, splitting, pos - 2);
                    cur_len = next_len;
                    cur_dist = next_dist;
                    continue;
                }
                if two {
                    // And the one after it, with a quarter.
                    let (max_len, nice_len) = limits(pos);
                    let (next_len, next_dist) = hc_longest::<LG, BIG, HOPS, W>(
                        c, &mut off, &mut nh, pos, cur_len - 1, max_len, nice_len, c.depth >> 2,
                    );
                    pos += 1;
                    if better(next_len, next_dist, cur_len, cur_dist, 6) {
                        chain_literal!(c, sink, split, splitting, pos - 3);
                        chain_literal!(c, sink, split, splitting, pos - 2);
                        cur_len = next_len;
                        cur_dist = next_dist;
                        continue;
                    }
                    chain_match!(sink, split, splitting, run_start, n_seqs, pos - 3, cur_len, cur_dist);
                    if cur_len > 3 {
                        hc_skip::<LG, BIG, HOPS>(c, &mut off, &mut nh, pos, cur_len - 3, early);
                        pos += cur_len - 3;
                    }
                } else {
                    chain_match!(sink, split, splitting, run_start, n_seqs, pos - 2, cur_len, cur_dist);
                    hc_skip::<LG, BIG, HOPS>(c, &mut off, &mut nh, pos, cur_len - 2, early);
                    pos += cur_len - 2;
                }
                break 'step false;
            }
        };
        if !chain_goes_on!(BIG, st, split, splitting, n, begin, soft_end, pos, nh, off, n_seqs, sink) {
            break;
        }
        if literal
            && quick
            && min_len <= 4
            && !chain_run!(LG, BIG, HOPS, c, plain, st, split, splitting, n, begin, soft_end, pos, nh, off, n_seqs,
                           sink, stop, next_recalc)
        {
            break;
        }
    }
    n_seqs
}
