//! Writing a block of levels 1 to 9: the matches a search found, with the
//! literals between them, as DEFLATE bits.
//!
//! The work is the same as `enc::emit_seqs` does for level 0; what differs
//! is what suits a block whose codes were made for it and that may begin in
//! the middle of a byte, and that the search has already worked out, for
//! each match, the symbol and the extra bits of its distance.

use crate::codes::*;
use crate::tables::*;
use core::ptr;

/// A match and the literals before it:
/// run | length << 16 | extra bits of the distance << 32 | its symbol << 48
/// | the number of extra bits << 56.
pub(crate) type Token = u64;

/// The token of a match of `len` bytes, `dist` bytes back, after `run`
/// literals; and the distance's symbol.
#[inline(always)]
pub(crate) fn token(run: usize, len: usize, dist: usize) -> (Token, usize) {
    debug_assert!(run <= 0xFFFF && (MIN_MATCH..=MAX_MATCH).contains(&len) && (1..=32768).contains(&dist));
    let (slot, extra_n, extra) = crate::enc::off_slot(dist as u32 - 1);
    let t = run as u64
        | (len as u64) << 16
        | (extra as u64) << 32
        | (slot as u64) << 48
        | (extra_n as u64) << 56;
    (t, slot)
}

#[inline(always)]
unsafe fn wr64(p: *mut u8, i: usize, cap: usize, v: u64) {
    debug_assert!(i + 8 <= cap);
    let _ = cap;
    ptr::write_unaligned(p.add(i) as *mut u64, v.to_le())
}

/// Writes the block `ip[..n]`, whose matches are `tokens`, at bit `bitpos`
/// of `out`, with the codes `c`: header, symbols, end of block.  Returns the
/// new bit position.
///
/// `c` has a codeword for every symbol of the block.  `out` has room for
/// the bits and for 136 bytes after where they begin: the header is copied
/// 128 bytes at a time, and bits are stored eight bytes at a time.
#[inline(never)]
#[allow(clippy::too_many_arguments, unused_assignments)]
pub(crate) unsafe fn write_block(
    c: &Codes,
    ip: *const u8,
    n: usize,
    tokens: &[Token],
    out: *mut u8,
    cap: usize,
    bitpos: usize,
    last: bool,
) -> usize {
    let lit = c.lit.as_ptr();
    let mut o = bitpos >> 3;
    let used = (bitpos & 7) as u32;
    let (mut bitbuf, mut bitcount): (u64, u32);

    // After a flush fewer than eight bits are left in the buffer.
    macro_rules! flush {
        () => {
            wr64(out, o, cap, bitbuf);
            o += (bitcount >> 3) as usize;
            bitbuf >>= bitcount & 56;
            bitcount &= 7;
        };
    }
    macro_rules! literal {
        ($i:expr) => {{
            debug_assert!($i < n);
            let e = *lit.add(*ip.add($i) as usize);
            bitbuf |= ((e & 0xFFFF) as u64) << bitcount;
            bitcount += e >> 16;
        }};
    }

    let nb = c.hdr_bits as usize;
    if used == 0 {
        // The header as it was stored: whole bytes, a fixed number of them
        // where that is enough (it is copied faster), then the bits of the
        // last one.  What is copied beyond the header is overwritten.
        let full = nb >> 3;
        debug_assert!(o + full.max(128) <= cap);
        if full < 128 {
            ptr::copy_nonoverlapping(c.hdr.as_ptr(), out.add(o), 128);
        } else {
            ptr::copy_nonoverlapping(c.hdr.as_ptr(), out.add(o), full);
        }
        bitbuf = c.hdr[full] as u64 & ((1 << (nb & 7)) - 1);
        bitcount = (nb & 7) as u32;
        if !last {
            // The stored header says BFINAL = 1.
            if full == 0 {
                bitbuf &= !1;
            } else {
                *out.add(o) &= !1;
            }
        }
        o += full;
    } else {
        // In the middle of a byte: a byte of the header at a time.  Only a
        // payload of more than one block comes here.
        bitbuf = *out.add(o) as u64 & ((1 << used) - 1);
        bitcount = used;
        let mut i = 0;
        while 8 * i < nb {
            let take = (nb - 8 * i).min(8) as u32;
            let mut b = c.hdr[i] as u64 & ((1 << take) - 1);
            if i == 0 && !last {
                b &= !1;
            }
            bitbuf |= b << bitcount;
            bitcount += take;
            flush!();
            i += 1;
        }
    }

    let mut p = 0usize;
    for &t in tokens {
        let run = (t & 0xFFFF) as usize;
        let len = (t >> 16 & 0xFFFF) as usize;
        let end = p + run;
        debug_assert!(end + len <= n);
        // Four literals fit in the buffer with what a flush leaves.
        while p + 4 <= end {
            literal!(p);
            literal!(p + 1);
            literal!(p + 2);
            literal!(p + 3);
            flush!();
            p += 4;
        }
        // Up to three more.  How many is hard to predict, so there is no
        // branch on it: three bytes are looked up (they are there, the match
        // is at least that long), and those that are not literals add no
        // bits.
        let left = end - p;
        let e0 = *lit.add(*ip.add(p) as usize) & ((left > 0) as u32).wrapping_neg();
        let e1 = *lit.add(*ip.add(p + 1) as usize) & ((left > 1) as u32).wrapping_neg();
        let e2 = *lit.add(*ip.add(p + 2) as usize) & ((left > 2) as u32).wrapping_neg();
        bitbuf |= ((e0 & 0xFFFF) as u64) << bitcount;
        bitcount += e0 >> 16;
        bitbuf |= ((e1 & 0xFFFF) as u64) << bitcount;
        bitcount += e1 >> 16;
        bitbuf |= ((e2 & 0xFFFF) as u64) << bitcount;
        bitcount += e2 >> 16;
        flush!();

        // The match: at most 14 + 5 bits of length and 15 + 13 of distance.
        let le = *c.len.as_ptr().add(len);
        let oe = *c.off.as_ptr().add((t >> 48 & 0xFF) as usize);
        debug_assert!(le != 0 && oe >> 16 != 0, "a length or distance without a codeword");
        let len_n = le >> LEN_NBITS_SHIFT & 31;
        let off_n = oe >> 16;
        bitbuf |= ((le & LEN_VALUE_MASK) as u64
            | ((oe & 0xFFFF) as u64) << len_n
            | (t >> 32 & 0xFFFF) << (len_n + off_n))
            << bitcount;
        bitcount += len_n + off_n + (t >> 56) as u32;
        flush!();
        p = end + len;
    }
    // The literals after the last match.
    while p + 4 <= n {
        literal!(p);
        literal!(p + 1);
        literal!(p + 2);
        literal!(p + 3);
        flush!();
        p += 4;
    }
    while p < n {
        literal!(p);
        p += 1;
    }
    flush!();
    debug_assert!(c.eob >> 16 != 0);
    bitbuf |= ((c.eob & 0xFFFF) as u64) << bitcount;
    bitcount += c.eob >> 16;
    flush!();
    8 * o + bitcount as usize
}
