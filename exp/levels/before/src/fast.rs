//! The searches of levels 1 to 9 for a payload that fits in one window
//! (up to 32768 bytes), which is every payload this crate is made for.
//!
//! They find what `levels.rs` finds, match for match; that file is the plain
//! statement of each search and takes the payloads that are larger.  Here
//! the same decisions are made with fewer instructions and fewer branches:
//! nothing has to be checked for having left the window, input is read eight
//! bytes at a time through pointers, and what can be computed without a
//! branch is.

use crate::write::{token, Token};
use crate::tables::*;
use core::ptr;

#[inline(always)]
unsafe fn rd32(p: *const u8, i: usize, n: usize) -> u32 {
    debug_assert!(i + 4 <= n);
    u32::from_le(ptr::read_unaligned(p.add(i) as *const u32))
}

#[inline(always)]
unsafe fn rd64(p: *const u8, i: usize, n: usize) -> u64 {
    debug_assert!(i + 8 <= n);
    u64::from_le(ptr::read_unaligned(p.add(i) as *const u64))
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

/// What `literals` stopped at.
struct Hit {
    /// The position, or the end it was given.
    pos: usize,
    /// The hash of the position after it.
    h: usize,
    /// The eight bytes there, and the bucket as it was before the position
    /// was entered.
    w: u64,
    bucket: u32,
}

/// Level 1's steps over literals: from `pos` up to `end`, until a position
/// has a candidate with the same four bytes.
///
/// A step loads the bucket of its position and, without asking whether it
/// holds anything, eight bytes at both of its positions (an empty half reads
/// position 0).  One branch then tells a literal from the rest.
///
/// A function of its own so that this loop is all the compiler sees: inside
/// the search it shared its registers with everything a match needs, and
/// took a third more instructions for the same work.
#[inline(never)]
unsafe fn literals<const ORDER: u32>(
    ip: *const u8,
    n: usize,
    tab: *mut u32,
    f_ll: *mut u32,
    mut pos: usize,
    end: usize,
    mut h: usize,
) -> Hit {
    while pos < end {
        let w = rd64(ip, pos, n);
        debug_assert!(h < 1 << ORDER);
        let bucket = *tab.add(h);
        *tab.add(h) = bucket << 16 | pos as u32;
        h = lz_hash((w >> 8) as u32, ORDER);
        let x1 = rd64(ip, (bucket & 0xFFFF) as usize, n) ^ w;
        let x2 = rd64(ip, (bucket >> 16) as usize, n) ^ w;
        if (x1 as u32 == 0) | (x2 as u32 == 0) {
            return Hit { pos, h, w, bucket };
        }
        *f_ll.add(w as u8 as usize) += 1;
        pos += 1;
    }
    Hit { pos, h, w: 0, bucket: 0 }
}

/// Can `fastest` take this payload?  It keeps positions as they are, with 0
/// for an empty entry, so the first position can never be found again.
/// libdeflate enters it under hash 0, where only a position with that hash
/// and the same four bytes would find it: so it cannot be found there
/// either, unless its own hash is 0.  That payload (one in thousands) is
/// left to the plain search.
pub(crate) fn fastest_takes<const ORDER: u32>(inp: &[u8]) -> bool {
    inp.len() >= 8
        && inp.len() <= 32768
        && lz_hash(u32::from_le_bytes([inp[0], inp[1], inp[2], inp[3]]), ORDER) != 0
}

/// Level 1 for a payload that `fastest_takes`: what `levels::Search::
/// fastest` finds.  Returns the number of matches.
///
/// `tab` has `1 << ORDER` buckets of two positions, the more recent one in
/// the low half, and has been zeroed.
pub(crate) unsafe fn fastest<const ORDER: u32>(inp: &[u8], tab: *mut u32, sink: Sink) -> usize {
    let n = inp.len();
    debug_assert!(fastest_takes::<ORDER>(inp));
    let ip = inp.as_ptr();
    let f_ll = sink.f_ll;
    let (mut n_seqs, mut run_start) = (0usize, 0usize);
    let mut pos = 0usize;
    let mut h = 0usize; // libdeflate enters the first position under hash 0

    // Enters the positions `$from..$end` of a match, unless the payload
    // ends within five bytes of it (as in libdeflate).
    macro_rules! enter {
        ($from:expr, $end:expr) => {{
            let end = $end;
            if n - end >= 5 {
                let mut q = $from;
                while q < end {
                    debug_assert!(h < 1 << ORDER);
                    let b = *tab.add(h);
                    *tab.add(h) = b << 16 | q as u32;
                    h = lz_hash(rd32(ip, q + 1, n), ORDER);
                    q += 1;
                }
            }
        }};
    }

    // A step reads eight bytes at its position.
    let fast_end = n - 7;
    loop {
        let hit = literals::<ORDER>(ip, n, tab, f_ll, pos, fast_end, h);
        pos = hit.pos;
        h = hit.h;
        if pos >= fast_end {
            break;
        }
        let (w, bucket) = (hit.w, hit.bucket);
        let m1 = (bucket & 0xFFFF) as usize;
        let m2 = (bucket >> 16) as usize;
        let x1 = rd64(ip, m1, n) ^ w;
        let x2 = rd64(ip, m2, n) ^ w;
        // Equal bytes, up to 8 (which stands for 8 or more); none for an
        // entry that was empty and only read like a position.
        let l1 = if x1 as u32 == 0 && m1 != 0 { (x1.trailing_zeros() >> 3) as usize } else { 0 };
        let l2 = if x2 as u32 == 0 && m2 != 0 { (x2.trailing_zeros() >> 3) as usize } else { 0 };
        // The longer one; the more recent one if they are equal.
        let (mut len, mut m) = if l2 > l1 { (l2, m2) } else { (l1, m1) };
        if len == 0 {
            *f_ll.add(w as u8 as usize) += 1;
            pos += 1;
            continue;
        }
        if len == 8 {
            let max_len = (n - pos).min(MAX_MATCH);
            let e1 = if l1 == 8 { extend(ip, n, m1, pos, 8, max_len) } else { l1 };
            len = e1;
            m = m1;
            // libdeflate does not look at the second candidate once the
            // first is 32 bytes long.
            if e1 < 32 && l2 == 8 {
                let e2 = extend(ip, n, m2, pos, 8, max_len);
                if e2 > e1 {
                    len = e2;
                    m = m2;
                }
            }
        }
        matched!(sink, run_start, n_seqs, pos, len, pos - m);
        enter!(pos + 1, pos + len);
        pos += len;
    }

    // The last seven positions, a byte at a time.
    while n - pos >= 5 {
        let max_len = n - pos;
        let seq = rd32(ip, pos, n);
        let bucket = *tab.add(h);
        *tab.add(h) = bucket << 16 | pos as u32;
        h = lz_hash(rd32(ip, pos + 1, n), ORDER);
        let m1 = (bucket & 0xFFFF) as usize;
        let m2 = (bucket >> 16) as usize;
        let mut len = 0;
        let mut m = 0;
        if m1 != 0 {
            if rd32(ip, m1, n) == seq {
                len = extend(ip, n, m1, pos, 4, max_len);
                m = m1;
            }
            if m2 != 0 && len < max_len && rd32(ip, m2, n) == seq {
                let l2 = extend(ip, n, m2, pos, 4, max_len);
                if l2 > len {
                    len = l2;
                    m = m2;
                }
            }
        }
        if len == 0 {
            *f_ll.add(seq as u8 as usize) += 1;
            pos += 1;
            continue;
        }
        matched!(sink, run_start, n_seqs, pos, len, pos - m);
        enter!(pos + 1, pos + len);
        pos += len;
    }
    while pos < n {
        *f_ll.add(*ip.add(pos) as usize) += 1;
        pos += 1;
    }
    n_seqs
}

// ---- levels 2 to 9 ----------------------------------------------------

/// Table sizes of levels 2 to 9 for a payload of up to `1 << LG` bytes:
/// `1 << O3` entries for hashes of three bytes, `1 << O4` for four.
pub(crate) struct Orders<const LG: u32>;

impl<const LG: u32> Orders<LG> {
    pub(crate) const O3: u32 = crate::levels::chain_orders(LG).0;
    pub(crate) const O4: u32 = crate::levels::chain_orders(LG).1;
}

/// The input and the tables of levels 2 to 9 (see `levels::Tables`), which
/// have been zeroed.  A payload of at most 32768 bytes has no position that
/// is out of reach, so an entry is a position, or 0 for none.
#[derive(Clone, Copy)]
pub(crate) struct Chains {
    pub ip: *const u8,
    pub n: usize,
    pub h3: *mut u16,
    pub h4: *mut u16,
    pub next: *mut u16,
    /// How many candidates to look at, and the length at which to stop.
    pub depth: u32,
    pub nice: usize,
}

/// Where a search stopped, to go on from after a block was ended early:
/// the position, and its hashes of three and of four bytes.
#[derive(Clone, Copy, Default)]
pub(crate) struct Resume {
    pub pos: usize,
    pub nh: (usize, usize),
}

/// Can `greedy` and `lazy` take this payload?  With 0 for an empty entry
/// the first position can never be found again; in libdeflate, which enters
/// it under the hashes 0, it can only if one of its own hashes is 0 (see
/// `fastest_takes`).
pub(crate) fn chains_take<const LG: u32>(inp: &[u8]) -> bool {
    inp.len() >= 8 && inp.len() <= 32768 && {
        let seq = u32::from_le_bytes([inp[0], inp[1], inp[2], inp[3]]);
        lz_hash(seq & 0xFF_FFFF, Orders::<LG>::O3) != 0 && lz_hash(seq, Orders::<LG>::O4) != 0
    }
}

/// libdeflate's `hc_matchfinder_longest_match` (see `levels.rs`): the
/// longest match at `p` that is longer than `best_len`, among the first
/// `depth` candidates, as (length, distance); `p` is entered into the
/// tables, and `nh` becomes the hashes of the position after it.
#[inline(always)]
#[allow(clippy::too_many_arguments)]
unsafe fn hc_longest<const LG: u32>(
    c: Chains,
    nh: &mut (usize, usize),
    p: usize,
    mut best_len: usize,
    max_len: usize,
    nice_len: usize,
    mut depth: u32,
) -> (usize, usize) {
    let (ip, n) = (c.ip, c.n);
    if max_len < 5 {
        return (best_len, 0); // four bytes cannot be read at p + 1
    }
    debug_assert!(nh.0 < 1 << Orders::<LG>::O3 && nh.1 < 1 << Orders::<LG>::O4);
    let node3 = *c.h3.add(nh.0) as usize;
    let mut node4 = *c.h4.add(nh.1) as usize;
    *c.h3.add(nh.0) = p as u16;
    *c.h4.add(nh.1) = p as u16;
    *c.next.add(p) = node4 as u16;
    let next_seq = rd32(ip, p + 1, n);
    *nh = (
        lz_hash(next_seq & 0xFF_FFFF, Orders::<LG>::O3),
        lz_hash(next_seq, Orders::<LG>::O4),
    );
    let mut best = p;
    macro_rules! advance {
        ($out:lifetime) => {
            debug_assert!(node4 < p);
            node4 = *c.next.add(node4) as usize;
            depth -= 1;
            if node4 == 0 || depth == 0 {
                break $out;
            }
        };
    }
    'out: {
        let seq4 = rd32(ip, p, n);
        if best_len < 4 {
            if node3 == 0 {
                break 'out;
            }
            if best_len < 3 && (rd32(ip, node3, n) ^ seq4) & 0xFF_FFFF == 0 {
                best_len = 3;
                best = node3;
            }
            if node4 == 0 {
                break 'out;
            }
            // The first candidate with the same four bytes.
            loop {
                if rd32(ip, node4, n) == seq4 {
                    break;
                }
                advance!('out);
            }
            best = node4;
            best_len = extend(ip, n, best, p, 4, max_len);
            if best_len >= nice_len {
                break 'out;
            }
            advance!('out);
        } else if node4 == 0 || best_len >= nice_len {
            break 'out;
        }
        // Longer ones: the bytes that would make a candidate longer than
        // the best so far are looked at first.
        loop {
            loop {
                if rd32(ip, node4 + best_len - 3, n) == rd32(ip, p + best_len - 3, n)
                    && rd32(ip, node4, n) == seq4
                {
                    break;
                }
                advance!('out);
            }
            let len = extend(ip, n, node4, p, 4, max_len);
            if len > best_len {
                best_len = len;
                best = node4;
                if best_len >= nice_len {
                    break 'out;
                }
            }
            advance!('out);
        }
    }
    (best_len, p - best)
}

/// libdeflate's `hc_matchfinder_skip_bytes`: enters `count` positions from
/// `from` on, unless the payload ends within five bytes of them.
#[inline(always)]
unsafe fn hc_skip<const LG: u32>(c: Chains, nh: &mut (usize, usize), from: usize, count: usize) {
    if count + 5 > c.n - from {
        return;
    }
    let (mut h3, mut h4) = *nh;
    let mut q = from;
    while q < from + count {
        *c.h3.add(h3) = q as u16;
        *c.next.add(q) = *c.h4.add(h4);
        *c.h4.add(h4) = q as u16;
        let s = rd32(c.ip, q + 1, c.n);
        h3 = lz_hash(s & 0xFF_FFFF, Orders::<LG>::O3);
        h4 = lz_hash(s, Orders::<LG>::O4);
        q += 1;
    }
    *nh = (h3, h4);
}

/// What the searches of levels 2 to 9 have in common: their variables, and
/// how a literal and a match are written down.
macro_rules! chain_search {
    ($c:ident, $sink:ident, $st:ident, $split:ident;
     $n:ident, $begin:ident, $pos:ident, $nh:ident, $n_seqs:ident, $run_start:ident, $splitting:ident) => {
        let $n = $c.n;
        debug_assert!($n <= 32768);
        let $begin = $st.pos;
        let mut $pos = $begin;
        let mut $nh = $st.nh;
        let (mut $n_seqs, mut $run_start) = (0usize, $begin);
        let $splitting = !$split.is_null();
    };
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
/// Does the block go on at `pos`?  If not, the search's state is written
/// back for the block after it.
macro_rules! chain_goes_on {
    ($st:ident, $split:ident, $splitting:ident, $n:ident, $begin:ident, $pos:ident, $nh:ident) => {{
        let on = $pos < $n && !($splitting && (*$split).ends_at($pos - $begin, $n - $pos));
        if !on {
            $st.pos = $pos;
            $st.nh = $nh;
        }
        on
    }};
}

/// A block of levels 2 to 4 of a payload of at most 32768 bytes: what
/// `levels::Search::greedy` finds.  Returns the number of matches.
pub(crate) unsafe fn greedy<const LG: u32>(
    c: Chains,
    min_len: usize,
    sink: Sink,
    st: &mut Resume,
    split: *mut crate::levels::Split,
) -> usize {
    chain_search!(c, sink, st, split; n, begin, pos, nh, n_seqs, run_start, splitting);
    loop {
        let max_len = (n - pos).min(MAX_MATCH);
        let nice_len = c.nice.min(max_len);
        let (len, dist) = hc_longest::<LG>(c, &mut nh, pos, min_len - 1, max_len, nice_len, c.depth);
        if len >= min_len && (len > MIN_MATCH || dist <= 4096) {
            chain_match!(sink, split, splitting, run_start, n_seqs, pos, len, dist);
            hc_skip::<LG>(c, &mut nh, pos + 1, len - 1);
            pos += len;
        } else {
            chain_literal!(c, sink, split, splitting, pos);
            pos += 1;
        }
        if !chain_goes_on!(st, split, splitting, n, begin, pos, nh) {
            break;
        }
    }
    n_seqs
}

/// A block of levels 5 to 9 of a payload of at most 32768 bytes: what
/// `levels::Search::lazy` finds.  Returns the number of matches.
pub(crate) unsafe fn lazy<const LG: u32>(
    c: Chains,
    mut min_len: usize,
    two: bool,
    sink: Sink,
    st: &mut Resume,
    split: *mut crate::levels::Split,
) -> usize {
    chain_search!(c, sink, st, split; n, begin, pos, nh, n_seqs, run_start, splitting);
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
    loop {
        'step: {
            if pos >= next_recalc {
                min_len = crate::levels::later_min_len(&*(sink.f_ll as *const [u32; NUM_LL]), c.depth);
                next_recalc += (n - next_recalc).min(pos - begin);
            }
            let (max_len, nice_len) = limits(pos);
            let (mut cur_len, mut cur_dist) =
                hc_longest::<LG>(c, &mut nh, pos, min_len - 1, max_len, nice_len, c.depth);
            if cur_len < min_len || (cur_len == MIN_MATCH && cur_dist > 8192) {
                chain_literal!(c, sink, split, splitting, pos);
                pos += 1;
                break 'step;
            }
            pos += 1;
            // A match at pos - 1, found with the limits of that position.
            loop {
                if cur_len >= limits(pos - 1).1 {
                    chain_match!(sink, split, splitting, run_start, n_seqs, pos - 1, cur_len, cur_dist);
                    hc_skip::<LG>(c, &mut nh, pos, cur_len - 1);
                    pos += cur_len - 1;
                    break 'step;
                }
                // The next position, with half the candidates.
                let (max_len, nice_len) = limits(pos);
                let (next_len, next_dist) =
                    hc_longest::<LG>(c, &mut nh, pos, cur_len - 1, max_len, nice_len, c.depth >> 1);
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
                    let (next_len, next_dist) = hc_longest::<LG>(
                        c, &mut nh, pos, cur_len - 1, max_len, nice_len, c.depth >> 2,
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
                        hc_skip::<LG>(c, &mut nh, pos, cur_len - 3);
                        pos += cur_len - 3;
                    }
                } else {
                    chain_match!(sink, split, splitting, run_start, n_seqs, pos - 2, cur_len, cur_dist);
                    hc_skip::<LG>(c, &mut nh, pos, cur_len - 2);
                    pos += cur_len - 2;
                }
                break 'step;
            }
        }
        if !chain_goes_on!(st, split, splitting, n, begin, pos, nh) {
            break;
        }
    }
    n_seqs
}
