//! EXPERIMENT: the search of levels 2 and up in a payload of more than
//! 32768 bytes.  Rows of entries, the most recent first, in place of chains.

use crate::fast::{at32, at64, extend_at, fetch, lz_hash, raw_at32, rebase, Resume, Sink, WINDOW};
use crate::levels::{later_min_len, Split, MAX_SEQS};
use crate::tables::*;
use crate::write::token;
use core::ptr;

/// Words in the table: 128 KiB.
pub(crate) const ROW_WORDS: usize = 1 << 14;

/// The input and the table, which has been zeroed.
#[derive(Clone, Copy)]
pub(crate) struct Rows {
    pub ip: *const u8,
    pub n: usize,
    pub tab: *mut u64,
    pub depth: u32,
    pub nice: usize,
}

/// Where the row of the four bytes `seq` begins, in words.  A row is `W`
/// words: `4 * W` entries of 16 bits, the most recent lowest.
#[inline(always)]
fn row_of<const W: usize>(seq: u32) -> usize {
    lz_hash(seq, ROW_WORDS.trailing_zeros() - W.trailing_zeros()) << W.trailing_zeros()
}

#[inline(always)]
unsafe fn row_load<const W: usize>(t: *const u64) -> [u64; W] {
    ptr::read(t as *const [u64; W])
}

/// Enters `e` into the row at `t`, which holds `row`: every entry moves one
/// place on, and the oldest is dropped.
#[inline(always)]
unsafe fn row_enter<const W: usize>(t: *mut u64, row: &[u64; W], e: usize) {
    let mut carry = e as u64;
    let mut j = 0;
    while j < W {
        *t.add(j) = row[j] << 16 | carry;
        carry = row[j] >> 48;
        j += 1;
    }
}

/// The entry in place `j` of a row.
#[inline(always)]
unsafe fn lane<const W: usize>(row: &[u64; W], j: usize) -> usize {
    (*row.get_unchecked(j >> 2) >> (16 * (j & 3))) as usize & 0xFFFF
}

/// The first place of the row whose entry stands for a position with the
/// four bytes that `wd` begins with; `4 * W` if none does.  (Whether the
/// position is within reach is not asked.)
#[inline(always)]
unsafe fn first_hit<const W: usize>(ent: *const u8, row: &[u64; W], wd: u64) -> usize {
    let mut j = 0;
    while j < 4 * W {
        if (at64(ent, lane::<W>(row, j)) ^ wd) as u32 == 0 {
            break;
        }
        j += 1;
    }
    j
}

/// The longest match at the entry `e`, whose eight bytes are `wd`, among the
/// entries of `row` from place `from` on, the most recent of the longest:
/// (length, distance).  A match no longer than `longer` is of no use, and
/// what is returned if there is no other is no longer than that either.
#[inline(always)]
#[allow(clippy::too_many_arguments)]
unsafe fn best_from<const W: usize>(
    ent: *const u8,
    end: usize,
    row: &[u64; W],
    from: usize,
    wd: u64,
    e: usize,
    longer: usize,
    max_len: usize,
    nice_len: usize,
) -> (usize, usize) {
    let (mut best_len, mut best) = (longer, e);
    let mut j = from;
    while j < 4 * W {
        let c = lane::<W>(row, j);
        j += 1;
        let x = at64(ent, c) ^ wd;
        if x as u32 != 0 {
            continue;
        }
        // Within reach is up to 32767 back; what is older than an entry out
        // of reach is out of reach too.
        if e.wrapping_sub(c).wrapping_sub(1) >= WINDOW - 1 {
            break;
        }
        let mut l = (x.trailing_zeros() >> 3) as usize;
        if l == 8 {
            if best_len >= 8 {
                if best_len >= max_len {
                    break;
                }
                if raw_at32(ent, c + best_len - 3) != raw_at32(ent, e + best_len - 3) {
                    continue;
                }
            }
            l = extend_at(ent, end, c, e, 8, max_len);
        }
        if l > best_len {
            best_len = l;
            best = c;
            if l >= nice_len {
                break;
            }
        }
    }
    (best_len, e - best)
}

/// Enters the `count` positions from the entry `from` on.
#[inline(always)]
unsafe fn enter_run<const W: usize>(tab: *mut u64, ent: *const u8, h: &mut usize, from: usize, count: usize) {
    let mut hh = *h;
    let mut q = from;
    let stop = from + count;
    while q < stop {
        debug_assert!(q < 2 * WINDOW && hh < ROW_WORDS);
        let t = tab.add(hh);
        let row = row_load::<W>(t);
        row_enter::<W>(t, &row, q);
        hh = row_of::<W>(at32(ent, q + 1));
        q += 1;
    }
    *h = hh;
}

#[cold]
#[inline(never)]
unsafe fn slide_rows(tab: *mut u64) {
    rebase(&[(tab.cast::<u16>(), 4 * ROW_WORDS)]);
}

/// A block: `PARSE` 0 takes the longest match at each position, 1 first
/// looks at the next position for a better one, 2 at the next two.
/// Returns the number of matches; `st` then says where the next block
/// begins.
pub(crate) unsafe fn search<const W: usize, const PARSE: u8>(
    c: Rows,
    mut min_len: usize,
    sink: Sink,
    st: &mut Resume,
    split: *mut Split,
    splitting: bool,
    soft_end: usize,
) -> usize {
    debug_assert!(c.n > WINDOW && min_len >= 4);
    let (tab, f_ll) = (c.tab, sink.f_ll);
    let kinds = ptr::addr_of_mut!((*split).new_obs).cast::<u32>();
    let num_new = ptr::addr_of_mut!((*split).num_new);
    // An entry is a position less `off`; all of these are entries.
    let mut off = st.win;
    let mut ent = c.ip.add(off);
    let mut e = st.pos - off;
    let mut end = c.n - off;
    let mut soft = soft_end - off;
    let mut begin = e;
    let mut run_start = e;
    let mut h = if st.pos == 0 { row_of::<W>(at32(ent, 0)) } else { st.nh.1 };
    let mut n_seqs = 0usize;
    let mut recalc = if PARSE != 0 { e + (end - e).min(10000) } else { usize::MAX };
    // Steps are taken without a question below this entry.
    let mut stop = 0usize;

    macro_rules! slide {
        () => {{
            slide_rows(tab);
            off += WINDOW;
            ent = ent.add(WINDOW);
            e -= WINDOW;
            end -= WINDOW;
            soft -= WINDOW;
            recalc = recalc.wrapping_sub(WINDOW);
            begin = begin.wrapping_sub(WINDOW);
            run_start = run_start.wrapping_sub(WINDOW);
            stop = stop.saturating_sub(WINDOW);
        }};
    }
    macro_rules! literal {
        ($b:expr) => {{
            let b: u8 = $b;
            *f_ll.add(b as usize) += 1;
            *kinds.add(Split::kind(b)) += 1;
        }};
    }
    // A match at the entry `$p`.
    macro_rules! matched {
        ($p:expr, $len:expr, $dist:expr) => {{
            let (p, len, dist): (usize, usize, usize) = ($p, $len, $dist);
            debug_assert!((4..=MAX_MATCH).contains(&len) && (1..WINDOW).contains(&dist));
            debug_assert!(n_seqs < sink.max_seqs);
            let run = p.wrapping_sub(run_start);
            let (t, slot) = token(run, len, dist);
            *f_ll.add(FIRST_LEN + *LEN_SLOT.as_ptr().add(len) as usize) += 1;
            *sink.f_off.add(slot) += 1;
            *sink.seqs.add(n_seqs) = t;
            n_seqs += 1;
            run_start = p + len;
            *kinds.add(8 + (len >= 9) as usize) += 1;
            *num_new = (*num_new).wrapping_add(run as u32 + 1);
        }};
    }
    // Moves on past `$count` positions from `e`, entering them unless the
    // payload ends within eight bytes of them.
    macro_rules! skip {
        ($count:expr) => {{
            let count: usize = $count;
            if count + 8 > end - e {
                e += count;
            } else {
                let mut left = count;
                loop {
                    let now = left.min(2 * WINDOW - e);
                    enter_run::<W>(tab, ent, &mut h, e, now);
                    e += now;
                    left -= now;
                    if left == 0 {
                        break;
                    }
                    slide!();
                }
                fetch(tab.add(h));
            }
        }};
    }

    'block: loop {
        if e >= stop {
            // Between two steps, where something may be due.  The literals
            // since the last match are counted for the time being.
            let pending = e.wrapping_sub(run_start) as u32;
            *num_new = (*num_new).wrapping_add(pending);
            let mut ends = e >= soft || n_seqs >= MAX_SEQS;
            if !ends && splitting {
                ends = (*split).ends_at(e.wrapping_sub(begin), end - e);
            }
            if ends {
                *num_new = (*num_new).wrapping_sub(pending);
                break 'block;
            }
            if e == 2 * WINDOW {
                slide!();
            }
            if end - e < 8 {
                // The payload's last bytes are not searched.
                while e < end {
                    literal!(*ent.add(e));
                    e += 1;
                }
                break 'block;
            }
            if PARSE != 0 && e >= recalc {
                min_len = later_min_len(&*(f_ll as *const [u32; NUM_LL]), c.depth).max(4);
                recalc += (end - recalc).min(e.wrapping_sub(begin));
            }
            stop = soft.min(end - 7).min(2 * WINDOW).min(recalc).min(e + (MAX_SEQS - n_seqs));
            if splitting {
                if let Some(at) = (*split).may_end_at(e.wrapping_sub(begin), end - e) {
                    stop = stop.min(begin.wrapping_add(at));
                }
            }
            *num_new = (*num_new).wrapping_sub(pending);
            debug_assert!(stop > e);
        }
        // A step at `e`.
        let mut wd = at64(ent, e);
        let mut row = row_load::<W>(tab.add(h));
        let mut j = first_hit::<W>(ent, &row, wd);
        if j == 4 * W {
            // A literal, and the literals after it.
            loop {
                row_enter::<W>(tab.add(h), &row, e);
                h = row_of::<W>((wd >> 8) as u32);
                literal!(wd as u8);
                e += 1;
                if e >= stop {
                    continue 'block;
                }
                wd = at64(ent, e);
                row = row_load::<W>(tab.add(h));
                j = first_hit::<W>(ent, &row, wd);
                if j != 4 * W {
                    break;
                }
            }
        }
        row_enter::<W>(tab.add(h), &row, e);
        h = row_of::<W>((wd >> 8) as u32);
        fetch(tab.add(h));
        let max_len = (end - e).min(MAX_MATCH);
        let nice_len = c.nice.min(max_len);
        let (len, dist) = best_from::<W>(ent, end, &row, j, wd, e, min_len - 1, max_len, nice_len);
        if len < min_len {
            literal!(wd as u8);
            e += 1;
            continue 'block;
        }
        if PARSE == 0 {
            matched!(e, len, dist);
            e += 1;
            skip!(len - 1);
            continue 'block;
        }
        // A match at e - 1, and the length that was good enough there.
        let (mut cur_len, mut cur_dist, mut cur_nice) = (len, dist, nice_len);
        e += 1;
        let better = |nl: usize, no: usize, cl: usize, co: usize, by: i32| {
            nl >= cl && 4 * (nl - cl) as i32 + (no.leading_zeros() as i32 - co.leading_zeros() as i32) > by
        };
        // The longest match at `e` that is longer than `$longer`, as
        // (length, distance, good enough); `e` moves on by one.
        macro_rules! look_ahead {
            ($longer:expr) => {{
                if e == 2 * WINDOW {
                    slide!();
                }
                if end - e < 8 {
                    e += 1;
                    (0usize, 0usize, 0usize)
                } else {
                    let wd = at64(ent, e);
                    let row = row_load::<W>(tab.add(h));
                    row_enter::<W>(tab.add(h), &row, e);
                    h = row_of::<W>((wd >> 8) as u32);
                    fetch(tab.add(h));
                    let max_len = (end - e).min(MAX_MATCH);
                    let nice_len = c.nice.min(max_len);
                    let (l, d) = best_from::<W>(ent, end, &row, 0, wd, e, $longer, max_len, nice_len);
                    e += 1;
                    (l, d, nice_len)
                }
            }};
        }
        loop {
            if cur_len >= cur_nice {
                matched!(e - 1, cur_len, cur_dist);
                skip!(cur_len - 1);
                break;
            }
            let (next_len, next_dist, next_nice) = look_ahead!(cur_len - 1);
            if better(next_len, next_dist, cur_len, cur_dist, 2) {
                literal!(*ent.add(e - 2));
                (cur_len, cur_dist, cur_nice) = (next_len, next_dist, next_nice);
                continue;
            }
            if PARSE == 2 {
                let (next_len, next_dist, next_nice) = look_ahead!(cur_len - 1);
                if better(next_len, next_dist, cur_len, cur_dist, 6) {
                    literal!(*ent.add(e - 3));
                    literal!(*ent.add(e - 2));
                    (cur_len, cur_dist, cur_nice) = (next_len, next_dist, next_nice);
                    continue;
                }
                matched!(e - 3, cur_len, cur_dist);
                skip!(cur_len - 3);
            } else {
                matched!(e - 2, cur_len, cur_dist);
                skip!(cur_len - 2);
            }
            break;
        }
    }
    st.pos = e + off;
    st.nh.1 = h;
    st.win = off;
    n_seqs
}
