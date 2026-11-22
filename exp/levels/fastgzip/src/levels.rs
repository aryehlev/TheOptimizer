//! Levels 1 to 9: each payload is searched the way libdeflate searches at
//! the same level, and written with codes made for it alone.
//!
//! What is libdeflate's (lib/deflate_compress.c, lib/ht_matchfinder.h and
//! lib/hc_matchfinder.h; MIT licence, Eric Biggers): which candidates are
//! looked at and in which order, when a match is taken and when the next
//! position is tried first, the shortest match worth taking, where a block
//! ends, and which kind of block it becomes.  With tables of libdeflate's
//! size the matches are the same ones, and the output has the same size to
//! within a few bytes.
//!
//! What differs:
//!
//!   - The tables are sized to the payload (see `fast_order`).  libdeflate
//!     clears 128 KiB per call at level 1 and 192 KiB at the levels above.
//!   - A block covers at most 65535 bytes.  libdeflate's reach 300000.
//!   - The block is written by this crate's encoder (`write.rs`).
//!
//! Every search is here in a plain form, which is the statement of what it
//! finds and takes payloads of any size.  `fast.rs` has each of them again
//! for payloads of up to 32768 bytes, and those are what runs for the
//! payloads this crate is made for.
//!
//! Consecutive payloads do not share their codes here, as they do at level
//! 0.  Shared codes have to describe every symbol any of the payloads uses
//! and fit none of them exactly, which was measured to cost some 25 bytes
//! per payload: 1% of a 4 KB payload's output.  Level 0 gets its single pass
//! for that.  Here it would save the making of codes, a quarter of the time
//! at level 1 and less above, and 1% is more than most of these levels gain
//! over the one below.

use crate::codes::{Codes, FIXED};
use crate::enc::stored_at;
use crate::write::{token, write_block, Token};
use crate::tables::*;
use crate::Stats;

/// Matches reach back at most this far, and positions are kept relative to
/// the start of a window of this size.
const WINDOW: usize = 32768;
/// An entry that holds no position: further back than any match reaches.
const NONE: i16 = i16::MIN;

/// A block covers at most 65535 bytes: the literals before a match are
/// counted in 16 bits, and a stored block cannot be longer.  A block is ended
/// this long before that, because the step that crosses the line still
/// finishes, and at the lazy levels a step can be a row of literals, each
/// given up for a better match after it, and then that match.
const SOFT_MAX_BLOCK: usize = 65535 - 1024;
/// No block is shorter than this, except the last (as in libdeflate).
const MIN_BLOCK: usize = 5000;
/// Level 1 ends a block after this many matches (as in libdeflate).
const FAST_MAX_SEQS: usize = 8192;
/// The most matches a block can have: three bytes each.
const MAX_BLOCK_SEQS: usize = 65535 / 3 + 1;

#[derive(Clone, Copy, PartialEq, Eq)]
enum Parse {
    /// Two candidates per hash value, the longer one wins (level 1).
    Fastest,
    /// A chain of candidates per hash value; the longest match is taken.
    Greedy,
    /// As greedy, but a match is given up for one literal if the next
    /// position has a better one.
    Lazy,
    /// As lazy, looking two positions ahead.
    Lazy2,
}

/// libdeflate's levels 1 to 9: how to search, how many candidates to look at
/// (`max_search_depth`), and the length at which a match is good enough to
/// stop looking (`nice_match_length`).
const PARAMS: [(Parse, u32, usize); 10] = [
    (Parse::Fastest, 0, 0), // level 0 is not searched here
    (Parse::Fastest, 0, 32),
    (Parse::Greedy, 6, 10),
    (Parse::Greedy, 12, 14),
    (Parse::Greedy, 16, 30),
    (Parse::Lazy, 16, 30),
    (Parse::Lazy, 35, 65),
    (Parse::Lazy, 100, 130),
    (Parse::Lazy2, 300, 258),
    (Parse::Lazy2, 600, 258),
];

/// The hash tables.  One allocation of 256 KiB, of which a compressor of
/// small payloads only ever touches the beginning of each table.
#[repr(C, align(64))]
struct Tables {
    /// Hash of three bytes -> the last position that had it.
    h3: [i16; 1 << 15],
    /// Hash of four bytes -> the last position that had it: the head of a
    /// chain.  At level 1: buckets of two positions.
    h4: [i16; 1 << 16],
    /// Position -> the position before it with the same hash of four bytes.
    next: [i16; WINDOW],
}

/// libdeflate's hash: the top `bits` bits of a product.
#[inline(always)]
fn lz_hash(seq: u32, bits: u32) -> usize {
    (seq.wrapping_mul(0x1E35_A7BD) >> (32 - bits)) as usize
}

#[inline(always)]
fn le32(inp: &[u8], i: usize) -> u32 {
    u32::from_le_bytes(inp[i..i + 4].try_into().unwrap())
}

/// How many bytes are equal at `a` and at `b`: at least `start`, which are
/// known to be, and at most `max`.
#[inline(always)]
fn extend(inp: &[u8], a: usize, b: usize, start: usize, max: usize) -> usize {
    let x = &inp[a + start..a + max];
    let y = &inp[b + start..b + max];
    let mut len = start;
    let mut cx = x.chunks_exact(8);
    let mut cy = y.chunks_exact(8);
    for (p, q) in (&mut cx).zip(&mut cy) {
        let d = u64::from_le_bytes(p.try_into().unwrap()) ^ u64::from_le_bytes(q.try_into().unwrap());
        if d != 0 {
            return len + (d.trailing_zeros() >> 3) as usize;
        }
        len += 8;
    }
    for (p, q) in cx.remainder().iter().zip(cy.remainder()) {
        if p != q {
            break;
        }
        len += 1;
    }
    len
}

/// What block splitting looks at: how often each kind of symbol occurred in
/// the block so far, and since the last look.  libdeflate's heuristic.
pub(crate) struct Split {
    new_obs: [u32; 10],
    obs: [u32; 10],
    num_new: u32,
    num: u32,
}

impl Split {
    const fn new() -> Self {
        Split { new_obs: [0; 10], obs: [0; 10], num_new: 0, num: 0 }
    }

    #[inline(always)]
    pub(crate) fn literal(&mut self, b: u8) {
        self.new_obs[(((b >> 5) & 6) | (b & 1)) as usize] += 1;
        self.num_new += 1;
    }

    #[inline(always)]
    pub(crate) fn matched(&mut self, len: usize) {
        self.new_obs[8 + (len >= 9) as usize] += 1;
        self.num_new += 1;
    }

    /// Should a block that is `block_len` bytes long, with `remaining` bytes
    /// of payload after it, end here?
    #[inline(always)]
    pub(crate) fn ends_at(&mut self, block_len: usize, remaining: usize) -> bool {
        self.num_new >= 512
            && block_len >= MIN_BLOCK
            && remaining >= MIN_BLOCK
            && self.check(block_len)
    }

    /// Has what the block holds changed enough to end it at `block_len`?
    #[cold]
    fn check(&mut self, block_len: usize) -> bool {
        if self.num > 0 {
            let mut total_delta = 0u32;
            for i in 0..10 {
                let expected = self.obs[i] * self.num_new;
                let actual = self.new_obs[i] * self.num;
                total_delta += expected.abs_diff(actual);
            }
            let num_items = self.num + self.num_new;
            let mut cutoff = self.num_new * 200 / 512 * self.num;
            if block_len < 10000 && num_items < 8192 {
                cutoff += (cutoff as u64 * (8192 - num_items) as u64 / 8192) as u32;
            }
            if total_delta + (block_len as u32 / 4096) * self.num >= cutoff {
                return true;
            }
        }
        for i in 0..10 {
            self.obs[i] += self.new_obs[i];
            self.new_obs[i] = 0;
        }
        self.num += self.num_new;
        self.num_new = 0;
        false
    }
}

/// libdeflate's choice of the shortest match worth taking, from the number
/// of different bytes that occur.  Where few do, literals are cheap and short
/// matches are not worth their offset.
fn choose_min_len(used: u32, depth: u32) -> usize {
    const MIN_LENS: [u8; 80] = [
        9, 9, 9, 9, 9, 9, 8, 8, 7, 7, 6, 6, 6, 6, 6, 6, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5,
        5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
        4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4,
    ];
    let Some(&m) = MIN_LENS.get(used as usize) else { return 3 };
    let mut min_len = m as usize;
    if depth < 16 {
        min_len = min_len.min(if depth < 5 {
            4
        } else if depth < 10 {
            5
        } else {
            7
        });
    }
    min_len
}

/// `choose_min_len` for a block, from its first 4 KiB.
pub(crate) fn first_min_len(block: &[u8], depth: u32) -> usize {
    if block.len() < 512 {
        return MIN_MATCH;
    }
    let mut used = [0u8; 256];
    for &b in &block[..block.len().min(4096)] {
        used[b as usize] = 1;
    }
    choose_min_len(used.iter().map(|&u| u as u32).sum(), depth)
}

/// `choose_min_len` again, from the literals the block has used so far.
pub(crate) fn later_min_len(f_ll: &[u32; NUM_LL], depth: u32) -> usize {
    let total: u32 = f_ll[..256].iter().sum();
    let cutoff = total >> 10; // literals used very rarely do not count
    choose_min_len(f_ll[..256].iter().filter(|&&f| f > cutoff).count() as u32, depth)
}

/// One payload being searched.
struct Search<'a> {
    inp: &'a [u8],
    t: &'a mut Tables,
    /// The tables' sizes in bits: `h3`, and `h4` (at level 1: its buckets).
    o3: u32,
    o4: u32,
    /// `inp[base + p]` is the byte a position `p` in the tables stands for.
    /// A multiple of `WINDOW`.
    base: usize,
    /// The hash values of the position that comes next.
    nh3: usize,
    nh4: usize,
    depth: u32,
    nice: usize,
    seqs: &'a mut [Token],
    n_seqs: usize,
    /// Where the literals since the last match begin.
    run_start: usize,
    f_ll: &'a mut [u32; NUM_LL],
    f_off: &'a mut [u32; NUM_OFF],
    /// The block may be ended early, so `split` is kept.
    splitting: bool,
    split: &'a mut Split,
}

impl Search<'_> {
    #[inline(always)]
    fn at(&self, node: i32) -> usize {
        (self.base as isize + node as isize) as usize
    }

    #[inline(always)]
    fn literal(&mut self, pos: usize) {
        let b = self.inp[pos];
        self.f_ll[b as usize] += 1;
        if self.splitting {
            self.split.literal(b);
        }
    }

    /// A match of `len` bytes at `pos`, `dist` bytes back.
    #[inline(always)]
    fn matched(&mut self, pos: usize, len: usize, dist: usize) {
        debug_assert!((MIN_MATCH..=MAX_MATCH).contains(&len) && (1..=WINDOW).contains(&dist));
        debug_assert!(pos >= self.run_start && pos - self.run_start <= 0xFFFF);
        let (t, slot) = token(pos - self.run_start, len, dist);
        self.f_ll[FIRST_LEN + LEN_SLOT[len] as usize] += 1;
        self.f_off[slot & (NUM_OFF - 1)] += 1;
        if self.splitting {
            self.split.matched(len);
        }
        self.seqs[self.n_seqs] = t;
        self.n_seqs += 1;
        self.run_start = pos + len;
    }

    /// Does the block that began at `begin` go on at `pos`?
    #[inline(always)]
    fn goes_on(&mut self, begin: usize, pos: usize, soft_end: usize) -> bool {
        if pos >= soft_end {
            return false;
        }
        !(self.splitting && self.split.ends_at(pos - begin, self.inp.len() - pos))
    }

    /// The window moves on by its size: every position in the tables now
    /// counts from 32768 bytes later, and what falls out of reach stays out.
    #[cold]
    #[inline(never)]
    fn slide(&mut self) {
        let t = &mut *self.t;
        for e in t.h3.iter_mut().chain(t.h4.iter_mut()).chain(t.next.iter_mut()) {
            *e = if *e >= 0 { *e | i16::MIN } else { i16::MIN };
        }
        self.base += WINDOW;
    }

    // ---- level 1: two candidates per hash value -------------------------

    /// libdeflate's `ht_matchfinder_longest_match`: the longer of the up to
    /// two earlier positions with the hash of the four bytes at `pos`, which
    /// is entered.  `max_len` >= 5.  Returns length (0: none) and distance.
    #[inline(always)]
    fn ht_longest(&mut self, pos: usize, max_len: usize, nice_len: usize) -> (usize, usize) {
        let inp = self.inp;
        let mut cur_pos = pos - self.base;
        if cur_pos == WINDOW {
            self.slide();
            cur_pos = 0;
        }
        let cutoff = cur_pos as i32 - WINDOW as i32;
        let b = (2 * self.nh4) & 0xFFFE;
        self.nh4 = lz_hash(le32(inp, pos + 1), self.o4);
        let seq = le32(inp, pos);
        let first = self.t.h4[b] as i32;
        self.t.h4[b] = cur_pos as i16;
        if first <= cutoff {
            return (0, 0);
        }
        let m = self.at(first);
        let second = self.t.h4[b + 1] as i32;
        self.t.h4[b + 1] = first as i16;
        if le32(inp, m) == seq {
            let best_len = extend(inp, m, pos, 4, max_len);
            if second <= cutoff || best_len >= nice_len {
                return (best_len, pos - m);
            }
            let m2 = self.at(second);
            if le32(inp, m2) == seq && le32(inp, m2 + best_len - 3) == le32(inp, pos + best_len - 3)
            {
                let len = extend(inp, m2, pos, 4, max_len);
                if len > best_len {
                    return (len, pos - m2);
                }
            }
            (best_len, pos - m)
        } else {
            if second <= cutoff {
                return (0, 0);
            }
            let m2 = self.at(second);
            if le32(inp, m2) == seq {
                return (extend(inp, m2, pos, 4, max_len), pos - m2);
            }
            (0, 0)
        }
    }

    /// libdeflate's `ht_matchfinder_skip_bytes`: enters `count` positions
    /// from `pos` on, without searching.
    #[inline(always)]
    fn ht_skip(&mut self, pos: usize, count: usize) {
        let inp = self.inp;
        if count + 5 > inp.len() - pos {
            return;
        }
        let mut cur_pos = (pos - self.base) as i32;
        if cur_pos as usize + count > WINDOW {
            self.slide();
            cur_pos -= WINDOW as i32;
        }
        let mut hash = self.nh4;
        let o4 = self.o4;
        let h4 = &mut self.t.h4;
        for w in inp[pos + 1..pos + count + 4].windows(4) {
            let b = (2 * hash) & 0xFFFE;
            h4[b + 1] = h4[b];
            h4[b] = cur_pos as i16;
            hash = lz_hash(u32::from_le_bytes(w.try_into().unwrap()), o4);
            cur_pos += 1;
        }
        self.nh4 = hash;
    }

    /// Level 1's block from `begin`.  Returns where it ends.
    fn fastest(&mut self, begin: usize, soft_end: usize) -> usize {
        let n = self.inp.len();
        let mut pos = begin;
        let mut max_len = MAX_MATCH;
        let mut nice_len = self.nice.min(max_len);
        loop {
            let remaining = n - pos;
            if remaining < MAX_MATCH {
                max_len = remaining;
                if max_len < 5 {
                    while pos < n {
                        self.literal(pos);
                        pos += 1;
                    }
                    break;
                }
                nice_len = nice_len.min(max_len);
            }
            let (len, dist) = self.ht_longest(pos, max_len, nice_len);
            if len != 0 {
                self.matched(pos, len, dist);
                self.ht_skip(pos + 1, len - 1);
                pos += len;
            } else {
                self.literal(pos);
                pos += 1;
            }
            if pos >= soft_end || self.n_seqs >= FAST_MAX_SEQS {
                break;
            }
        }
        pos
    }

    // ---- levels 2 to 9: a chain of candidates per hash value ------------

    /// libdeflate's `hc_matchfinder_longest_match`: the longest match at
    /// `pos` that is longer than `best_len`, among the first `depth`
    /// candidates; `pos` is entered into the tables.  Returns its length
    /// (`best_len` if there is none) and distance.
    #[inline(always)]
    fn hc_longest(
        &mut self,
        pos: usize,
        mut best_len: usize,
        max_len: usize,
        nice_len: usize,
        mut depth: u32,
    ) -> (usize, usize) {
        let inp = self.inp;
        let mut cur_pos = pos - self.base;
        if cur_pos == WINDOW {
            self.slide();
            cur_pos = 0;
        }
        let cutoff = cur_pos as i32 - WINDOW as i32;
        if max_len < 5 {
            return (best_len, 0); // four bytes cannot be read at pos + 1
        }
        let (h3, h4) = (self.nh3 & 0x7FFF, self.nh4 & 0xFFFF);
        let node3 = self.t.h3[h3] as i32;
        let mut node4 = self.t.h4[h4] as i32;
        self.t.h3[h3] = cur_pos as i16;
        self.t.h4[h4] = cur_pos as i16;
        self.t.next[cur_pos & (WINDOW - 1)] = node4 as i16;
        let next_seq = le32(inp, pos + 1);
        self.nh3 = lz_hash(next_seq & 0xFF_FFFF, self.o3);
        self.nh4 = lz_hash(next_seq, self.o4);

        let mut best = pos;
        macro_rules! advance {
            ($out:lifetime) => {
                node4 = self.t.next[node4 as usize & (WINDOW - 1)] as i32;
                depth -= 1;
                if node4 <= cutoff || depth == 0 {
                    break $out;
                }
            };
        }
        'out: {
            let seq4 = le32(inp, pos);
            if best_len < 4 {
                if node3 <= cutoff {
                    break 'out;
                }
                if best_len < 3 {
                    let m = self.at(node3);
                    if (le32(inp, m) ^ seq4) & 0xFF_FFFF == 0 {
                        best_len = 3;
                        best = m;
                    }
                }
                if node4 <= cutoff {
                    break 'out;
                }
                // The first candidate that begins with the same four bytes.
                let mut m;
                loop {
                    m = self.at(node4);
                    if le32(inp, m) == seq4 {
                        break;
                    }
                    advance!('out);
                }
                best = m;
                best_len = extend(inp, m, pos, 4, max_len);
                if best_len >= nice_len {
                    break 'out;
                }
                advance!('out);
            } else if node4 <= cutoff || best_len >= nice_len {
                break 'out;
            }
            // Candidates that are longer than the best so far: the byte that
            // would make them longer is looked at first.
            loop {
                let mut m;
                loop {
                    m = self.at(node4);
                    if le32(inp, m + best_len - 3) == le32(inp, pos + best_len - 3)
                        && le32(inp, m) == seq4
                    {
                        break;
                    }
                    advance!('out);
                }
                let len = extend(inp, m, pos, 4, max_len);
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
        (best_len, pos - best)
    }

    /// libdeflate's `hc_matchfinder_skip_bytes`: enters `count` positions
    /// from `pos` on, without searching.
    #[inline(always)]
    fn hc_skip(&mut self, pos: usize, count: usize) {
        let inp = self.inp;
        if count + 5 > inp.len() - pos {
            return;
        }
        let mut cur_pos = pos - self.base;
        let (mut h3, mut h4) = (self.nh3, self.nh4);
        let (o3, o4) = (self.o3, self.o4);
        for w in inp[pos + 1..pos + count + 4].windows(4) {
            if cur_pos == WINDOW {
                self.slide();
                cur_pos = 0;
            }
            let t = &mut *self.t;
            t.h3[h3 & 0x7FFF] = cur_pos as i16;
            t.next[cur_pos & (WINDOW - 1)] = t.h4[h4 & 0xFFFF];
            t.h4[h4 & 0xFFFF] = cur_pos as i16;
            let seq = u32::from_le_bytes(w.try_into().unwrap());
            h3 = lz_hash(seq & 0xFF_FFFF, o3);
            h4 = lz_hash(seq, o4);
            cur_pos += 1;
        }
        self.nh3 = h3;
        self.nh4 = h4;
    }

    /// A block of levels 2 to 4 from `begin`: the longest match at each
    /// position is taken.  Returns where the block ends.
    fn greedy(&mut self, begin: usize, soft_end: usize) -> usize {
        let n = self.inp.len();
        let mut pos = begin;
        let mut max_len = MAX_MATCH;
        let mut nice_len = self.nice.min(max_len);
        let min_len = first_min_len(&self.inp[begin..soft_end], self.depth);
        loop {
            if n - pos < MAX_MATCH {
                max_len = n - pos;
                nice_len = nice_len.min(max_len);
            }
            let (len, dist) = self.hc_longest(pos, min_len - 1, max_len, nice_len, self.depth);
            if len >= min_len && (len > MIN_MATCH || dist <= 4096) {
                self.matched(pos, len, dist);
                self.hc_skip(pos + 1, len - 1);
                pos += len;
            } else {
                self.literal(pos);
                pos += 1;
            }
            if !self.goes_on(begin, pos, soft_end) {
                break;
            }
        }
        pos
    }

    /// A block of levels 5 to 9 from `begin`: before a match is taken, the
    /// next position (with `two`, the next two) is searched for a better
    /// one.  Returns where the block ends.
    fn lazy(&mut self, begin: usize, soft_end: usize, two: bool) -> usize {
        let n = self.inp.len();
        let mut pos = begin;
        let mut max_len = MAX_MATCH;
        let mut nice_len = self.nice.min(max_len);
        let mut min_len = first_min_len(&self.inp[begin..soft_end], self.depth);
        let mut next_recalc = pos + (n - pos).min(10000);
        // Is a match of `nl` bytes at distance `no` better than one of `cl`
        // at `co` by more than `by`?  A byte counts for four, and so does a
        // distance sixteen times shorter.
        let better = |nl: usize, no: usize, cl: usize, co: usize, by: i32| {
            nl >= cl
                && 4 * (nl - cl) as i32 + (no.leading_zeros() as i32 - co.leading_zeros() as i32)
                    > by
        };
        loop {
            'step: {
                if pos >= next_recalc {
                    min_len = later_min_len(self.f_ll, self.depth);
                    next_recalc += (n - next_recalc).min(pos - begin);
                }
                if n - pos < MAX_MATCH {
                    max_len = n - pos;
                    nice_len = nice_len.min(max_len);
                }
                let (mut cur_len, mut cur_dist) =
                    self.hc_longest(pos, min_len - 1, max_len, nice_len, self.depth);
                if cur_len < min_len || (cur_len == MIN_MATCH && cur_dist > 8192) {
                    self.literal(pos);
                    pos += 1;
                    break 'step;
                }
                pos += 1;
                // A match at pos - 1.
                loop {
                    if cur_len >= nice_len {
                        self.matched(pos - 1, cur_len, cur_dist);
                        self.hc_skip(pos, cur_len - 1);
                        pos += cur_len - 1;
                        break 'step;
                    }
                    // The next position, with half the candidates.
                    if n - pos < MAX_MATCH {
                        max_len = n - pos;
                        nice_len = nice_len.min(max_len);
                    }
                    let (next_len, next_dist) =
                        self.hc_longest(pos, cur_len - 1, max_len, nice_len, self.depth >> 1);
                    pos += 1;
                    if better(next_len, next_dist, cur_len, cur_dist, 2) {
                        self.literal(pos - 2);
                        cur_len = next_len;
                        cur_dist = next_dist;
                        continue;
                    }
                    if two {
                        // And the one after it, with a quarter.
                        if n - pos < MAX_MATCH {
                            max_len = n - pos;
                            nice_len = nice_len.min(max_len);
                        }
                        let (next_len, next_dist) =
                            self.hc_longest(pos, cur_len - 1, max_len, nice_len, self.depth >> 2);
                        pos += 1;
                        if better(next_len, next_dist, cur_len, cur_dist, 6) {
                            self.literal(pos - 3);
                            self.literal(pos - 2);
                            cur_len = next_len;
                            cur_dist = next_dist;
                            continue;
                        }
                        self.matched(pos - 3, cur_len, cur_dist);
                        if cur_len > 3 {
                            self.hc_skip(pos, cur_len - 3);
                            pos += cur_len - 3;
                        }
                    } else {
                        self.matched(pos - 2, cur_len, cur_dist);
                        self.hc_skip(pos, cur_len - 2);
                        pos += cur_len - 2;
                    }
                    break 'step;
                }
            }
            if !self.goes_on(begin, pos, soft_end) {
                break;
            }
        }
        pos
    }
}

/// The table sizes for a payload of up to `1 << lg` bytes (`lg` from 8 to
/// 15), in bits.  libdeflate's are 15 for level 1 and 15 and 16 above it,
/// whatever the payload; these are what a payload needs, so that there is
/// less to clear and less of the cache is taken.  With twice as many
/// entries as the payload has bytes (four times, for the chains' heads) the
/// output is within 0.1% of what libdeflate's sizes give, and the search is
/// as fast as it gets: with fewer entries more of them hold a position that
/// only has the same hash, and those cost a comparison each.
pub(crate) const fn fast_order(lg: u32) -> u32 {
    if lg + 1 > 15 {
        15
    } else {
        lg + 1
    }
}

pub(crate) const fn chain_orders(lg: u32) -> (u32, u32) {
    (fast_order(lg), if lg + 2 > 16 { 16 } else { lg + 2 })
}

/// The smallest `k` with `n <= 1 << k`.
fn ceil_log2(n: usize) -> u32 {
    n.max(1).next_power_of_two().trailing_zeros()
}

/// What a compressor of levels 1 to 9 keeps.
pub(crate) struct Levels {
    parse: Parse,
    depth: u32,
    nice: usize,
    /// Use the searches of `fast.rs` where they apply.
    pub(crate) fast: bool,
    pub(crate) stats: Stats,
    t: Box<Tables>,
    seqs: Vec<Token>,
    f_ll: [u32; NUM_LL],
    f_off: [u32; NUM_OFF],
    own: Box<Codes>,
    split: Split,
}

impl Levels {
    pub(crate) fn new(level: u8) -> Self {
        let (parse, depth, nice) = PARAMS[level as usize];
        // Zeroed where they are allocated.  The tables are 256 KiB of which
        // a compressor of small payloads never touches most, so they must
        // not be built on the stack and copied.
        // SAFETY: the layout is T's and not of size zero; T is integers and
        // arrays of integers, for which all-zero bytes are a valid value.
        unsafe fn zeroed<T>() -> Box<T> {
            let layout = std::alloc::Layout::new::<T>();
            let p = std::alloc::alloc_zeroed(layout).cast::<T>();
            if p.is_null() {
                std::alloc::handle_alloc_error(layout);
            }
            Box::from_raw(p)
        }
        let (t, own): (Box<Tables>, Box<Codes>) = unsafe { (zeroed(), zeroed()) };
        Levels {
            parse,
            depth,
            nice,
            fast: true,
            stats: Stats::default(),
            t,
            seqs: Vec::new(),
            f_ll: [0; NUM_LL],
            f_off: [0; NUM_OFF],
            own,
            split: Split::new(),
        }
    }

    /// The bytes the output buffer must have for a payload of `n` bytes:
    /// the 18 of gzip; for every block no more than storing it takes (its
    /// bytes and up to 6 more); and 136 for what `write_block` writes beyond
    /// the bits of a block that turns out short.
    pub(crate) fn room(n: usize) -> usize {
        18 + n + 6 * (n / MIN_BLOCK + 1) + 136
    }

    /// Writes `inp` as DEFLATE blocks at `out`, which has `cap` >=
    /// `room(inp.len()) - 18` bytes.  Returns the number of bits written.
    pub(crate) unsafe fn deflate(&mut self, inp: &[u8], out: *mut u8, cap: usize) -> usize {
        let n = inp.len();
        let need = (n.min(0xFFFF) / 3 + 2).min(MAX_BLOCK_SEQS + 1);
        if self.seqs.len() < need {
            self.seqs.resize(need, 0);
        }
        let lg = ceil_log2(n).clamp(8, 15);
        if self.fast && n <= WINDOW {
            if let Some(bits) = self.deflate_fast(inp, lg, out, cap) {
                return bits;
            }
        }
        self.deflate_plain(inp, lg, out, cap)
    }

    /// `deflate` with the searches of `fast.rs`, if they take the payload.
    unsafe fn deflate_fast(&mut self, inp: &[u8], lg: u32, out: *mut u8, cap: usize) -> Option<usize> {
        use crate::fast::{chains_take, fastest, fastest_takes, greedy, lazy, Chains, Resume, Sink};
        let n = inp.len();
        // Where a search counts and writes down what it finds, with the
        // counts at zero.  Made anew for every block: these are pointers
        // into `self`, and they are not used again once `self` has been.
        macro_rules! sink {
            () => {{
                self.f_ll = [0; NUM_LL];
                self.f_off = [0; NUM_OFF];
                Sink {
                    f_ll: self.f_ll.as_mut_ptr(),
                    f_off: self.f_off.as_mut_ptr(),
                    seqs: self.seqs.as_mut_ptr(),
                    max_seqs: self.seqs.len(),
                }
            }};
        }
        // Each search exists once per table size, the size being a constant
        // in it.
        macro_rules! by_size {
            ($size:expr; $o:ident => $then:expr; $($n:literal)+) => {
                match $size {
                    $($n => {
                        const $o: u32 = $n;
                        $then
                    })+
                    _ => unreachable!(),
                }
            };
        }

        if self.parse == Parse::Fastest {
            let tab = self.t.h4.as_mut_ptr().cast::<u32>();
            let n_seqs = by_size!(fast_order(lg); O => {
                if !fastest_takes::<O>(inp) {
                    return None;
                }
                // Zeroed as bytes: there is no faster way.
                core::ptr::write_bytes(tab, 0, 1 << O);
                fastest::<O>(inp, tab, sink!())
            }; 9 10 11 12 13 14 15);
            self.f_ll[EOB] = 1;
            let tokens = &self.seqs[..n_seqs];
            return Some(finish_block(
                &mut self.own, &mut self.stats, &self.f_ll, &self.f_off, inp, tokens, out, cap, 0, true,
            ));
        }

        let c = Chains {
            ip: inp.as_ptr(),
            n,
            h3: self.t.h3.as_mut_ptr().cast(),
            h4: self.t.h4.as_mut_ptr().cast(),
            next: self.t.next.as_mut_ptr().cast(),
            depth: self.depth,
            nice: self.nice,
        };
        if !by_size!(lg; LG => chains_take::<LG>(inp); 8 9 10 11 12 13 14 15) {
            return None;
        }
        let (o3, o4) = chain_orders(lg);
        core::ptr::write_bytes(c.h3, 0, 1 << o3);
        core::ptr::write_bytes(c.h4, 0, 1 << o4);
        let mut st = Resume::default();
        let mut bitpos = 0;
        loop {
            let begin = st.pos;
            // A block can only be ended early if both parts are long enough.
            let split: *mut Split = if n - begin >= 2 * MIN_BLOCK {
                self.split = Split::new();
                &mut self.split
            } else {
                core::ptr::null_mut()
            };
            let min_len = first_min_len(&inp[begin..], self.depth);
            let sink = sink!();
            let n_seqs = by_size!(lg; LG => match self.parse {
                Parse::Greedy => greedy::<LG>(c, min_len, sink, &mut st, split),
                Parse::Lazy => lazy::<LG>(c, min_len, false, sink, &mut st, split),
                _ => lazy::<LG>(c, min_len, true, sink, &mut st, split),
            }; 8 9 10 11 12 13 14 15);
            let last = st.pos == n;
            self.f_ll[EOB] = 1;
            let (block, tokens) = (&inp[begin..st.pos], &self.seqs[..n_seqs]);
            bitpos = finish_block(
                &mut self.own, &mut self.stats, &self.f_ll, &self.f_off, block, tokens, out, cap, bitpos, last,
            );
            if last {
                return Some(bitpos);
            }
        }
    }

    /// `deflate` with the plain searches: any payload.
    unsafe fn deflate_plain(&mut self, inp: &[u8], lg: u32, out: *mut u8, cap: usize) -> usize {
        let n = inp.len();
        // libdeflate's table sizes once the window is full.
        let (o3, o4) = if self.parse == Parse::Fastest {
            (0, if n > WINDOW { 15 } else { fast_order(lg) })
        } else if n > WINDOW {
            (15, 16)
        } else {
            chain_orders(lg)
        };
        if self.parse == Parse::Fastest {
            self.t.h4[..2 << o4].fill(NONE);
        } else {
            self.t.h3[..1 << o3].fill(NONE);
            self.t.h4[..1 << o4].fill(NONE);
        }
        let mut s = Search {
            inp,
            t: &mut self.t,
            o3,
            o4,
            base: 0,
            nh3: 0,
            nh4: 0,
            depth: self.depth,
            nice: self.nice,
            seqs: &mut self.seqs,
            n_seqs: 0,
            run_start: 0,
            f_ll: &mut self.f_ll,
            f_off: &mut self.f_off,
            splitting: false,
            split: &mut self.split,
        };
        let mut bitpos = 0;
        let mut begin = 0;
        loop {
            let rem = n - begin;
            let soft_end =
                if rem <= 0xFFFF { n } else { begin + SOFT_MAX_BLOCK.min(rem - MIN_BLOCK) };
            *s.f_ll = [0; NUM_LL];
            *s.f_off = [0; NUM_OFF];
            s.n_seqs = 0;
            s.run_start = begin;
            s.splitting = self.parse != Parse::Fastest && rem >= 2 * MIN_BLOCK;
            if s.splitting {
                *s.split = Split::new();
            }
            let end = if n == 0 {
                0
            } else {
                match self.parse {
                    Parse::Fastest => s.fastest(begin, soft_end),
                    Parse::Greedy => s.greedy(begin, soft_end),
                    Parse::Lazy => s.lazy(begin, soft_end, false),
                    Parse::Lazy2 => s.lazy(begin, soft_end, true),
                }
            };
            debug_assert!((end > begin || n == 0) && end - begin <= 0xFFFF);
            let last = end == n;
            s.f_ll[EOB] = 1;
            let (block, tokens) = (&inp[begin..end], &s.seqs[..s.n_seqs]);
            bitpos = finish_block(
                &mut self.own, &mut self.stats, s.f_ll, s.f_off, block, tokens, out, cap, bitpos, last,
            );
            if last {
                return bitpos;
            }
            begin = end;
        }
    }
}

/// Writes one block at bit `bitpos` of `out` with whichever is smallest:
/// codes made for it, the fixed codes, or none (as libdeflate chooses, and
/// with its preference when two are equal).  Returns the new bit position.
#[allow(clippy::too_many_arguments)]
unsafe fn finish_block(
    own: &mut Codes,
    stats: &mut Stats,
    f_ll: &[u32; NUM_LL],
    f_off: &[u32; NUM_OFF],
    block: &[u8],
    tokens: &[Token],
    out: *mut u8,
    cap: usize,
    bitpos: usize,
    last: bool,
) -> usize {
    // What the fixed codes would take, and the extra bits that any codes
    // take.
    let mut fixed_bits = 3u32;
    for (&f, &l) in f_ll[..USED_LL].iter().zip(&FIXED.ll_lens) {
        fixed_bits += f * l as u32;
    }
    let mut extra = 0u32;
    for (&f, &e) in f_ll[FIRST_LEN..FIRST_LEN + NUM_LEN].iter().zip(&LEN_EXTRA) {
        extra += f * e as u32;
    }
    for (&f, &e) in f_off[..USED_OFF].iter().zip(&OFF_EXTRA) {
        extra += f * e as u32;
        fixed_bits += f * 5;
    }
    fixed_bits += extra;
    let used = (bitpos & 7) as u32;
    let stored_bits = 3 + ((8 - (used + 3) % 8) % 8) + 32 + 8 * block.len() as u32;

    own.build_own(f_ll, f_off);
    let mut own_bits = own.hdr_bits + extra;
    for (&f, &l) in f_ll[..USED_LL].iter().zip(&own.ll_lens) {
        own_bits += f * l as u32;
    }
    for (&f, &l) in f_off[..USED_OFF].iter().zip(&own.off_lens) {
        own_bits += f * l as u32;
    }

    if stored_bits <= fixed_bits && stored_bits <= own_bits {
        stats.stored += 1;
        return stored_at(block, out, cap, bitpos, last);
    }
    let c: &Codes = if fixed_bits <= own_bits {
        stats.fixed += 1;
        &FIXED
    } else {
        stats.own_codes += 1;
        own
    };
    let end = write_block(c, block.as_ptr(), block.len(), tokens, out, cap, bitpos, last);
    debug_assert_eq!(end - bitpos, own_bits.min(fixed_bits) as usize);
    end
}
