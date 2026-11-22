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
/// Eight bytes can be read at every position before `end`.
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
    if e >= end {
        return (e, h);
    }
    // The hash of the position after `e`.  Which step is the last is hard
    // to predict, and what decides it is at the end of a load, a product
    // and two more loads: so the first two are done one position early.
    let mut ahead = lz_hash(at32(ent, e + 1), ORDER);
    loop {
        let w = at(ent, e);
        debug_assert!(h < 1 << ORDER);
        let bucket = *tab.add(h);
        let x1 = at(ent, (bucket & 0xFFFF) as usize) ^ w;
        let x2 = at(ent, (bucket >> 16) as usize) ^ w;
        if (x1 as u32 == 0) | (x2 as u32 == 0) {
            break;
        }
        *tab.add(h) = bucket << 16 | e as u32;
        h = ahead;
        ahead = lz_hash(at32(ent, e + 2), ORDER);
        *f_ll.add(w as u8 as usize) += 1;
        e += 1;
        if e >= end {
            break;
        }
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
//
// A search counts in entries throughout: where it is, where the block began
// and where it ends, where the payload ends (`Run`).  What it reads of the
// payload it reads at `ent` plus an entry, `ent` being the address that the
// byte of entry 0 would have.  So nothing in a step has to do with `off`;
// when `off` is raised, `ent` is raised with it and all that is an entry is
// reduced (`chain_slide`).

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

/// Four bytes as they lie at `base + i`, for comparing with four others.
#[inline(always)]
unsafe fn raw_at32(base: *const u8, i: usize) -> u32 {
    ptr::read_unaligned(base.wrapping_add(i) as *const u32)
}

#[inline(always)]
unsafe fn at64(base: *const u8, i: usize) -> u64 {
    u64::from_le(ptr::read_unaligned(base.wrapping_add(i) as *const u64))
}

/// `extend` for bytes that are addressed by entry: how many are equal at
/// the entries `a` and `b`, at least `len` and at most `max`.  `a` < `b`,
/// and `end` is the entry after the payload's last.
#[inline(always)]
unsafe fn extend_at(ent: *const u8, end: usize, a: usize, b: usize, mut len: usize, max: usize) -> usize {
    debug_assert!(1 <= a && a < b && b + max <= end && len <= max);
    let _ = end;
    while len + 8 <= max {
        let d = at64(ent, a + len) ^ at64(ent, b + len);
        if d != 0 {
            return len + (d.trailing_zeros() >> 3) as usize;
        }
        len += 8;
    }
    while len < max && *ent.wrapping_add(a + len) == *ent.wrapping_add(b + len) {
        len += 1;
    }
    len
}

/// A search of levels 2 to 9 at work on a block.  Everything that says
/// where is an entry (see above).
struct Run {
    /// The address that the byte of entry 0 would have.
    ent: *const u8,
    off: usize,
    /// The position to search next, and the entry after the payload's last.
    pos: usize,
    end: usize,
    /// Where the block began, and where the literals begin that are not
    /// yet part of a token.  Both can lie before entry 0 once `off` has
    /// been raised, so they are only ever subtracted from, wrapping.
    begin: usize,
    run_start: usize,
    /// Where the block ends at the latest.
    soft_end: usize,
    /// Up to where `chain_literals!` may go (see `chain_stop!`).
    stop: usize,
    /// Where a lazy search next counts the bytes in use; never reached by
    /// a greedy one.
    recalc: usize,
    /// The hashes of `pos`, of three and of four bytes.
    nh: (usize, usize),
    /// How many matches the block has so far.
    n_seqs: usize,
}

macro_rules! chain_run {
    ($BIG:ident, $c:ident, $st:ident, $soft_end:ident) => {{
        debug_assert!($c.n >= 8 && ($BIG || ($c.n <= WINDOW && $soft_end == $c.n)));
        let off = if $BIG { $st.win } else { 0 };
        let pos = $st.pos + 1 - off;
        Run {
            ent: $c.ip.wrapping_add(off).wrapping_sub(1),
            off,
            pos,
            end: $c.n + 1 - off,
            begin: pos,
            run_start: pos,
            soft_end: $soft_end + 1 - off,
            stop: 0,
            recalc: usize::MAX,
            nh: $st.nh,
            n_seqs: 0,
        }
    }};
}

/// libdeflate's `hc_matchfinder_longest_match` (see `levels.rs`): the
/// longest match at the entry `p` that is longer than `best_len`, among the
/// first `depth` candidates, as (length, distance); `p` is entered into the
/// tables, and `nh` becomes the hashes of the position after it.  `node3`
/// is what the table of hashes of three bytes holds for `p`, and `end` the
/// entry after the payload's last.
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
unsafe fn hc_longest<const LG: u32, const BIG: bool, const HOPS: bool>(
    c: Chains,
    ent: *const u8,
    end: usize,
    nh: &mut (usize, usize),
    p: usize,
    node3: usize,
    mut best_len: usize,
    max_len: usize,
    nice_len: usize,
    mut depth: u32,
) -> (usize, usize) {
    if max_len < 5 {
        return (best_len, 0); // four bytes cannot be read at p + 1
    }
    // The entries above `lim` stand for positions within reach of `p`.
    let lim = if BIG { p.saturating_sub(WINDOW) } else { 0 };
    debug_assert!(1 <= p && p < 2 * WINDOW && p + max_len <= end);
    debug_assert!(nh.0 < 1 << Orders::<LG>::O3 && nh.1 < 1 << Orders::<LG>::O4);
    debug_assert!(node3 == *c.h3.add(nh.0) as usize);
    let node4 = *c.h4.add(nh.1) as usize;
    *c.h3.add(nh.0) = p as u16;
    *c.h4.add(nh.1) = p as u16;
    // With `HOPS`: the four candidates after `node4`.
    let mut ahead = 0u64;
    if HOPS {
        ahead = *c.links.add(node4 & (WINDOW - 1));
        *c.links.add(p & (WINDOW - 1)) = ahead << 16 | node4 as u64;
    } else {
        *c.next.add(link_of::<BIG>(p)) = node4 as u16;
    }
    let next_seq = at32(ent, p + 1);
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
        let seq4 = at32(ent, p);
        if best_len < 4 {
            if node3 <= lim {
                break 'out;
            }
            if best_len < 3 && (at32(ent, node3) ^ seq4) & 0xFF_FFFF == 0 {
                best_len = 3;
                best = node3;
            }
            if node4 <= lim {
                break 'out;
            }
        } else if node4 <= lim || best_len >= nice_len {
            break 'out;
        }

        // The chain, from `node4` on.  Nearly all of this is stepping past
        // candidates that are no better than the best so far, so that is
        // what a step is made of: one comparison of the four bytes that
        // would make the candidate longer than the best (its first four, as
        // long as there is no match of four), and what leads to the next
        // candidate.  Only a candidate that passes is looked at further.
        let mut tail_at = best_len.max(3) - 3;
        let mut tail = raw_at32(ent, p + tail_at);
        let mut tails = ent.wrapping_add(tail_at);
        macro_rules! passes {
            ($node:expr) => {{
                let node: usize = $node;
                debug_assert!(node >= 1 && node < p && node + tail_at + 4 <= end);
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
            if pass && at32(ent, node) == seq4 {
                let len = extend_at(ent, end, node, p, 4, max_len);
                if len > best_len {
                    best_len = len;
                    best = node;
                    if best_len >= nice_len {
                        break 'out;
                    }
                    tail_at = best_len - 3;
                    tail = raw_at32(ent, p + tail_at);
                    tails = ent.wrapping_add(tail_at);
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

/// Enters the `count` positions from the entry `from` on, the last of which
/// is below `2 * WINDOW` and has five bytes of payload from it on.
#[inline(always)]
unsafe fn hc_enter<const LG: u32, const BIG: bool, const HOPS: bool>(
    c: Chains,
    ent: *const u8,
    nh: &mut (usize, usize),
    from: usize,
    count: usize,
) {
    let (mut h3, mut h4) = *nh;
    let mut q = from;
    let stop = from + count;
    while q < stop {
        debug_assert!(1 <= q && q < 2 * WINDOW);
        *c.h3.add(h3) = q as u16;
        let head = *c.h4.add(h4);
        if HOPS {
            *c.links.add(q & (WINDOW - 1)) = *c.links.add(head as usize & (WINDOW - 1)) << 16 | head as u64;
        } else {
            *c.next.add(link_of::<BIG>(q)) = head;
        }
        *c.h4.add(h4) = q as u16;
        let s = at32(ent, q + 1);
        h3 = lz_hash(s & 0xFF_FFFF, Orders::<LG>::O3);
        h4 = lz_hash(s, Orders::<LG>::O4);
        q += 1;
    }
    *nh = (h3, h4);
}

/// Makes room in the tables: `s.pos` is the first entry that no longer
/// fits in 16 bits.
macro_rules! chain_slide {
    ($HOPS:ident, $c:ident, $s:ident) => {{
        debug_assert!($s.pos == 2 * WINDOW && $s.soft_end > WINDOW && $s.recalc > WINDOW);
        $s.off = slide_chains($c, $s.off, $HOPS);
        $s.ent = $s.ent.wrapping_add(WINDOW);
        $s.pos -= WINDOW;
        $s.end -= WINDOW;
        $s.soft_end -= WINDOW;
        $s.recalc -= WINDOW;
        $s.begin = $s.begin.wrapping_sub(WINDOW);
        $s.run_start = $s.run_start.wrapping_sub(WINDOW);
        $s.stop = $s.stop.saturating_sub(WINDOW);
    }};
}
/// libdeflate's `hc_matchfinder_skip_bytes`: moves on past `count`
/// positions, entering them unless the payload ends within five bytes of
/// them.
macro_rules! chain_skip {
    ($LG:ident, $BIG:ident, $HOPS:ident, $c:ident, $s:ident, $count:expr) => {{
        let count: usize = $count;
        if count + 5 > $s.end - $s.pos {
            $s.pos += count;
        } else {
            let mut left = count;
            loop {
                // As far as entries fit in 16 bits, if that comes first.
                let now = if $BIG { left.min(2 * WINDOW - $s.pos) } else { left };
                hc_enter::<$LG, $BIG, $HOPS>($c, $s.ent, &mut $s.nh, $s.pos, now);
                $s.pos += now;
                left -= now;
                if left == 0 {
                    break;
                }
                chain_slide!($HOPS, $c, $s);
            }
            if $BIG {
                fetch($c.h3.add($s.nh.0));
                fetch($c.h4.add($s.nh.1));
            }
        }
    }};
}
/// Up to where `chain_literals!` may go: nowhere if the search asks for
/// matches longer than four bytes (see there); else the end of the block as
/// far as it is known, the last position at which six bytes are left, the
/// first entry that does not fit in 16 bits, where a lazy search next
/// counts the bytes in use, and where the block could be ended early.
macro_rules! chain_stop {
    ($BIG:ident, $s:ident, $split:ident, $splitting:ident, $min_len:ident) => {{
        let mut stop = 0;
        if $min_len <= 4 {
            stop = $s.soft_end.min($s.end - 5).min($s.recalc);
            if $BIG {
                stop = stop.min(2 * WINDOW);
            }
            if $splitting {
                if let Some(at) = (*$split).may_end_at($s.pos.wrapping_sub($s.begin), $s.end - $s.pos) {
                    stop = stop.min($s.begin.wrapping_add(at));
                }
            }
        }
        stop
    }};
}
/// Is there no candidate at all at `s.pos`, given what the table of hashes
/// of three bytes holds for it?
macro_rules! chain_none {
    ($BIG:ident, $s:ident, $node3:expr) => {
        $node3 <= if $BIG { $s.pos.saturating_sub(WINDOW) } else { 0 }
    };
}
/// The positions from `s.pos` on that have no candidate at all, as far as
/// `s.stop` allows: they are literals.  Each is entered and counted.  The
/// first of them is `s.pos` itself, which the caller has found to be one.
/// Evaluates to whether the block goes on; `$node3` is then what the table
/// of hashes of three bytes holds for the new `s.pos`.
///
/// A search asks for the longest match longer than some length.  If that
/// length is less than 4, the first thing it looks at is where the three
/// bytes at hand were last seen, and if that is nowhere within reach it has
/// its answer.  In a payload that does not repeat itself much that is how
/// most searches end, and this loop is those searches with nothing else in
/// it: `hc_longest` up to that point, and what its caller does with the
/// answer.  `s.stop` is where there may be something else to do first; it
/// is never too far on, and is put right when it has been reached.
macro_rules! chain_literals {
    ($LG:ident, $BIG:ident, $HOPS:ident, $c:ident, $s:ident, $sink:ident, $st:ident, $split:ident,
     $splitting:ident, $min_len:ident, $node3:ident) => {{
        let mut on = true;
        loop {
            let from = $s.pos;
            // Whether a position is a literal is what this loop cannot
            // predict, and what decides it comes at the end of a load, a
            // product and another load.  So those are done a position
            // early: the hashes of the position after `s.pos`, and what the
            // table holds for them before `s.pos` is entered.  When the
            // question is asked the answer is there, and a wrong guess is
            // found out at once.
            let seq = at32($s.ent, $s.pos + 1);
            let mut after = (lz_hash(seq & 0xFF_FFFF, Orders::<$LG>::O3), lz_hash(seq, Orders::<$LG>::O4));
            let mut held = *$c.h3.add(after.0) as usize;
            // Literals, until a position has a candidate (true) or `stop`
            // is reached.
            let found = loop {
                let p = $s.pos;
                debug_assert!(1 <= p && p < 2 * WINDOW && p + 6 <= $s.end);
                *$c.h3.add($s.nh.0) = p as u16;
                let head = *$c.h4.add($s.nh.1);
                *$c.h4.add($s.nh.1) = p as u16;
                if $HOPS {
                    *$c.links.add(p & (WINDOW - 1)) = *$c.links.add(head as usize & (WINDOW - 1)) << 16 | head as u64;
                } else {
                    *$c.next.add(link_of::<$BIG>(p)) = head;
                }
                let b = *$s.ent.wrapping_add(p);
                *$sink.f_ll.add(b as usize) += 1;
                if $splitting {
                    let kinds = ptr::addr_of_mut!((*$split).new_obs).cast::<u32>();
                    *kinds.add(crate::levels::Split::kind(b)) += 1;
                }
                // What the table holds for the next position now: what it
                // held before `p` was entered, unless `p` went there.
                $node3 = if after.0 == $s.nh.0 { p } else { held };
                let seq = at32($s.ent, p + 2);
                $s.nh = after;
                after = (lz_hash(seq & 0xFF_FFFF, Orders::<$LG>::O3), lz_hash(seq, Orders::<$LG>::O4));
                held = *$c.h3.add(after.0) as usize;
                $s.pos = p + 1;
                if $s.pos >= $s.stop {
                    break false;
                }
                if !chain_none!($BIG, $s, $node3) {
                    break true;
                }
            };
            if $splitting {
                (*$split).num_new += ($s.pos - from) as u32;
            }
            if found {
                break;
            }
            // Something may be due here.
            on = chain_goes_on!($BIG, $s, $st, $split, $splitting, $sink);
            if !on {
                break;
            }
            $s.stop = chain_stop!($BIG, $s, $split, $splitting, $min_len);
            if $s.pos >= $s.stop || !chain_none!($BIG, $s, $node3) {
                break;
            }
        }
        on
    }};
}
macro_rules! chain_literal {
    ($s:ident, $sink:ident, $split:ident, $splitting:ident, $p:expr) => {{
        let b = *$s.ent.wrapping_add($p);
        *$sink.f_ll.add(b as usize) += 1;
        if $splitting {
            (*$split).literal(b);
        }
    }};
}
/// Counts a match at the entry `$p` and writes it down.
macro_rules! chain_match {
    ($s:ident, $sink:ident, $split:ident, $splitting:ident, $p:expr, $len:expr, $dist:expr) => {{
        let (p, len, dist): (usize, usize, usize) = ($p, $len, $dist);
        debug_assert!((MIN_MATCH..=MAX_MATCH).contains(&len) && (1..=32768).contains(&dist));
        debug_assert!($s.n_seqs < $sink.max_seqs);
        let (t, slot) = token(p.wrapping_sub($s.run_start), len, dist);
        *$sink.f_ll.add(FIRST_LEN + *LEN_SLOT.as_ptr().add(len) as usize) += 1;
        *$sink.f_off.add(slot) += 1;
        *$sink.seqs.add($s.n_seqs) = t;
        $s.n_seqs += 1;
        $s.run_start = p + len;
        if $splitting {
            (*$split).matched(len);
        }
    }};
}
/// Does the block go on at `s.pos`?  It ends at `s.soft_end`, when the room
/// for its matches is used up, or where what it holds changes.  If it ends,
/// the search's state is written back for the block after it.
macro_rules! chain_goes_on {
    ($BIG:ident, $s:ident, $st:ident, $split:ident, $splitting:ident, $sink:ident) => {{
        debug_assert!($s.n_seqs < $sink.max_seqs && ($BIG || $s.soft_end == $s.end));
        // A payload of up to 32768 bytes has neither a block of the
        // greatest length nor that many matches.
        let on = if $BIG { $s.pos < $s.soft_end && $s.n_seqs < crate::levels::MAX_SEQS } else { $s.pos < $s.end }
            && !($splitting && (*$split).ends_at($s.pos.wrapping_sub($s.begin), $s.end - $s.pos));
        if !on {
            $st.pos = $s.pos - 1 + $s.off;
            $st.nh = $s.nh;
            $st.win = $s.off;
        }
        on
    }};
}

/// A block of levels 2 to 4: what `levels::Search::greedy` finds.  Returns
/// the number of matches.  `BIG` for a payload of more than 32768 bytes;
/// `soft_end` is where the block ends at the latest (see `levels.rs`).
pub(crate) unsafe fn greedy<const LG: u32, const BIG: bool>(
    c: Chains,
    min_len: usize,
    sink: Sink,
    st: &mut Resume,
    split: *mut crate::levels::Split,
    soft_end: usize,
) -> usize {
    const HOPS: bool = false;
    let splitting = !split.is_null();
    let mut s = chain_run!(BIG, c, st, soft_end);
    s.stop = chain_stop!(BIG, s, split, splitting, min_len);
    loop {
        if BIG && s.pos == 2 * WINDOW {
            chain_slide!(HOPS, c, s);
        }
        let mut node3 = *c.h3.add(s.nh.0) as usize;
        if s.pos < s.stop && chain_none!(BIG, s, node3) {
            if !chain_literals!(LG, BIG, HOPS, c, s, sink, st, split, splitting, min_len, node3) {
                break;
            }
            if BIG && s.pos == 2 * WINDOW {
                continue;
            }
        }
        let max_len = (s.end - s.pos).min(MAX_MATCH);
        let nice_len = c.nice.min(max_len);
        let (len, dist) = hc_longest::<LG, BIG, HOPS>(
            c, s.ent, s.end, &mut s.nh, s.pos, node3, min_len - 1, max_len, nice_len, c.depth,
        );
        if len >= min_len && (len > MIN_MATCH || dist <= 4096) {
            chain_match!(s, sink, split, splitting, s.pos, len, dist);
            s.pos += 1;
            chain_skip!(LG, BIG, HOPS, c, s, len - 1);
        } else {
            chain_literal!(s, sink, split, splitting, s.pos);
            s.pos += 1;
        }
        if !chain_goes_on!(BIG, s, st, split, splitting, sink) {
            break;
        }
        if s.pos >= s.stop {
            s.stop = chain_stop!(BIG, s, split, splitting, min_len);
        }
    }
    s.n_seqs
}

/// A block of levels 5 to 9: what `levels::Search::lazy` finds.  Returns the
/// number of matches.  `BIG` and `soft_end` as for `greedy`; `HOPS` as in
/// `hc_longest`.
pub(crate) unsafe fn lazy<const LG: u32, const BIG: bool, const HOPS: bool>(
    c: Chains,
    mut min_len: usize,
    two: bool,
    sink: Sink,
    st: &mut Resume,
    split: *mut crate::levels::Split,
    soft_end: usize,
) -> usize {
    let splitting = !split.is_null();
    let mut s = chain_run!(BIG, c, st, soft_end);
    s.recalc = s.pos + (s.end - s.pos).min(10000);
    s.stop = chain_stop!(BIG, s, split, splitting, min_len);
    let better = |nl: usize, no: usize, cl: usize, co: usize, by: i32| {
        nl >= cl
            && 4 * (nl - cl) as i32 + (no.leading_zeros() as i32 - co.leading_zeros() as i32) > by
    };
    // The longest match libdeflate allows at `p`, and the length it calls
    // good enough there.
    macro_rules! limits {
        ($p:expr) => {{
            let max_len = (s.end - $p).min(MAX_MATCH);
            (max_len, c.nice.min(max_len))
        }};
    }
    // The longest match at `s.pos` that is longer than `$longer`, among
    // `$depth` candidates; `s.pos` moves on by one.
    macro_rules! search {
        ($node3:expr, $longer:expr, $depth:expr) => {{
            let node3: usize = $node3;
            let (max_len, nice_len) = limits!(s.pos);
            let found = hc_longest::<LG, BIG, HOPS>(
                c, s.ent, s.end, &mut s.nh, s.pos, node3, $longer, max_len, nice_len, $depth,
            );
            s.pos += 1;
            found
        }};
    }
    // The same for a position after the first of a step.
    macro_rules! look_ahead {
        ($longer:expr, $depth:expr) => {{
            if BIG && s.pos == 2 * WINDOW {
                chain_slide!(HOPS, c, s);
            }
            search!(*c.h3.add(s.nh.0) as usize, $longer, $depth)
        }};
    }
    loop {
        if BIG && s.pos == 2 * WINDOW {
            chain_slide!(HOPS, c, s);
        }
        let mut node3 = *c.h3.add(s.nh.0) as usize;
        if s.pos < s.stop && chain_none!(BIG, s, node3) {
            if !chain_literals!(LG, BIG, HOPS, c, s, sink, st, split, splitting, min_len, node3) {
                break;
            }
            if BIG && s.pos == 2 * WINDOW {
                continue;
            }
        }
        'step: {
            if s.pos >= s.recalc {
                min_len = crate::levels::later_min_len(&*(sink.f_ll as *const [u32; NUM_LL]), c.depth);
                s.recalc += (s.end - s.recalc).min(s.pos.wrapping_sub(s.begin));
            }
            let (mut cur_len, mut cur_dist) = search!(node3, min_len - 1, c.depth);
            if cur_len < min_len || (cur_len == MIN_MATCH && cur_dist > 8192) {
                chain_literal!(s, sink, split, splitting, s.pos - 1);
                break 'step;
            }
            // A match at pos - 1, found with the limits of that position.
            loop {
                if cur_len >= limits!(s.pos - 1).1 {
                    chain_match!(s, sink, split, splitting, s.pos - 1, cur_len, cur_dist);
                    chain_skip!(LG, BIG, HOPS, c, s, cur_len - 1);
                    break 'step;
                }
                // The next position, with half the candidates.
                let (next_len, next_dist) = look_ahead!(cur_len - 1, c.depth >> 1);
                if better(next_len, next_dist, cur_len, cur_dist, 2) {
                    chain_literal!(s, sink, split, splitting, s.pos - 2);
                    cur_len = next_len;
                    cur_dist = next_dist;
                    continue;
                }
                if two {
                    // And the one after it, with a quarter.
                    let (next_len, next_dist) = look_ahead!(cur_len - 1, c.depth >> 2);
                    if better(next_len, next_dist, cur_len, cur_dist, 6) {
                        chain_literal!(s, sink, split, splitting, s.pos - 3);
                        chain_literal!(s, sink, split, splitting, s.pos - 2);
                        cur_len = next_len;
                        cur_dist = next_dist;
                        continue;
                    }
                    chain_match!(s, sink, split, splitting, s.pos - 3, cur_len, cur_dist);
                    if cur_len > 3 {
                        chain_skip!(LG, BIG, HOPS, c, s, cur_len - 3);
                    }
                } else {
                    chain_match!(s, sink, split, splitting, s.pos - 2, cur_len, cur_dist);
                    chain_skip!(LG, BIG, HOPS, c, s, cur_len - 2);
                }
                break 'step;
            }
        }
        if !chain_goes_on!(BIG, s, st, split, splitting, sink) {
            break;
        }
        if s.pos >= s.stop {
            s.stop = chain_stop!(BIG, s, split, splitting, min_len);
        }
    }
    s.n_seqs
}
