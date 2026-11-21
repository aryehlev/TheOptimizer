//! The encoder: finds repetitions in one block of at most `CHUNK` bytes and
//! writes it as DEFLATE bits.
//!
//! `scan` is the function that matters.  With `EMIT` it writes the block in a
//! single pass, using codes that were made before the payload was seen.
//! Without `EMIT` it only records the matches, for `emit_seqs` to write once
//! codes have been chosen: that is the path for a payload the shared codes do
//! not suit, and for small ones.

use crate::codes::*;
use crate::tables::*;
use core::ptr;

/// The most bytes a block covers.  Positions are kept in 16 bits, and the
/// largest table (one entry per position) is 32 KiB.
pub(crate) const CHUNK: usize = 16384;
pub(crate) const MAX_TAB_BITS: u32 = 14;
/// A match is at least four bytes long.
pub(crate) const MAX_SEQS: usize = CHUNK / 4 + 1;

/// The bytes a block of `n` input bytes may write before it is known how
/// large it is: the header, at most 14 bits per byte, and eight bytes that a
/// flush may write past the last one.
pub(crate) const fn scratch(n: usize) -> usize {
    HDR_BYTES + 2 * n + 16
}

/// The hash table: for each hash value, the last position in the block whose
/// next five bytes had it.
#[repr(C, align(64))]
pub(crate) struct Tab(pub [u16; 1 << MAX_TAB_BITS]);

/// Symbol counts of one block.  16 bits each: a block has at most 16384
/// symbols, and half the size means half the cache lines to touch.
#[repr(C)]
pub(crate) struct Freq {
    pub ll: [u16; NUM_LL],
    pub off: [u16; NUM_OFF],
}

/// A match and the literals before it: run | length << 16 | distance << 32.
pub(crate) type Seq = u64;

#[inline(always)]
unsafe fn rd64(p: *const u8, i: usize, n: usize) -> u64 {
    debug_assert!(i + 8 <= n);
    u64::from_le(ptr::read_unaligned(p.add(i) as *const u64))
}

#[inline(always)]
unsafe fn wr64(p: *mut u8, i: usize, cap: usize, v: u64) {
    debug_assert!(i + 8 <= cap);
    ptr::write_unaligned(p.add(i) as *mut u64, v.to_le())
}

/// Hash of the low five bytes of `x`, in `BITS` bits.
///
/// `(x << 24) * K` is `x * (K << 24)`: the shift that drops the upper three
/// bytes is folded into the constant, leaving one multiplication and one
/// shift.  The shift amount is a constant in each copy of the encoder.
#[inline(always)]
fn hash5<const BITS: u32>(x: u64) -> usize {
    const K24: u64 = 0x9E37_79B1_85EB_CA87 << 24;
    (x.wrapping_mul(K24) >> (64 - BITS)) as usize
}

/// Offset slot, number of extra bits and their value for a distance, given
/// `d` = distance - 1.  Arithmetic on the bit length of `d` instead of
/// libdeflate's 512-byte table: no load, and nothing to fall out of cache.
#[inline(always)]
fn off_slot(d: u32) -> (usize, u32, u32) {
    let bl = 32 - d.leading_zeros();
    let extra = bl.saturating_sub(2);
    let slot = if d < 2 { d } else { 2 * bl - 2 + ((d >> (bl - 2)) & 1) };
    (slot as usize, extra, d & ((1 << extra) - 1))
}

/// Copies the block header and returns where the block's bits continue:
/// (bytes written, bit buffer, bits in it).
#[inline(always)]
unsafe fn start_block(c: &Codes, out: *mut u8, cap: usize, last: bool) -> (usize, u64, u32) {
    let nb = c.hdr_bits as usize;
    let full = nb >> 3;
    debug_assert!(cap >= HDR_BYTES);
    if full < 128 {
        // The usual header is 60 to 90 bytes.  A copy of a fixed size is a
        // few vector moves; one of `full` bytes is a call that first has to
        // find out how long it is.  What is copied beyond the header is
        // overwritten by the block.
        ptr::copy_nonoverlapping(c.hdr.as_ptr(), out, 128);
    } else {
        ptr::copy_nonoverlapping(c.hdr.as_ptr(), out, full);
    }
    let mut bitbuf = c.hdr[full] as u64 & ((1 << (nb & 7)) - 1);
    if !last {
        // The stored header says BFINAL = 1.
        if full == 0 {
            bitbuf &= !1;
        } else {
            *out &= !1;
        }
    }
    (full, bitbuf, (nb & 7) as u32)
}

/// One block: `inp` (at most `CHUNK` bytes) either written to `out` with the
/// codes `c` (`EMIT`), or recorded in `seqs` (not `EMIT`).  With `COUNT` the
/// symbols are counted in `freq`, which the caller has zeroed.
///
/// With `EMIT`, returns the number of bits written, or 0 if a byte of `inp`
/// has no codeword in `c`; `out` must have room for `scratch(inp.len())`
/// bytes, and `c` must have a codeword for every length and for every offset
/// slot up to 27.  Without `EMIT`, returns the number of `seqs`.
///
/// How it searches:
///
///   - One earlier position is kept per hash value, in a table that has
///     about one entry per input byte (`1 << BITS`).  The table is zeroed at
///     the start of every block.  That costs little at this size and walks
///     the table front to back, which fetches it much faster than the
///     scattered first touches of the lookups would when the thread has done
///     other work since its last payload.
///   - A position is an offset into the block, so an empty entry reads as
///     position 0.  The bytes there are compared like those of any other
///     candidate: no entry is tested for being empty, and the only branch in
///     a step is the one taken for a match.
///   - Each step reads eight bytes at the current position once.  The low
///     byte is the literal, the low four bytes are compared with the
///     candidate's, and bytes 1 to 5 are hashed for the next position, so the
///     next lookup's address is ready before the next step begins.
///   - Eight bytes are read at the candidate too, although four decide.  When
///     they decide for a match, the XOR that was computed for the comparison
///     already says how long a match of up to 7 bytes is.
///   - Inside a match only three positions are entered into the table: the
///     two after its start, whose hashes come out of the word already read,
///     and the last, whose word also gives the hash for the position after
///     the match.  One load per match instead of four.
///
/// How it writes:
///
///   - A literal is one table load and an OR into a 64-bit buffer.  Four
///     literals always fit (see `MAX_LL_BITS`), so the steps come four to a
///     flush, and a flush is one unaligned 8-byte store.
///   - A byte without a codeword is not tested for where it is written: its
///     table entry sets bit 15 of the bit count, the count is only ever used
///     modulo 64, and every flush ORs it into `bad`, which is looked at once,
///     at the end.
///   - A match is assembled into one value of at most 47 bits (length
///     codeword and extra bits from one load, offset codeword from another,
///     offset extra bits by arithmetic) and OR-ed in once.
#[inline(never)]
#[allow(clippy::too_many_arguments, unused_assignments)]
pub(crate) unsafe fn scan<const BITS: u32, const EMIT: bool, const COUNT: bool>(
    c: &Codes,
    tab: &mut Tab,
    freq: &mut Freq,
    seqs: &mut [Seq; MAX_SEQS],
    inp: &[u8],
    out: *mut u8,
    cap: usize,
    last: bool,
) -> usize {
    let n = inp.len();
    debug_assert!(n <= CHUNK && BITS <= MAX_TAB_BITS);
    debug_assert!(!EMIT || cap >= scratch(n));
    let ip = inp.as_ptr();
    let tp = tab.0.as_mut_ptr();
    let lit_tab = c.lit.as_ptr();
    let f_ll = freq.ll.as_mut_ptr();
    let f_off = freq.off.as_mut_ptr();
    let sp = seqs.as_mut_ptr();

    let (mut o, mut bitbuf, mut bitcount) = (0usize, 0u64, 0u32);
    if EMIT {
        (o, bitbuf, bitcount) = start_block(c, out, cap, last);
    }
    let mut bad = 0u32; // above 63: a byte had no codeword
    let mut n_seqs = 0usize;
    let mut run_start = 0usize; // where the literals since the last match begin

    macro_rules! flush {
        () => {
            if EMIT {
                wr64(out, o, cap, bitbuf);
                bad |= bitcount;
                o += ((bitcount >> 3) & 7) as usize;
                bitbuf >>= bitcount & 56;
                bitcount &= 7;
            }
        };
    }
    macro_rules! literal {
        ($byte:expr) => {{
            let b = $byte as usize;
            if EMIT {
                let e = *lit_tab.add(b);
                bitbuf |= ((e & 0xFFFF) as u64).wrapping_shl(bitcount);
                bitcount = bitcount.wrapping_add(e >> 16);
            }
            if COUNT {
                *f_ll.add(b) = (*f_ll.add(b)).wrapping_add(1);
            }
        }};
    }

    macro_rules! count_match {
        ($len_slot:expr, $off_slot:expr) => {{
            let (ls, os) = (FIRST_LEN + $len_slot, $off_slot);
            debug_assert!(ls < NUM_LL && os < NUM_OFF);
            *f_ll.add(ls) = (*f_ll.add(ls)).wrapping_add(1);
            *f_off.add(os) = (*f_off.add(os)).wrapping_add(1);
        }};
    }

    ptr::write_bytes(tp, 0, 1 << BITS);

    // Positions from `stop` on are neither looked up nor entered into the
    // table: eight bytes are read at one that is, and at a candidate.
    let stop = n.saturating_sub(9);
    // Before this, four positions in a row are before `stop`: one bound
    // check per four steps.
    let stop4 = n.saturating_sub(12);
    let mut pos = 0usize;

    'tail: {
        if stop <= 1 {
            break 'tail;
        }
        // The first position has nothing before it to match, and it is in
        // the table already: it is what an empty entry says.
        literal!(*ip);
        flush!();
        pos = 1;
        let mut next_hash = hash5::<BITS>(rd64(ip, 1, n));

        macro_rules! step {
            ($found:lifetime) => {{
                let w = rd64(ip, pos, n);
                let h = next_hash;
                debug_assert!(h < 1 << BITS);
                let cand = *tp.add(h) as usize;
                *tp.add(h) = pos as u16;
                next_hash = hash5::<BITS>(w >> 8);
                let x = rd64(ip, cand, n) ^ w;
                if x as u32 == 0 {
                    break $found (cand, w, x);
                }
                literal!(w as u8);
                pos += 1;
            }};
        }

        loop {
            // At most 7 bits are in the bit buffer here.
            let (cand, w, x) = 'found: {
                while pos < stop4 {
                    step!('found);
                    step!('found);
                    step!('found);
                    step!('found);
                    flush!();
                }
                while pos < stop {
                    step!('found);
                    flush!();
                }
                break 'tail;
            };

            // A match at `pos` with the earlier position `cand`.
            debug_assert!(cand < pos);
            let len = if x != 0 {
                (x.trailing_zeros() >> 3) as usize // 4 to 7
            } else {
                let max = (n - pos).min(MAX_MATCH);
                let mut len = 8;
                loop {
                    if len + 8 > max {
                        while len < max && *ip.add(pos + len) == *ip.add(cand + len) {
                            len += 1;
                        }
                        break len;
                    }
                    let d = rd64(ip, pos + len, n) ^ rd64(ip, cand + len, n);
                    if d != 0 {
                        break len + (d.trailing_zeros() >> 3) as usize;
                    }
                    len += 8;
                }
            };
            let dist = pos - cand;
            let (slot, extra_n, extra) = off_slot(dist as u32 - 1);
            if EMIT {
                flush!(); // the literals of this group of steps
                let le = *c.len.as_ptr().add(len);
                let oe = *c.off.as_ptr().add(slot);
                debug_assert!(le != 0 && oe != 0);
                let len_n = (le >> LEN_NBITS_SHIFT) & 31;
                let off_n = oe >> 16;
                let bits = (le & LEN_VALUE_MASK) as u64
                    | ((oe & 0xFFFF) as u64) << len_n
                    | (extra as u64) << (len_n + off_n);
                bitbuf |= bits << bitcount;
                bitcount += len_n + off_n + extra_n;
                flush!();
                if COUNT {
                    count_match!((le >> LEN_SLOT_SHIFT) as usize, slot);
                }
            } else {
                count_match!(LEN_SLOT[len] as usize, slot);
                debug_assert!(n_seqs < MAX_SEQS);
                *sp.add(n_seqs) =
                    (pos - run_start) as u64 | (len as u64) << 16 | (dist as u64) << 32;
                n_seqs += 1;
                run_start = pos + len;
            }

            // pos + 1 and pos + 2 are before `stop` + 1, so eight bytes can
            // be read there when they come up as candidates.
            *tp.add(next_hash) = (pos + 1) as u16;
            *tp.add(hash5::<BITS>(w >> 16)) = (pos + 2) as u16;
            pos += len;
            if pos >= stop {
                break 'tail;
            }
            let v = rd64(ip, pos - 1, n);
            *tp.add(hash5::<BITS>(v)) = (pos - 1) as u16;
            next_hash = hash5::<BITS>(v >> 8);
        }
    }

    // The last few bytes, where nothing can be hashed.  Nothing is waiting
    // in the bit buffer but the up to 7 bits that every flush leaves.
    while pos + 4 <= n {
        literal!(*ip.add(pos));
        literal!(*ip.add(pos + 1));
        literal!(*ip.add(pos + 2));
        literal!(*ip.add(pos + 3));
        flush!();
        pos += 4;
    }
    while pos < n {
        literal!(*ip.add(pos));
        pos += 1;
    }
    if !EMIT {
        return n_seqs;
    }
    flush!();
    bitbuf |= ((c.eob & 0xFFFF) as u64) << bitcount;
    bitcount += c.eob >> 16;
    flush!();
    // The store of the last flush put the bits that are left at out[o].
    if bad > 63 {
        return 0;
    }
    8 * o + bitcount as usize
}

/// Writes the block that `scan` recorded in `seqs`, with the codes `c`, which
/// must have a codeword for every symbol of the block.  Returns the number
/// of bits written.  `out` must have room for `scratch(inp.len())` bytes.
#[inline(never)]
#[allow(unused_assignments)]
pub(crate) unsafe fn emit_seqs(
    c: &Codes,
    inp: &[u8],
    seqs: &[Seq],
    out: *mut u8,
    cap: usize,
    last: bool,
) -> usize {
    let n = inp.len();
    debug_assert!(cap >= scratch(n));
    let ip = inp.as_ptr();
    let lit_tab = c.lit.as_ptr();
    let (mut o, mut bitbuf, mut bitcount) = start_block(c, out, cap, last);
    let mut bad = 0u32;
    let mut pos = 0usize;

    macro_rules! flush {
        () => {
            wr64(out, o, cap, bitbuf);
            bad |= bitcount;
            o += ((bitcount >> 3) & 7) as usize;
            bitbuf >>= bitcount & 56;
            bitcount &= 7;
        };
    }
    macro_rules! literal {
        ($i:expr) => {{
            debug_assert!($i < n);
            let e = *lit_tab.add(*ip.add($i) as usize);
            bitbuf |= ((e & 0xFFFF) as u64).wrapping_shl(bitcount);
            bitcount = bitcount.wrapping_add(e >> 16);
        }};
    }
    macro_rules! literals {
        ($end:expr) => {{
            let end = $end;
            while pos + 4 <= end {
                literal!(pos);
                literal!(pos + 1);
                literal!(pos + 2);
                literal!(pos + 3);
                flush!();
                pos += 4;
            }
            // Up to three more: with the 7 bits a flush leaves, 49 at most.
            while pos < end {
                literal!(pos);
                pos += 1;
            }
            flush!();
        }};
    }

    for &s in seqs {
        let run = (s & 0xFFFF) as usize;
        let len = ((s >> 16) & 0xFFFF) as usize;
        let dist = (s >> 32) as u32;
        literals!(pos + run);
        let (slot, extra_n, extra) = off_slot(dist - 1);
        let le = *c.len.as_ptr().add(len);
        let oe = *c.off.as_ptr().add(slot);
        debug_assert!(le != 0 && oe != 0);
        let len_n = (le >> LEN_NBITS_SHIFT) & 31;
        let off_n = oe >> 16;
        let bits = (le & LEN_VALUE_MASK) as u64
            | ((oe & 0xFFFF) as u64) << len_n
            | (extra as u64) << (len_n + off_n);
        bitbuf |= bits << bitcount;
        bitcount += len_n + off_n + extra_n;
        flush!();
        pos += len;
    }
    literals!(n);
    bitbuf |= ((c.eob & 0xFFFF) as u64) << bitcount;
    bitcount += c.eob >> 16;
    flush!();
    debug_assert!(bad <= 63 && c.eob >> 16 != 0);
    let _ = bad;
    8 * o + bitcount as usize
}

/// A stored block: five bytes and the input as it is.  `out` is at a byte
/// boundary.  Returns the number of bits written.
pub(crate) unsafe fn stored(inp: &[u8], out: *mut u8, cap: usize, last: bool) -> usize {
    let n = inp.len();
    debug_assert!(n <= 0xFFFF && cap >= n + 5);
    let _ = cap;
    *out = last as u8; // BFINAL, BTYPE = 0, and padding to the byte boundary
    ptr::copy_nonoverlapping((n as u16).to_le_bytes().as_ptr(), out.add(1), 2);
    ptr::copy_nonoverlapping((!(n as u16)).to_le_bytes().as_ptr(), out.add(3), 2);
    ptr::copy_nonoverlapping(inp.as_ptr(), out.add(5), n);
    8 * (n + 5)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn offset_slots() {
        // Against the table of RFC 1951, 3.2.5.
        let base: [u32; 30] = [
            1, 2, 3, 4, 5, 7, 9, 13, 17, 25, 33, 49, 65, 97, 129, 193, 257, 385, 513, 769, 1025,
            1537, 2049, 3073, 4097, 6145, 8193, 12289, 16385, 24577,
        ];
        for dist in 1..=32768u32 {
            let want = (0..30).rev().find(|&s| base[s] <= dist).unwrap();
            let (slot, n, extra) = off_slot(dist - 1);
            assert_eq!(slot, want, "distance {dist}");
            assert_eq!(n, OFF_EXTRA[slot] as u32);
            assert_eq!(extra, dist - base[slot]);
        }
    }
}

#[cfg(test)]
mod probe {
    use super::*;

    /// `GZHOT_PROBE=records.bin cargo test --release probe -- --nocapture`:
    /// what the search finds in a file of `[u32 len][bytes]` records.
    #[test]
    fn probe() {
        let Ok(path) = std::env::var("GZHOT_PROBE") else { return };
        let data = std::fs::read(path).unwrap();
        let mut tab = Box::new(Tab([0; 1 << MAX_TAB_BITS]));
        let mut seqs = Box::new([0u64; MAX_SEQS]);
        let (mut off, mut recs, mut bytes, mut matches, mut matched) = (0, 0, 0, 0, 0);
        let mut by_len = [0usize; 12];
        let mut runs = [0usize; 12];
        while off + 4 <= data.len() {
            let n = u32::from_le_bytes(data[off..off + 4].try_into().unwrap()) as usize;
            let rec = &data[off + 4..off + 4 + n.min(CHUNK)];
            off += 4 + n;
            let mut freq = Freq { ll: [0; NUM_LL], off: [0; NUM_OFF] };
            let k = unsafe {
                match rec.len() {
                    0..=1024 => scan::<10, false, true>(&FIXED, &mut tab, &mut freq, &mut seqs, rec, core::ptr::null_mut(), 0, true),
                    1025..=2048 => scan::<11, false, true>(&FIXED, &mut tab, &mut freq, &mut seqs, rec, core::ptr::null_mut(), 0, true),
                    2049..=4096 => scan::<12, false, true>(&FIXED, &mut tab, &mut freq, &mut seqs, rec, core::ptr::null_mut(), 0, true),
                    4097..=8192 => scan::<13, false, true>(&FIXED, &mut tab, &mut freq, &mut seqs, rec, core::ptr::null_mut(), 0, true),
                    _ => scan::<14, false, true>(&FIXED, &mut tab, &mut freq, &mut seqs, rec, core::ptr::null_mut(), 0, true),
                }
            };
            recs += 1;
            bytes += rec.len();
            matches += k;
            for &s in &seqs[..k] {
                let (run, len) = ((s & 0xFFFF) as usize, ((s >> 16) & 0xFFFF) as usize);
                matched += len;
                by_len[len.min(11)] += 1;
                runs[run.min(11)] += 1;
            }
        }
        println!("{recs} records, {} B each: {} matches each, {:.1} bytes per match, {} literals each",
            bytes / recs, matches / recs, matched as f64 / matches as f64, (bytes - matched) / recs);
        println!("match lengths 4..=10, 11+: {:?}", by_len[4..].iter().map(|&c| c * 100 / matches).collect::<Vec<_>>());
        println!("literal runs 0..=10, 11+ before a match: {:?}", runs.iter().map(|&c| c * 100 / matches).collect::<Vec<_>>());
    }
}
