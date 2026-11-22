//! EXPERIMENT: the searches of levels 2 to 9 in a payload of more than 32768
//! bytes.  One loop (`search`), and two ways of finding matches for it:
//! rows of four entries (`Rows4`) and chains (`Chain`).

use crate::fast::{at32, at64, extend_at, fetch, lz_hash, raw_at32, rebase, Resume, Sink, WINDOW};
use crate::levels::{later_min_len, Split, MAX_SEQS};
use crate::tables::*;
use crate::write::token;
use core::ptr;

/// A way of finding matches.  Positions are given as entries: a position
/// less `off`, plus `ONE`; `ent` is the address that the byte of entry 0
/// would have.
pub(crate) trait Finder: Copy {
    const ONE: usize;
    /// The shortest match it finds.
    const SHORTEST: usize;
    /// What the tables hold for a position.
    type Probe: Copy;
    fn depth(self) -> u32;
    fn nice(self) -> usize;
    /// The hashes of the entry `e`.
    unsafe fn hash_at(self, ent: *const u8, e: usize) -> (usize, usize);
    unsafe fn probe(self, ent: *const u8, e: usize, wd: u64, h: (usize, usize)) -> Self::Probe;
    /// Is there certainly no match at `e`?
    fn none(self, p: &Self::Probe, e: usize) -> bool;
    /// Enters `e`, whose eight bytes are `wd`; `h` becomes the hashes of
    /// the entry after it.
    unsafe fn enter(self, ent: *const u8, e: usize, wd: u64, p: &Self::Probe, h: &mut (usize, usize));
    /// Enters `e` likewise and returns the longest match there that is
    /// longer than `longer`, as (length, distance); if there is none, a
    /// length that is no longer than that.  `look` is 0, or 1 or 2 for the
    /// first and second position after a match.
    #[allow(clippy::too_many_arguments)]
    unsafe fn find(
        self,
        ent: *const u8,
        end: usize,
        e: usize,
        wd: u64,
        p: &Self::Probe,
        h: &mut (usize, usize),
        longer: usize,
        look: u32,
    ) -> (usize, usize);
    /// Enters the `count` entries from `from` on.
    unsafe fn enter_run(self, ent: *const u8, h: &mut (usize, usize), from: usize, count: usize);
    /// Makes room in the tables: every entry is reduced by 32768.
    unsafe fn slide(self);
}

// ---- rows of four ------------------------------------------------------------

/// Words in the table of rows: 128 KiB.
pub(crate) const ROW_WORDS: usize = 1 << 14;

/// A table of rows, each a word of four entries of 16 bits, the most recent
/// lowest; zeroed.  An entry of 0 that was never written stands for the
/// position that entry 0 stands for, like any other, and is found not to
/// match or to be out of reach.
#[derive(Clone, Copy)]
pub(crate) struct Rows4 {
    pub tab: *mut u64,
}

#[inline(always)]
fn row_of(seq: u32) -> usize {
    lz_hash(seq, ROW_WORDS.trailing_zeros())
}

impl Finder for Rows4 {
    const ONE: usize = 0;
    const SHORTEST: usize = 4;
    /// The row, and the first place in it whose entry has the four bytes
    /// (4 if none has).
    type Probe = (u64, usize);
    #[inline(always)]
    fn depth(self) -> u32 {
        4
    }
    #[inline(always)]
    fn nice(self) -> usize {
        MAX_MATCH
    }
    #[inline(always)]
    unsafe fn hash_at(self, ent: *const u8, e: usize) -> (usize, usize) {
        (0, row_of(at32(ent, e)))
    }
    #[inline(always)]
    unsafe fn probe(self, ent: *const u8, _e: usize, wd: u64, h: (usize, usize)) -> Self::Probe {
        let row = *self.tab.add(h.1);
        let w = wd as u32;
        let mut j = 0;
        while j < 4 {
            if at32(ent, (row >> (16 * j)) as usize & 0xFFFF) == w {
                break;
            }
            j += 1;
        }
        (row, j)
    }
    #[inline(always)]
    fn none(self, p: &Self::Probe, _e: usize) -> bool {
        p.1 == 4
    }
    #[inline(always)]
    unsafe fn enter(self, _ent: *const u8, e: usize, wd: u64, p: &Self::Probe, h: &mut (usize, usize)) {
        *self.tab.add(h.1) = p.0 << 16 | e as u64;
        h.1 = row_of((wd >> 8) as u32);
    }
    #[inline(always)]
    unsafe fn find(
        self,
        ent: *const u8,
        end: usize,
        e: usize,
        wd: u64,
        p: &Self::Probe,
        h: &mut (usize, usize),
        longer: usize,
        _look: u32,
    ) -> (usize, usize) {
        self.enter(ent, e, wd, p, h);
        let row = p.0;
        let (mut best_len, mut best) = (longer, e);
        let mut j = p.1;
        while j < 4 {
            let c = (row >> (16 * j)) as usize & 0xFFFF;
            j += 1;
            let x = at64(ent, c) ^ wd;
            if x as u32 != 0 {
                continue;
            }
            // Within reach is up to 32767 back; what is older than an entry
            // out of reach is out of reach too.
            if e.wrapping_sub(c).wrapping_sub(1) >= WINDOW - 1 {
                break;
            }
            let mut l = (x.trailing_zeros() >> 3) as usize;
            if l == 8 {
                let max_len = (end - e).min(MAX_MATCH);
                if best_len >= 8 {
                    if best_len >= max_len {
                        break;
                    }
                    if raw_at32(ent, c + best_len - 3) != raw_at32(ent, e + best_len - 3) {
                        continue;
                    }
                }
                l = extend_at(ent, end, c, e, 8, max_len);
                if l > best_len {
                    best_len = l;
                    best = c;
                    if l == max_len {
                        break;
                    }
                }
            } else if l > best_len {
                best_len = l;
                best = c;
            }
        }
        (best_len, e - best)
    }
    #[inline(always)]
    unsafe fn enter_run(self, ent: *const u8, h: &mut (usize, usize), from: usize, count: usize) {
        let mut hh = h.1;
        let mut q = from;
        let stop = from + count;
        while q < stop {
            debug_assert!(q < 2 * WINDOW && hh < ROW_WORDS);
            let t = self.tab.add(hh);
            *t = *t << 16 | q as u64;
            hh = row_of(at32(ent, q + 1));
            q += 1;
        }
        h.1 = hh;
    }
    #[cold]
    #[inline(never)]
    unsafe fn slide(self) {
        rebase(&[(self.tab.cast::<u16>(), 4 * ROW_WORDS)]);
    }
}

// ---- chains ------------------------------------------------------------------

/// libdeflate's tables: where a hash of three and of four bytes was last
/// seen, and for every position the one before it with the same hash of four
/// bytes.  Without `H3` the first of them is left alone, and no match is
/// shorter than four bytes.  With `HOPS` a position holds the four before it
/// (`links`), not one (`next`).  An entry of 0 stands for nothing.
#[derive(Clone, Copy)]
pub(crate) struct Chain<const H3: bool, const HOPS: bool> {
    pub h3: *mut u16,
    pub h4: *mut u16,
    pub next: *mut u16,
    pub links: *mut u64,
    pub depth: u32,
    pub nice: usize,
}

impl<const H3: bool, const HOPS: bool> Chain<H3, HOPS> {
    /// Stores `e` at the head of its chains, whose heads were `p`.
    #[inline(always)]
    unsafe fn store(self, e: usize, p: &(usize, usize), h: &(usize, usize)) -> u64 {
        debug_assert!((1..2 * WINDOW).contains(&e));
        if H3 {
            *self.h3.add(h.0) = e as u16;
        }
        *self.h4.add(h.1) = e as u16;
        if HOPS {
            let ahead = *self.links.add(p.1 & (WINDOW - 1));
            *self.links.add(e & (WINDOW - 1)) = ahead << 16 | p.1 as u64;
            ahead
        } else {
            *self.next.add(e & (WINDOW - 1)) = p.1 as u16;
            0
        }
    }
    #[inline(always)]
    fn hashes(seq: u32) -> (usize, usize) {
        (if H3 { lz_hash(seq & 0xFF_FFFF, 15) } else { 0 }, lz_hash(seq, 16))
    }
}

impl<const H3: bool, const HOPS: bool> Finder for Chain<H3, HOPS> {
    const ONE: usize = 1;
    const SHORTEST: usize = if H3 { 3 } else { 4 };
    /// What the two tables hold for the position.
    type Probe = (usize, usize);
    #[inline(always)]
    fn depth(self) -> u32 {
        self.depth
    }
    #[inline(always)]
    fn nice(self) -> usize {
        self.nice
    }
    #[inline(always)]
    unsafe fn hash_at(self, ent: *const u8, e: usize) -> (usize, usize) {
        Self::hashes(at32(ent, e))
    }
    #[inline(always)]
    unsafe fn probe(self, _ent: *const u8, _e: usize, _wd: u64, h: (usize, usize)) -> Self::Probe {
        (if H3 { *self.h3.add(h.0) as usize } else { 0 }, *self.h4.add(h.1) as usize)
    }
    #[inline(always)]
    fn none(self, p: &Self::Probe, e: usize) -> bool {
        (if H3 { p.0 } else { p.1 }) <= e.saturating_sub(WINDOW)
    }
    #[inline(always)]
    unsafe fn enter(self, _ent: *const u8, e: usize, wd: u64, p: &Self::Probe, h: &mut (usize, usize)) {
        self.store(e, p, h);
        *h = Self::hashes((wd >> 8) as u32);
    }
    #[inline(always)]
    unsafe fn find(
        self,
        ent: *const u8,
        end: usize,
        e: usize,
        wd: u64,
        p: &Self::Probe,
        h: &mut (usize, usize),
        longer: usize,
        look: u32,
    ) -> (usize, usize) {
        let (node3, node4) = *p;
        let mut ahead = self.store(e, p, h);
        *h = Self::hashes((wd >> 8) as u32);
        if H3 {
            fetch(self.h3.add(h.0));
        }
        fetch(self.h4.add(h.1));
        let lim = e.saturating_sub(WINDOW);
        let max_len = (end - e).min(MAX_MATCH);
        let nice_len = self.nice.min(max_len);
        let mut depth = self.depth >> look;
        let mut best_len = longer;
        let mut best = e;
        'out: {
            let seq4 = wd as u32;
            if best_len < 4 {
                if H3 {
                    if node3 <= lim {
                        break 'out;
                    }
                    if best_len < 3 && (at32(ent, node3) ^ seq4) & 0xFF_FFFF == 0 {
                        best_len = 3;
                        best = node3;
                    }
                }
                if node4 <= lim {
                    break 'out;
                }
            } else if node4 <= lim || best_len >= nice_len {
                break 'out;
            }
            // The chain, from `node4` on: one comparison of the four bytes
            // that would make a candidate longer than the best so far (its
            // first four, as long as there is no match of four), and what
            // leads to the next candidate.
            let mut tail_at = best_len.max(3) - 3;
            let mut tail = raw_at32(ent, e + tail_at);
            let mut tails = ent.wrapping_add(tail_at);
            macro_rules! passes {
                ($node:expr) => {{
                    let node: usize = $node;
                    debug_assert!(node >= 1 && node < e && node + tail_at + 4 <= end);
                    ptr::read_unaligned(tails.wrapping_add(node) as *const u32) == tail
                }};
            }
            let mut node = node4;
            let mut pass = passes!(node);
            let (mut link, mut in_hand) = (0u64, 0u32);
            loop {
                if pass && at32(ent, node) == seq4 {
                    let len = extend_at(ent, end, node, e, 4, max_len);
                    if len > best_len {
                        best_len = len;
                        best = node;
                        if best_len >= nice_len {
                            break 'out;
                        }
                        tail_at = best_len - 3;
                        tail = raw_at32(ent, e + tail_at);
                        tails = ent.wrapping_add(tail_at);
                    }
                }
                depth -= 1;
                if depth == 0 {
                    break 'out;
                }
                if HOPS {
                    node = 'found: loop {
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
                        while depth > 4 {
                            link = ahead;
                            ahead = *self.links.add((link >> 48) as usize & (WINDOW - 1));
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
                        ahead = *self.links.add((link >> 48) as usize & (WINDOW - 1));
                        in_hand = 4;
                    };
                } else {
                    loop {
                        node = *self.next.add(node & (WINDOW - 1)) as usize;
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
        (best_len, e - best)
    }
    #[inline(always)]
    unsafe fn enter_run(self, ent: *const u8, h: &mut (usize, usize), from: usize, count: usize) {
        let mut hh = *h;
        let mut q = from;
        let stop = from + count;
        while q < stop {
            let head = *self.h4.add(hh.1) as usize;
            self.store(q, &(0, head), &hh);
            hh = Self::hashes(at32(ent, q + 1));
            q += 1;
        }
        *h = hh;
        if H3 {
            fetch(self.h3.add(hh.0));
        }
        fetch(self.h4.add(hh.1));
    }
    #[cold]
    #[inline(never)]
    unsafe fn slide(self) {
        let chain = if HOPS { (self.links.cast::<u16>(), 4 * WINDOW) } else { (self.next, WINDOW) };
        rebase(&[(self.h3, 1 << 15), (self.h4, 1 << 16), chain]);
    }
}

// ---- the loop ------------------------------------------------------------------

/// A block of the payload `ip[..n]` from where `st` says: `PARSE` 0 takes
/// the longest match at each position, 1 first looks at the next position
/// for a better one, 2 at the next two.  Returns the number of matches; `st`
/// then says where the next block begins.
#[allow(clippy::too_many_arguments)]
pub(crate) unsafe fn search<F: Finder, const PARSE: u8>(
    f: F,
    ip: *const u8,
    n: usize,
    mut min_len: usize,
    sink: Sink,
    st: &mut Resume,
    split: *mut Split,
    splitting: bool,
    soft_end: usize,
) -> usize {
    debug_assert!(n > WINDOW && min_len >= F::SHORTEST);
    let f_ll = sink.f_ll;
    // All of these are entries.
    let mut off = st.win;
    let mut ent = ip.wrapping_add(off).wrapping_sub(F::ONE);
    let mut e = st.pos + F::ONE - off;
    let mut end = n + F::ONE - off;
    let mut soft = soft_end + F::ONE - off;
    let mut begin = e;
    let mut run_start = e;
    let mut h = if st.pos == 0 { f.hash_at(ent, e) } else { st.nh };
    let mut n_seqs = 0usize;
    // The literals before `run_start`.
    let mut lits = 0usize;
    let mut recalc = if PARSE != 0 { e + (end - e).min(10000) } else { usize::MAX };
    // Steps are taken without a question below this entry.
    let mut stop = 0usize;
    // Positions are entered without one if the last is below this.
    let mut enter_end = (2 * WINDOW).min(end - 8);

    macro_rules! slide {
        () => {{
            f.slide();
            off += WINDOW;
            ent = ent.wrapping_add(WINDOW);
            e -= WINDOW;
            end -= WINDOW;
            soft -= WINDOW;
            recalc = recalc.wrapping_sub(WINDOW);
            begin = begin.wrapping_sub(WINDOW);
            run_start = run_start.wrapping_sub(WINDOW);
            stop = stop.saturating_sub(WINDOW);
            enter_end = (2 * WINDOW).min(end - 8);
        }};
    }
    macro_rules! literal {
        ($b:expr) => {
            *f_ll.add($b as usize) += 1
        };
    }
    // A match at the entry `$p`.
    macro_rules! matched {
        ($p:expr, $len:expr, $dist:expr) => {{
            let (p, len, dist): (usize, usize, usize) = ($p, $len, $dist);
            debug_assert!((MIN_MATCH..=MAX_MATCH).contains(&len) && (1..WINDOW).contains(&dist));
            debug_assert!(n_seqs < sink.max_seqs);
            let run = p.wrapping_sub(run_start);
            let (t, slot) = token(run, len, dist);
            *f_ll.add(FIRST_LEN + *LEN_SLOT.as_ptr().add(len) as usize) += 1;
            *sink.f_off.add(slot) += 1;
            *sink.seqs.add(n_seqs) = t;
            n_seqs += 1;
            lits += run;
            run_start = p + len;
        }};
    }
    // Moves on past `$count` positions from `e`, entering them unless the
    // payload ends within eight bytes of them.
    macro_rules! skip {
        ($count:expr) => {{
            let count: usize = $count;
            if e + count <= enter_end {
                f.enter_run(ent, &mut h, e, count);
                e += count;
            } else if count + 8 > end - e {
                e += count;
            } else {
                let mut left = count;
                loop {
                    let now = left.min(2 * WINDOW - e);
                    f.enter_run(ent, &mut h, e, now);
                    e += now;
                    left -= now;
                    if left == 0 {
                        break;
                    }
                    slide!();
                }
            }
        }};
    }

    'block: loop {
        if e >= stop {
            // Between two steps, where something may be due.
            let num_now = (lits + e.wrapping_sub(run_start) + n_seqs) as u32;
            let counts = &*(f_ll as *const [u32; NUM_LL]);
            if e >= soft
                || n_seqs >= MAX_SEQS
                || (splitting && (*split).ends_at_counted(counts, num_now, e.wrapping_sub(begin), end - e))
            {
                break 'block;
            }
            if e == 2 * WINDOW {
                slide!();
            }
            if end - e < 8 {
                // The payload's last bytes are not searched.
                while e < end {
                    literal!(*ent.wrapping_add(e));
                    e += 1;
                }
                break 'block;
            }
            if PARSE != 0 && e >= recalc {
                min_len = later_min_len(counts, f.depth()).max(F::SHORTEST);
                recalc += (end - recalc).min(e.wrapping_sub(begin));
            }
            stop = soft.min(end - 7).min(2 * WINDOW).min(recalc).min(e + (MAX_SEQS - n_seqs));
            if splitting {
                if let Some(at) = (*split).may_end_at_counted(num_now, e.wrapping_sub(begin), end - e) {
                    stop = stop.min(begin.wrapping_add(at));
                }
            }
            debug_assert!(stop > e);
        }
        // A step at `e`.
        let mut wd = at64(ent, e);
        let mut p = f.probe(ent, e, wd, h);
        if f.none(&p, e) {
            // A literal, and the literals after it.
            loop {
                f.enter(ent, e, wd, &p, &mut h);
                literal!(wd as u8);
                e += 1;
                if e >= stop {
                    continue 'block;
                }
                wd = at64(ent, e);
                p = f.probe(ent, e, wd, h);
                if !f.none(&p, e) {
                    break;
                }
            }
        }
        let (len, dist) = f.find(ent, end, e, wd, &p, &mut h, min_len - 1, 0);
        if PARSE == 0 {
            if len >= min_len && (len > 3 || dist <= 4096) {
                matched!(e, len, dist);
                e += 1;
                skip!(len - 1);
            } else {
                literal!(wd as u8);
                e += 1;
            }
            continue 'block;
        }
        if len < min_len || (len == 3 && dist > 8192) {
            literal!(wd as u8);
            e += 1;
            continue 'block;
        }
        // A match at e - 1.
        let (mut cur_len, mut cur_dist) = (len, dist);
        e += 1;
        let better = |nl: usize, no: usize, cl: usize, co: usize, by: i32| {
            nl >= cl && 4 * (nl - cl) as i32 + (no.leading_zeros() as i32 - co.leading_zeros() as i32) > by
        };
        // The longest match at `e` that is longer than `$longer`; `e` moves
        // on by one.  Nothing if `e` is among the payload's last bytes.
        macro_rules! look_ahead {
            ($longer:expr, $look:expr) => {{
                if e == 2 * WINDOW {
                    slide!();
                }
                if end - e < 8 {
                    e += 1;
                    (0usize, 0usize)
                } else {
                    let wd = at64(ent, e);
                    let p = f.probe(ent, e, wd, h);
                    let found = f.find(ent, end, e, wd, &p, &mut h, $longer, $look);
                    e += 1;
                    found
                }
            }};
        }
        loop {
            // A match that is long enough is taken as it is.
            if cur_len >= (end - (e - 1)).min(f.nice()) {
                matched!(e - 1, cur_len, cur_dist);
                skip!(cur_len - 1);
                break;
            }
            let (next_len, next_dist) = look_ahead!(cur_len - 1, 1);
            if better(next_len, next_dist, cur_len, cur_dist, 2) {
                literal!(*ent.wrapping_add(e - 2));
                (cur_len, cur_dist) = (next_len, next_dist);
                continue;
            }
            if PARSE == 2 {
                let (next_len, next_dist) = look_ahead!(cur_len - 1, 2);
                if better(next_len, next_dist, cur_len, cur_dist, 6) {
                    literal!(*ent.wrapping_add(e - 3));
                    literal!(*ent.wrapping_add(e - 2));
                    (cur_len, cur_dist) = (next_len, next_dist);
                    continue;
                }
                matched!(e - 3, cur_len, cur_dist);
                if cur_len > 3 {
                    skip!(cur_len - 3);
                }
            } else {
                matched!(e - 2, cur_len, cur_dist);
                skip!(cur_len - 2);
            }
            break;
        }
    }
    st.pos = e - F::ONE + off;
    st.nh = h;
    st.win = off;
    n_seqs
}
