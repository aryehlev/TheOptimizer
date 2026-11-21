//! The encoder: finds repetitions in one block of at most `CHUNK` bytes and
//! writes it as DEFLATE bits.
//!
//! `scan` is the function that matters.  With `EMIT` it writes the block in a
//! single pass, using codes that were made before the payload was seen.
//! Without `EMIT` it only records the matches, for `emit_seqs` to write once
//! codes have been chosen: that is the path for a payload the shared codes do
//! not suit, and for small ones.
//!
//! Every access here is checked by the language.  What keeps the checks out
//! of the loops is that the compiler can see for itself that they hold,
//! because of how the data is laid out:
//!
//!   - The input is not the caller's slice but a copy in an array of a fixed
//!     length (`Input`), longer than the largest 16-bit number by more than
//!     the longest read.  A candidate position comes out of a table of 16-bit
//!     numbers, so eight bytes at a candidate are inside the array whatever
//!     the table holds.
//!   - The output is an array of a fixed length too (`Output`), and the place
//!     of a store in it is taken modulo 2^16.  A block never comes near that
//!     many bytes, so the modulo changes nothing; it is one instruction where
//!     a comparison with the end of a slice would be three.
//!   - A hash is a 64-bit product shifted right until `BITS` bits are left,
//!     and the table has `1 << MAX_TAB_BITS` entries.
//!   - A byte indexes a table of 256 entries.

use crate::codes::*;
use crate::tables::*;

/// The most bytes a block covers.  Positions are kept in 16 bits, and the
/// largest table (one entry per position of a block) is 32 KiB.
pub(crate) const CHUNK: usize = 16384;
pub(crate) const MAX_TAB_BITS: u32 = 14;
pub(crate) const TAB_LEN: usize = 1 << MAX_TAB_BITS;
/// A match is at least four bytes long, so a block has at most this many.
/// A power of two: see where `scan` records a match.
pub(crate) const MAX_SEQS: usize = CHUNK / 4;

/// The bytes a block of `n` input bytes may write before it is known how
/// large it is: the header, at most 14 bits per byte, and what a flush may
/// write past the last bit.
pub(crate) const fn scratch(n: usize) -> usize {
    HDR_BYTES + 2 * n + 24
}

/// What the encoder reads: the block to be written and, in front of it, the
/// block before it in the same payload if there is one.  At most `2 * CHUNK`
/// bytes are in use.  The length is what lets every read go unchecked: eight
/// bytes are read at a position, which is below 2^16 by its type, or at a
/// position plus a part of a match length, which is below 2^8.
pub(crate) const IN_LEN: usize = (1 << 16) + 256 + 8;
pub(crate) type Input = [u8; IN_LEN];

/// What the encoder writes: a payload of up to `CHUNK` bytes with all that
/// goes around it, or a block of a larger payload.  Either is far below 2^16
/// bytes (see `scratch`); a store of eight bytes begins below 2^16, and a
/// block header is copied 128 bytes at a time.
pub(crate) const OUT_LEN: usize = (1 << 16) + 128;
pub(crate) type Output = [u8; OUT_LEN];

/// The hash table: for each hash value, the last position whose next five
/// bytes had it.
pub(crate) type Tab = [u16; TAB_LEN];

/// Makes the positions relative to a start that is `CHUNK` bytes later.
/// What was before the new start now reads as the new start, which is as
/// good a candidate as any: a candidate is only ever a guess.
pub(crate) fn rebase(tab: &mut Tab) {
    for e in tab.iter_mut() {
        *e = e.saturating_sub(CHUNK as u16); // 8 or 16 entries per instruction
    }
}

/// Symbol counts of one block.  16 bits each: a block has at most 16384
/// symbols, and half the size means half the cache lines to touch.
#[repr(C)]
pub(crate) struct Freq {
    pub ll: [u16; NUM_LL],
    pub off: [u16; NUM_OFF],
}

/// A match and the literals before it: run | length << 16 | distance << 32.
pub(crate) type Seq = u64;

/// What goes around a block's symbols.
#[derive(Clone, Copy)]
pub(crate) struct Place {
    /// Write the block header.  The output is then at a byte boundary.
    /// Without one, the block continues one that was begun before, at any
    /// bit.
    pub header: bool,
    /// The header says that this is the last block of the stream.
    pub last: bool,
    /// Write the end-of-block symbol.
    pub eob: bool,
}

impl Place {
    /// A whole block: header, symbols, end of block.
    pub(crate) const fn whole(last: bool) -> Self {
        Place { header: true, last, eob: true }
    }
}

/// Eight bytes of the input at `i`.  Unchecked where the compiler knows
/// that `i` is below 2^16: at a candidate, which is a 16-bit number, and at
/// a position inside a loop that ends before a 16-bit number.
#[inline(always)]
fn rd64(buf: &Input, i: usize) -> u64 {
    u64::from_le_bytes(buf[i..i + 8].try_into().unwrap())
}

/// Eight bytes of the input at `base + off`, for where the compiler does not
/// know how large a position is: outside the loops, it loses track.  Each of
/// the two is cut to a width that it fits anyway, and the cut happens here,
/// next to the read it is for.  (Cut in the caller, it is dropped as
/// unnecessary before the read is looked at, and the read then gets a check.)
#[inline(always)]
fn rd64_off(buf: &Input, base: u16, off: u8) -> u64 {
    rd64(buf, base as usize + off as usize)
}

/// Eight bytes to the output at `o`.  The mask changes nothing (see
/// `Output`) and is what makes the store unchecked.
#[inline(always)]
fn wr64(out: &mut Output, o: usize, v: u64) {
    let o = o & 0xFFFF;
    out[o..o + 8].copy_from_slice(&v.to_le_bytes());
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

/// The bits of a match of `len` bytes at distance `dist`, and how many.
/// One value of at most 47 bits: the length codeword with its extra bits
/// comes out of one table load, the offset codeword out of another, and the
/// offset's extra bits are arithmetic.  Also the indexes of the two symbols.
#[inline(always)]
fn match_bits(c: &Codes, len: usize, dist: usize) -> (u64, u32, u32, usize) {
    debug_assert!((MIN_MATCH..=MAX_MATCH).contains(&len) && (1..=32768).contains(&dist));
    let (slot, extra_n, extra) = off_slot(dist as u32 - 1);
    let le = c.len[len];
    // A slot is below 30; the mask is how the compiler knows.
    let oe = c.off[slot & (NUM_OFF - 1)];
    debug_assert!(le != 0 && oe != 0, "a length or offset without a codeword");
    let len_n = (le >> LEN_NBITS_SHIFT) & 31;
    let off_n = oe >> 16;
    let bits = (le & LEN_VALUE_MASK) as u64
        | ((oe & 0xFFFF) as u64) << len_n
        | (extra as u64) << (len_n + off_n);
    (bits, len_n + off_n + extra_n, le >> LEN_SLOT_SHIFT, slot)
}

/// Begins a block at bit `bitpos` of `out` and returns where its bits
/// continue: (byte, bit buffer, bits in it).
#[inline(always)]
fn start_block(c: &Codes, out: &mut Output, bitpos: usize, place: Place) -> (usize, u64, u32) {
    let at = (bitpos >> 3) & 0xFFFF;
    if !place.header {
        // Continue in the middle of a byte.  Above its bits in use it may
        // hold anything.
        let bit = (bitpos & 7) as u32;
        return (at, out[at] as u64 & ((1 << bit) - 1), bit);
    }
    debug_assert!(bitpos & 7 == 0);
    let nb = c.hdr_bits as usize;
    let full = nb >> 3;
    if full < 128 {
        // The usual header is 60 to 90 bytes.  A copy of a fixed size is a
        // few vector moves; one of `full` bytes is a call that first has to
        // find out how long it is.  What is copied beyond the header is
        // overwritten by the block.
        out[at..at + 128].copy_from_slice(&c.hdr[..128]);
    } else {
        out[at..at + full].copy_from_slice(&c.hdr[..full]);
    }
    let mut bitbuf = c.hdr[full] as u64 & ((1 << (nb & 7)) - 1);
    if !place.last {
        // The stored header says BFINAL = 1.
        if full == 0 {
            bitbuf &= !1;
        } else {
            out[at] &= !1;
        }
    }
    (at + full, bitbuf, (nb & 7) as u32)
}

/// What a flush leaves of the bit count: the bits of the unfinished byte,
/// and everything from bit 15 up, where a missing codeword leaves its mark.
const KEEP: u32 = !0x7FF8;

/// One block: `buf[start..end]` (at most `CHUNK` bytes) either written to
/// `out` with the codes `c` (`EMIT`), or recorded in `seqs` (not `EMIT`).
/// With `COUNT` the symbols are counted in `freq`, which the caller has
/// zeroed.
///
/// `buf[..start]` is what came before the block in the same payload, where
/// matches may begin: nothing, or the `CHUNK` bytes before it.  The table
/// then still holds those positions, unless `clear` says to forget them.
/// A block that begins at 0 always begins with an empty table.
///
/// With `EMIT`, the block is written from bit `bitpos` of `out` on, and what
/// comes back is the bit after it, or 0 if a byte of the block has no
/// codeword in `c`.  `bitpos` must leave `scratch(block length)` bytes below
/// 2^16, and `c` must have a codeword for every length and for every offset
/// slot the window allows.  Without `EMIT`, returns the number of `seqs`.
///
/// How it searches:
///
///   - One earlier position is kept per hash value, in a table with about
///     one entry per input byte (`1 << BITS`).  The table is zeroed at the
///     start of every payload.  That costs little at this size and walks the
///     table front to back, which fetches it much faster than the scattered
///     first touches of the lookups would when the thread has done other
///     work since its last payload.
///   - A position is an offset into the window, so an empty entry reads as
///     position 0.  The bytes there are compared like those of any other
///     candidate: no entry is tested for being empty, and the only branch in
///     a step is the one taken for a match.
///   - Each step reads eight bytes at the current position once.  The low
///     byte is the literal, the low four bytes are compared with the
///     candidate's, and bytes 1 to 5 are hashed for the next position, so
///     that the next lookup's address is ready before the next step begins.
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
///     table entry adds 2^15 to the bit count.  Shifts use the count modulo
///     64 and a flush keeps everything from bit 15 up, so the mark is still
///     there at the end, where it is looked at once.
///   - A match is assembled into one value (`match_bits`) and OR-ed in once.
#[inline(never)]
#[allow(clippy::too_many_arguments, unused_assignments)]
pub(crate) fn scan<const BITS: u32, const EMIT: bool, const COUNT: bool>(
    c: &Codes,
    tab: &mut Tab,
    freq: &mut Freq,
    seqs: &mut [Seq; MAX_SEQS],
    buf: &Input,
    start: u16,
    end: u16,
    clear: bool,
    out: &mut Output,
    bitpos: usize,
    place: Place,
) -> usize {
    // The two bounds arrive as 16-bit numbers, and the two below are worked
    // out as such, because that is what the compiler goes by: a position that
    // is before a 16-bit number is below 2^16, so what is read there is
    // inside `buf`.
    //
    // Positions from `stop` on are neither looked up nor entered into the
    // table: eight bytes are read at one that is, and at a candidate.
    let stop = end.saturating_sub(9) as usize;
    // Before this, four positions in a row are before `stop`: one bound
    // check per four steps.
    let stop4 = end.saturating_sub(12) as usize;
    let (start, end) = (start as usize, end as usize);
    debug_assert!(start <= end && end - start <= CHUNK && end <= 2 * CHUNK && BITS <= MAX_TAB_BITS);
    debug_assert!(start == 0 || (BITS == MAX_TAB_BITS && start == CHUNK));
    debug_assert!(clear || start != 0);
    debug_assert!(!EMIT || (bitpos >> 3) + scratch(end - start) <= 1 << 16);

    let (mut o, mut bitbuf, mut bitcount) = (0usize, 0u64, 0u32);
    if EMIT {
        (o, bitbuf, bitcount) = start_block(c, out, bitpos, place);
    }
    let mut n_seqs = 0usize;
    let mut run_start = start; // where the literals since the last match begin

    macro_rules! flush {
        () => {
            if EMIT {
                wr64(out, o, bitbuf);
                o += ((bitcount >> 3) & 7) as usize;
                bitbuf >>= bitcount & 56;
                bitcount &= KEEP;
            }
        };
    }
    macro_rules! literal {
        ($byte:expr) => {{
            let b = $byte as u8 as usize;
            if EMIT {
                let e = c.lit[b];
                bitbuf |= ((e & 0xFFFF) as u64).wrapping_shl(bitcount);
                bitcount = bitcount.wrapping_add(e >> 16);
            }
            if COUNT {
                freq.ll[b] = freq.ll[b].wrapping_add(1);
            }
        }};
    }
    // Not in the loop that every byte goes through, so these are checked.
    macro_rules! count_match {
        ($len_slot:expr, $off_slot:expr) => {{
            let (ls, os) = (FIRST_LEN + $len_slot as usize, $off_slot);
            freq.ll[ls] = freq.ll[ls].wrapping_add(1);
            freq.off[os] = freq.off[os].wrapping_add(1);
        }};
    }

    if clear {
        tab[..1 << BITS].fill(0);
    }

    let mut pos = start;

    'tail: {
        if start == 0 {
            if stop <= 1 {
                break 'tail;
            }
            // The first position has nothing before it to match, and it is
            // in the table already: it is what an empty entry says.
            literal!(buf[0]);
            flush!();
            pos = 1;
        } else if pos >= stop {
            break 'tail;
        }
        let mut next_hash = hash5::<BITS>(rd64(buf, pos));

        macro_rules! step {
            ($found:lifetime) => {{
                let w = rd64(buf, pos);
                let h = next_hash;
                let cand = tab[h] as usize;
                tab[h] = pos as u16;
                next_hash = hash5::<BITS>(w >> 8);
                let x = rd64(buf, cand) ^ w;
                if x as u32 == 0 {
                    break $found (cand, w, x);
                }
                literal!(w);
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
                // Eight bytes are equal: compare eight more at a time.  No
                // cast or mask below changes a value (a position is below
                // 2^15, `at` is a multiple of 8 below 251); they are there
                // for the compiler, which then needs no check on a read or
                // on the length that comes out.
                let max = (end - pos).min(MAX_MATCH); // 10 at least
                'len: {
                    let mut at = 8;
                    while at + 8 <= max {
                        let d = rd64_off(buf, pos as u16, at as u8) ^ rd64_off(buf, cand as u16, at as u8);
                        if d != 0 {
                            break 'len (at & 0xF8) + (d.trailing_zeros() >> 3) as usize;
                        }
                        at += 8;
                    }
                    if at < max {
                        // Fewer than eight bytes are left to compare: compare
                        // the last eight.  Those of them before `at` are
                        // equal, so a difference is where it would have been
                        // found byte by byte.
                        let last = max.saturating_sub(8);
                        let d = rd64_off(buf, pos as u16, last as u8) ^ rd64_off(buf, cand as u16, last as u8);
                        if d != 0 {
                            break 'len last + (d.trailing_zeros() >> 3) as usize;
                        }
                    }
                    max
                }
            };
            let dist = pos - cand;
            if EMIT {
                let (bits, nbits, len_slot, off_slot) = match_bits(c, len, dist);
                flush!(); // the literals of this group of steps
                bitbuf |= bits.wrapping_shl(bitcount);
                bitcount += nbits;
                flush!();
                if COUNT {
                    count_match!(len_slot, off_slot);
                }
            } else {
                count_match!(LEN_SLOT[len], off_slot(dist as u32 - 1).0);
                // A block has no more than `MAX_SEQS` matches, each being of
                // four bytes at least: the mask changes no index.
                debug_assert!(n_seqs < MAX_SEQS);
                seqs[n_seqs & (MAX_SEQS - 1)] =
                    (pos - run_start) as u64 | (len as u64) << 16 | (dist as u64) << 32;
                n_seqs += 1;
                run_start = pos + len;
            }

            // pos + 1 and pos + 2 are before `stop` + 1, so eight bytes can
            // be read there when they come up as candidates.
            tab[next_hash] = (pos + 1) as u16;
            tab[hash5::<BITS>(w >> 16)] = (pos + 2) as u16;
            pos += len;
            if pos >= stop {
                break 'tail;
            }
            let last = pos - 1;
            let v = rd64_off(buf, last as u16, 0);
            tab[hash5::<BITS>(v)] = last as u16;
            next_hash = hash5::<BITS>(v >> 8);
        }
    }

    // The last few bytes, where nothing can be hashed.  Nothing is waiting
    // in the bit buffer but the up to 7 bits that every flush leaves.
    let mut quads = buf[pos..end].chunks_exact(4);
    for q in &mut quads {
        literal!(q[0]);
        literal!(q[1]);
        literal!(q[2]);
        literal!(q[3]);
        flush!();
    }
    for &b in quads.remainder() {
        literal!(b);
    }
    if !EMIT {
        return n_seqs;
    }
    flush!();
    if place.eob {
        bitbuf |= ((c.eob & 0xFFFF) as u64).wrapping_shl(bitcount);
        bitcount += c.eob >> 16;
        flush!();
    }
    // The store of the last flush put the bits that are left at out[o].
    if bitcount > 7 {
        return 0;
    }
    8 * o + bitcount as usize
}

/// Writes the block that `scan` recorded in `seqs`, with the codes `c`, which
/// must have a codeword for every symbol of the block, from bit `bitpos` of
/// `out` on.  Returns the bit after it.  `bitpos` must leave
/// `scratch(block length)` bytes below 2^16.
#[inline(never)]
#[allow(unused_assignments, clippy::too_many_arguments)]
pub(crate) fn emit_seqs(
    c: &Codes,
    buf: &Input,
    start: usize,
    end: usize,
    seqs: &[Seq],
    out: &mut Output,
    bitpos: usize,
    place: Place,
) -> usize {
    debug_assert!((bitpos >> 3) + scratch(end - start) <= 1 << 16 && c.eob >> 16 != 0);
    let (mut o, mut bitbuf, mut bitcount) = start_block(c, out, bitpos, place);
    let mut pos = start;

    macro_rules! flush {
        () => {
            wr64(out, o, bitbuf);
            o += ((bitcount >> 3) & 7) as usize;
            bitbuf >>= bitcount & 56;
            bitcount &= KEEP;
        };
    }
    macro_rules! literal {
        ($byte:expr) => {{
            let e = c.lit[$byte as usize];
            bitbuf |= ((e & 0xFFFF) as u64).wrapping_shl(bitcount);
            bitcount = bitcount.wrapping_add(e >> 16);
        }};
    }
    // The literals up to `$to`: one check for the run, none per byte.
    macro_rules! literals {
        ($to:expr) => {{
            let to = $to;
            let mut quads = buf[pos..to].chunks_exact(4);
            for q in &mut quads {
                literal!(q[0]);
                literal!(q[1]);
                literal!(q[2]);
                literal!(q[3]);
                flush!();
            }
            // Up to three more: with the 7 bits a flush leaves, 49 at most.
            for &b in quads.remainder() {
                literal!(b);
            }
            flush!();
            pos = to;
        }};
    }

    for &s in seqs {
        let run = (s & 0xFFFF) as usize;
        let len = ((s >> 16) & 0xFFFF) as usize;
        let dist = (s >> 32) as usize;
        literals!(pos + run);
        let (bits, nbits, _, _) = match_bits(c, len, dist);
        bitbuf |= bits.wrapping_shl(bitcount);
        bitcount += nbits;
        flush!();
        pos += len;
    }
    literals!(end);
    if place.eob {
        bitbuf |= ((c.eob & 0xFFFF) as u64).wrapping_shl(bitcount);
        bitcount += c.eob >> 16;
        flush!();
    }
    debug_assert!(bitcount <= 7, "a byte without a codeword");
    8 * o + (bitcount & 7) as usize
}

/// A stored block at bit `bitpos` of `out`, which is a byte boundary: five
/// bytes and the input as it is.  Returns the bit after it.
pub(crate) fn stored(inp: &[u8], out: &mut [u8], bitpos: usize, last: bool) -> usize {
    let n = inp.len();
    debug_assert!(n <= 0xFFFF && bitpos & 7 == 0);
    let out = &mut out[bitpos >> 3..][..n + 5];
    out[0] = last as u8; // BFINAL, BTYPE = 0, and padding to the byte boundary
    out[1..3].copy_from_slice(&(n as u16).to_le_bytes());
    out[3..5].copy_from_slice(&(!(n as u16)).to_le_bytes());
    out[5..].copy_from_slice(inp);
    bitpos + 8 * (n + 5)
}

/// Appends `n` bits (at most 24) at bit `bitpos` of `out`, whose byte there
/// may hold anything above the bits in use.  Returns the new bit position.
/// For the few bits between blocks; a block's own bits go through the
/// encoder's buffer.
pub(crate) fn append_bits(out: &mut [u8], bitpos: usize, bits: u32, n: u32) -> usize {
    debug_assert!(n <= 24 && bits >> n == 0);
    let (o, used) = (bitpos >> 3, (bitpos & 7) as u32);
    let cur = if used == 0 { 0 } else { out[o] as u32 & ((1 << used) - 1) };
    out[o..o + 4].copy_from_slice(&(cur | bits << used).to_le_bytes());
    bitpos + n as usize
}

/// Brings `bitpos` to a byte boundary without ending the stream: an empty
/// stored block is three zero bits, zero bits up to the boundary, and
/// 00 00 FF FF.  A block header is copied in whole bytes, so a block that
/// begins with one has to begin on a boundary.
pub(crate) fn align(out: &mut [u8], bitpos: usize) -> usize {
    if bitpos & 7 == 0 {
        return bitpos;
    }
    let o = (append_bits(out, bitpos, 0, 3) + 7) >> 3;
    out[o..o + 4].copy_from_slice(&[0, 0, 0xff, 0xff]);
    8 * (o + 4)
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

    #[test]
    fn bits_between_blocks() {
        let mut buf = [0xffu8; 16];
        let p = append_bits(&mut buf, 0, 0b101, 3);
        assert_eq!(p, 3);
        let p = append_bits(&mut buf, p, 0x3ff, 10);
        assert_eq!((p, buf[0], buf[1] & 0x1f), (13, 0xfd, 0x1f));
        buf[1] |= 0xe0; // garbage above the bits in use
        let p = align(&mut buf, p);
        assert_eq!((p, &buf[1..6]), (48, &[0x1f, 0, 0, 0xff, 0xff][..]));
        assert_eq!(align(&mut buf, p), p);
        // 6 bits in use: the three header bits spill into the next byte
        buf[6] = 0xff;
        buf[7] = 0xff;
        let p = align(&mut buf, 48 + 6);
        assert_eq!((p, &buf[6..12]), (96, &[0x3f, 0, 0, 0, 0xff, 0xff][..]));
    }
}
