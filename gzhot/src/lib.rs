//! gzip for a stream of small, similar payloads (JSON requests of a few
//! kilobytes) on a hot path.  Pure Rust; the output is ordinary gzip.
//!
//! ```
//! // On the worker thread, inside the task; `body` is your request body.
//! # let (payload, mut body) = (vec![b'a'; 5000], Vec::new());
//! gzhot::gzip_with(&payload, |gz| body.extend_from_slice(gz));
//! ```
//!
//! or keep a compressor of your own, for instance one per recipient:
//!
//! ```
//! let mut gz = gzhot::Gzip::new();
//! let bytes: &[u8] = gz.compress(b"{\"id\":\"1\"}");
//! # assert_eq!(&bytes[..2], &[0x1f, 0x8b]);
//! ```
//!
//! What makes it cheap is that consecutive payloads of one [`Gzip`] share
//! their Huffman codes.  A general compressor reads a payload twice: once to
//! find repetitions and count symbols, then, with codes made from the counts,
//! again to write.  Here the codes exist before the payload arrives (they
//! come from the payloads before it), so it is written while it is searched.
//! Nothing but the codes is carried from one payload to the next, and every
//! output is a complete gzip stream that any decoder reads on its own.
//!
//! The output is a few percent larger than libdeflate's at level 1, and it
//! depends on what the compressor was given before.  Use one compressor per
//! kind of payload: codes made for one recipient's requests fit another's
//! poorly, and a payload they do not fit is written the slow way.

#![warn(missing_docs)]

mod codes;
mod enc;
mod huff;
mod tables;

use codes::{Codes, FIXED};
use enc::{emit_seqs, scan, scratch, stored, Freq, Seq, Tab, CHUNK, MAX_SEQS};
use std::cell::RefCell;
use tables::*;

/// A block is written in one pass only if it is at least this long.  For a
/// shorter one the header of a dynamic block is a large part of the output,
/// and whether the fixed codes would do better has to be worked out.
const MIN_ONE_PASS: usize = 1024;
/// One block in this many has its symbols counted while it is written in one
/// pass.  A power of two.
const SAMPLE: u32 = 8;
/// The shared codes are remade after 1, 2, 4 ... and then every this many
/// blocks.
const MAX_PERIOD: u32 = 64;
/// Offset slots that the shared codes always have a codeword for: all that a
/// block of `CHUNK` bytes can use.
const SHARED_OFF_SLOTS: usize = 28;

/// The members of the gzip header: magic, deflate, no flags, no time, "fastest
/// algorithm", unknown system.  The same ten bytes libdeflate writes at level 1.
const GZIP_HEADER: [u8; 10] = [0x1f, 0x8b, 8, 0, 0, 0, 0, 0, 4, 0xff];

/// How a compressor's blocks were written; see [`Gzip::stats`].  A payload of
/// up to 16 KiB is one block.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct Stats {
    /// Written in one pass with the shared codes: the fast path.
    pub one_pass: u64,
    /// Searched first, then written with the shared codes: the first payload,
    /// payloads under 1 KiB, and the ones after a payload that did not fit.
    pub two_pass: u64,
    /// Written with codes of their own, because the shared ones fitted badly.
    pub own_codes: u64,
    /// Written with the fixed codes of the format (very small payloads).
    pub fixed: u64,
    /// Stored as they are (payloads that do not compress).
    pub stored: u64,
    /// Times the shared codes were made.
    pub rebuilds: u64,
}

/// Everything a compressor keeps, in one allocation.  The fields that every
/// call reads come first and are followed by the tables of the shared codes,
/// so that a call that finds its caches cold has few lines to fetch.
#[repr(C, align(64))]
struct State {
    /// The shared codes exist.
    valid: bool,
    /// The last block that was looked at closely suited the shared codes.
    direct_ok: bool,
    /// Blocks between two makings of the shared codes.
    period: u32,
    since_build: u32,
    /// One-pass blocks, for sampling.
    calls: u32,
    /// Blocks in a row that the shared codes fitted badly.
    misses: u32,
    miss_limit: u32,
    stats: Stats,
    shared: Codes,
    freq: Freq,
    /// Symbol counts of the blocks so far; halved whenever codes are made
    /// from them, so that old payloads fade.
    acc_ll: [u32; NUM_LL],
    acc_off: [u32; NUM_OFF],
    /// Codes for one block that the shared ones do not suit.
    own: Codes,
    seqs: [Seq; MAX_SEQS],
    tab: Tab,
}

/// A gzip compressor for payloads of one kind.
///
/// It owns its working memory (about 90 KiB) and its output buffer, and
/// allocates nothing per call once the buffer has grown to fit.  It is
/// `Send`, so it can live in a `thread_local!`, in a pool, or in a task.
pub struct Gzip {
    st: Box<State>,
    out: Vec<u8>,
}

impl Default for Gzip {
    fn default() -> Self {
        Self::new()
    }
}

impl Gzip {
    /// A new compressor.  Its first payload costs about as much as with a
    /// general compressor; the ones after it take the fast path.
    pub fn new() -> Self {
        // SAFETY: every field of State is an integer, a bool or an array of
        // integers, for which all-zero bytes are a valid value.  Zeroed in
        // the allocation, not built on the stack and moved.
        let mut st: Box<State> = unsafe { Box::new_zeroed().assume_init() };
        st.period = 1;
        st.miss_limit = 3;
        Gzip { st, out: Vec::new() }
    }

    /// Compress `payload` into this compressor's buffer and return the gzip
    /// bytes.  They are valid until the next call.
    pub fn compress(&mut self, payload: &[u8]) -> &[u8] {
        let n = payload.len();
        // The checksum first.  It reads the payload front to back, which
        // also brings it into the cache for the encoder.
        let crc = crc32fast::hash(payload);

        // Room for the worst case, so that nothing below tests for space:
        // every block ends up no larger than stored (its bytes, 5 for the
        // block header and 6 where the next block is made to start on a byte
        // boundary), and the block being written may use `scratch` bytes
        // before its size is known.
        let cap = 18 + n + 16 * (n / CHUNK + 1) + scratch(n.min(CHUNK));
        self.out.clear();
        self.out.reserve(cap); // no call once the buffer has grown
        let out = self.out.as_mut_ptr();
        let st = &mut *self.st;

        // SAFETY: the buffer has `cap` bytes.  `o` stays below what the
        // comment above adds up, and each block gets what is left from `o`.
        unsafe {
            core::ptr::copy_nonoverlapping(GZIP_HEADER.as_ptr(), out, 10);
            let mut o = 10;
            let mut rest = payload;
            loop {
                let (block, tail) = rest.split_at(rest.len().min(CHUNK));
                let last = tail.is_empty();
                let bits = st.block(block, out.add(o), cap - o, last);
                debug_assert!(bits.div_ceil(8) <= block.len() + 5);
                o += bits >> 3;
                let used = bits & 7; // bits of out[o] that are in use
                if last {
                    o += (used != 0) as usize;
                    break;
                }
                if used != 0 {
                    // Each block starts with a copy of its header, which
                    // needs a byte boundary.  An empty stored block gets
                    // there: three zero bits, zero bits up to the boundary,
                    // then 00 00 FF FF.  The byte at o is zero above the
                    // bits in use; the one after it may not be.
                    if used > 5 {
                        o += 1;
                        *out.add(o) = 0;
                    }
                    o += 1;
                    core::ptr::copy_nonoverlapping([0u8, 0, 0xff, 0xff].as_ptr(), out.add(o), 4);
                    o += 4;
                }
                rest = tail;
            }
            core::ptr::copy_nonoverlapping(crc.to_le_bytes().as_ptr(), out.add(o), 4);
            core::ptr::copy_nonoverlapping((n as u32).to_le_bytes().as_ptr(), out.add(o + 4), 4);
            debug_assert!(o + 8 <= cap);
            self.out.set_len(o + 8);
        }
        &self.out
    }

    /// How this compressor's blocks have been written so far.  If `own_codes`
    /// keeps growing, the payloads it is given are not of one kind.
    pub fn stats(&self) -> Stats {
        self.st.stats
    }
}

/// `scan` with the table size that suits `n` input bytes: the smallest that
/// has an entry for every position (8 KiB for up to 4096 bytes, 16 and 32 KiB
/// above; 2 KiB for small payloads).  A smaller table is quicker to clear and
/// to fetch, and a larger one finds only slightly more.  The size is a
/// constant in each copy of `scan`.
macro_rules! scan_sized {
    ($n:expr, $emit:literal, $count:literal, $($arg:expr),+) => {
        match $n {
            0..=1024 => scan::<10, $emit, $count>($($arg),+),
            1025..=4096 => scan::<12, $emit, $count>($($arg),+),
            4097..=8192 => scan::<13, $emit, $count>($($arg),+),
            _ => scan::<14, $emit, $count>($($arg),+),
        }
    };
}

impl State {
    /// Writes one block of at most `CHUNK` bytes at `out`, which is at a byte
    /// boundary and has `cap` >= `scratch(inp.len())` bytes.  Returns the
    /// number of bits written: never more than a stored block would take.
    #[inline]
    unsafe fn block(&mut self, inp: &[u8], out: *mut u8, cap: usize, last: bool) -> usize {
        let n = inp.len();
        if n >= MIN_ONE_PASS && self.valid && self.direct_ok {
            self.calls = self.calls.wrapping_add(1);
            // Count the symbols of one block in SAMPLE, and of the block
            // after which the codes are due to be remade.  The counts go
            // into the next codes and say whether the current ones still fit.
            let count = self.calls % SAMPLE == 0 || self.since_build + 1 >= self.period;
            let bits = if count {
                self.freq = Freq { ll: [0; NUM_LL], off: [0; NUM_OFF] };
                scan_sized!(
                    n, true, true,
                    &self.shared, &mut self.tab, &mut self.freq, &mut self.seqs, inp, out, cap, last
                )
            } else {
                scan_sized!(
                    n, true, false,
                    &self.shared, &mut self.tab, &mut self.freq, &mut self.seqs, inp, out, cap, last
                )
            };
            // 0: a byte the codes have no codeword for.
            if bits != 0 && bits <= 8 * (n + 5) {
                if !count {
                    self.since_build += 1;
                    self.stats.one_pass += 1;
                    return bits;
                }
                self.freq.ll[EOB] = 1;
                let (sym_bits, _) = sym_cost(&self.shared, &self.freq);
                if fits(sym_bits, entropy(&self.freq)) {
                    self.accumulate();
                    self.misses = 0;
                    self.miss_limit = 3;
                    self.since_build += 1;
                    self.stats.one_pass += 1;
                    if self.since_build >= self.period {
                        self.build_shared(); // for the blocks that follow
                    }
                    return bits;
                }
            }
        }
        self.two_pass(inp, out, cap, last)
    }

    /// Searches the block first, then writes it with whichever codes make it
    /// smallest: the shared ones if they fit, else its own, the fixed ones,
    /// or none.
    #[inline(never)]
    unsafe fn two_pass(&mut self, inp: &[u8], out: *mut u8, cap: usize, last: bool) -> usize {
        let n = inp.len();
        self.freq = Freq { ll: [0; NUM_LL], off: [0; NUM_OFF] };
        let n_seqs = scan_sized!(
            n, false, true,
            &FIXED, &mut self.tab, &mut self.freq, &mut self.seqs, inp, out, cap, last
        );
        self.freq.ll[EOB] = 1;
        self.accumulate();
        let mut built = false;
        if !self.valid || self.since_build >= self.period {
            self.build_shared();
            built = true;
        }
        self.since_build += 1;

        let (extra_bits, fixed_syms) = extra_and_fixed(&self.freq);
        let fixed_bits = 3 + fixed_syms + extra_bits;
        let stored_bits = 8 * (n as u32 + 5);
        let entropy = entropy(&self.freq);
        loop {
            let (sym_bits, covered) = sym_cost(&self.shared, &self.freq);
            if !covered {
                // A symbol without a codeword.  The counts now include it.
                if built {
                    self.direct_ok = false;
                    break;
                }
                self.build_shared();
                built = true;
                continue;
            }
            let bits = self.shared.hdr_bits + sym_bits + extra_bits;
            if bits > stored_bits || bits > fixed_bits {
                // Too small for a header of its own, or it does not compress.
                // That says nothing about the codes unless the block is one
                // that would have been written in one pass.
                if n >= MIN_ONE_PASS {
                    self.direct_ok = false;
                }
                break;
            }
            if !fits(sym_bits, entropy) {
                if !built {
                    self.misses += 1;
                    if self.misses >= self.miss_limit {
                        // Several in a row: the payloads have changed.  Make
                        // codes from the recent ones, and wait longer next
                        // time if that is no help.
                        self.misses = 0;
                        self.miss_limit = (2 * self.miss_limit).min(96);
                        self.build_shared();
                        built = true;
                        continue;
                    }
                }
                self.direct_ok = false;
                break;
            }
            self.misses = 0;
            self.miss_limit = 3;
            self.direct_ok = true;
            self.stats.two_pass += 1;
            return emit_seqs(&self.shared, inp, &self.seqs[..n_seqs], out, cap, last);
        }

        // Codes of its own, unless they cannot win: no code needs fewer bits
        // for the symbols than their entropy, and a header comes on top.
        let mut own_bits = u32::MAX;
        if entropy + MIN_OWN_HEADER < fixed_bits.min(stored_bits) {
            let mut f_ll = [0u32; NUM_LL];
            let mut f_off = [0u32; NUM_OFF];
            for (w, &f) in f_ll.iter_mut().zip(self.freq.ll.iter()) {
                *w = f as u32;
            }
            for (w, &f) in f_off.iter_mut().zip(self.freq.off.iter()) {
                *w = f as u32;
            }
            self.own.build(&f_ll, &f_off);
            own_bits = self.own.hdr_bits + sym_cost(&self.own, &self.freq).0 + extra_bits;
        }
        if stored_bits <= fixed_bits && stored_bits <= own_bits {
            self.stats.stored += 1;
            stored(inp, out, cap, last)
        } else if fixed_bits <= own_bits {
            self.stats.fixed += 1;
            emit_seqs(&FIXED, inp, &self.seqs[..n_seqs], out, cap, last)
        } else {
            self.stats.own_codes += 1;
            emit_seqs(&self.own, inp, &self.seqs[..n_seqs], out, cap, last)
        }
    }

    fn accumulate(&mut self) {
        for (a, &f) in self.acc_ll.iter_mut().zip(self.freq.ll.iter()) {
            *a += f as u32;
        }
        for (a, &f) in self.acc_off.iter_mut().zip(self.freq.off.iter()) {
            *a += f as u32;
        }
    }

    /// Makes the codes that the next blocks will share, from the symbol
    /// counts of the blocks so far.
    #[cold]
    fn build_shared(&mut self) {
        // Scale the counts so that the code builder's limit holds and a
        // symbol that was seen at all keeps a count.  Then give a small count
        // to what any text may use next (printable ASCII, every match length,
        // every offset a block can have), so that a symbol appearing for the
        // first time rarely forces new codes.
        fn scale(acc: &[u32], f: &mut [u32]) {
            let total: u64 = acc.iter().map(|&a| a as u64).sum();
            let mut shift = 0;
            while total >> shift > 1 << 17 {
                shift += 1;
            }
            for (f, &a) in f.iter_mut().zip(acc) {
                *f = if a != 0 { (a >> shift).max(1) * 16 } else { 0 };
            }
        }
        let mut f_ll = [0u32; NUM_LL];
        let mut f_off = [0u32; NUM_OFF];
        scale(&self.acc_ll, &mut f_ll);
        scale(&self.acc_off, &mut f_off);
        for f in &mut f_ll[0x20..0x7f] {
            *f += 1;
        }
        for b in [b'\t', b'\n', b'\r'] {
            f_ll[b as usize] += 1;
        }
        for f in &mut f_ll[EOB..FIRST_LEN + NUM_LEN] {
            *f += 1;
        }
        for f in &mut f_off[..SHARED_OFF_SLOTS] {
            *f += 1;
        }
        self.shared.build(&f_ll, &f_off);

        // Older blocks count for half as much in the next codes.
        for a in self.acc_ll.iter_mut().chain(self.acc_off.iter_mut()) {
            *a = (*a + 1) >> 1;
        }
        self.valid = true;
        self.since_build = 0;
        self.period = (2 * self.period).min(MAX_PERIOD);
        self.stats.rebuilds += 1;
    }
}

/// The least a dynamic block's header can take, roughly: 17 bits, four
/// precode lengths, and a few bits per run of code lengths.
const MIN_OWN_HEADER: u32 = 64;

/// Do codes that need `sym_bits` for a block's symbols fit it?  No code can
/// use fewer bits than the symbols' entropy; codes made for other payloads
/// that need 3% more than that (and 8 bytes) fit this one badly.
#[inline]
fn fits(sym_bits: u32, entropy: u32) -> bool {
    sym_bits <= entropy + (entropy >> 5) + 64
}

/// The bits the codes `c` need for the symbols counted in `f` (without the
/// extra bits of lengths and offsets), and whether every symbol that occurs
/// has a codeword.
fn sym_cost(c: &Codes, f: &Freq) -> (u32, bool) {
    let mut bits = 0u32;
    let mut uncovered = false;
    for (&n, &l) in f.ll.iter().zip(c.ll_lens.iter()) {
        bits += n as u32 * l as u32;
        uncovered |= (n != 0) & (l == 0);
    }
    for (&n, &l) in f.off.iter().zip(c.off_lens.iter()) {
        bits += n as u32 * l as u32;
        uncovered |= (n != 0) & (l == 0);
    }
    (bits, !uncovered)
}

/// The entropy of the symbols counted in `f`, in bits: the two alphabets
/// taken separately.
fn entropy(f: &Freq) -> u32 {
    let (mut n_ll, mut n_off, mut sum) = (0u32, 0u32, 0u32);
    for &n in f.ll.iter() {
        n_ll += n as u32;
        sum += flog2(n as u32);
    }
    for &n in f.off.iter() {
        n_off += n as u32;
        sum += flog2(n as u32);
    }
    (flog2(n_ll) + flog2(n_off) - sum) >> 8
}

/// The extra bits of the lengths and offsets counted in `f`, and the bits the
/// fixed codes need for its symbols.
fn extra_and_fixed(f: &Freq) -> (u32, u32) {
    let (mut extra, mut fixed) = (0u32, 0u32);
    for (&n, &l) in f.ll.iter().zip(FIXED.ll_lens.iter()) {
        fixed += n as u32 * l as u32;
    }
    for (s, &n) in f.ll[FIRST_LEN..FIRST_LEN + NUM_LEN].iter().enumerate() {
        extra += n as u32 * LEN_EXTRA[s] as u32;
    }
    for (s, &n) in f.off[..USED_OFF].iter().enumerate() {
        extra += n as u32 * OFF_EXTRA[s] as u32;
        fixed += n as u32 * 5;
    }
    (extra, fixed)
}

thread_local! {
    static LOCAL: RefCell<Gzip> = RefCell::new(Gzip::new());
}

/// gzip `payload` with this thread's compressor and hand the bytes to `f`.
///
/// Call it on the worker thread itself, not through `spawn_blocking`: the
/// compression takes microseconds, and the compressor belongs to the thread.
/// All payloads compressed this way on one thread share their codes, so use
/// it for payloads of one kind, and a [`Gzip`] of your own for each other
/// kind.
///
/// # Panics
///
/// If `f` calls `gzip_with` again.
pub fn gzip_with<R>(payload: &[u8], f: impl FnOnce(&[u8]) -> R) -> R {
    LOCAL.with(|g| f(g.borrow_mut().compress(payload)))
}

/// [`Gzip::stats`] of this thread's compressor.
pub fn local_stats() -> Stats {
    LOCAL.with(|g| g.borrow().stats())
}

#[cfg(test)]
mod probe {
    use super::*;

    /// `GZHOT_PROBE=records.bin cargo test --release --lib session_probe -- --nocapture`
    #[test]
    fn session_probe() {
        let Ok(path) = std::env::var("GZHOT_PROBE") else { return };
        let data = std::fs::read(path).unwrap();
        let mut gz = Gzip::new();
        let (mut off, mut recs, mut bytes, mut out) = (0, 0usize, 0usize, 0usize);
        let mut hdr = 0usize;
        while off + 4 <= data.len() {
            let n = u32::from_le_bytes(data[off..off + 4].try_into().unwrap()) as usize;
            let rec = &data[off + 4..off + 4 + n];
            off += 4 + n;
            out += gz.compress(rec).len();
            recs += 1;
            bytes += n;
            hdr += gz.st.shared.hdr_bits as usize;
        }
        println!("{recs} records, {} B each -> {} B each; shared header {} bits on average, {} at the end",
            bytes / recs, out / recs, hdr / recs, gz.st.shared.hdr_bits);
        let c = &gz.st.shared;
        let lens: Vec<u8> = c.ll_lens[..USED_LL].to_vec();
        println!("literal lengths: {:?}", &lens[..128]);
        println!("high bytes with a codeword: {}", lens[128..256].iter().filter(|&&l| l != 0).count());
        println!("eob and lengths: {:?}", &lens[256..]);
        println!("offsets: {:?}", &c.off_lens[..USED_OFF]);
        println!("{:?}", gz.stats());
    }
}

#[cfg(test)]
mod level_probe {
    use super::*;

    fn lg(f: u32) -> u32 {
        // log2 in 1/256 bit
        if f < 256 {
            return LOG2_Q8[f as usize] as u32;
        }
        let k = 24 - f.leading_zeros();
        (k << 8) + LOG2_Q8[(f >> k) as usize] as u32
    }

    fn level(f: &mut [u32], w: u32, min_run: usize) {
        let mut i = 0;
        while i < f.len() {
            if f[i] == 0 {
                i += 1;
                continue;
            }
            let (mut lo, mut hi) = (lg(f[i]), lg(f[i]));
            let mut sum = f[i] as u64;
            let mut j = i + 1;
            while j < f.len() && f[j] != 0 {
                let q = lg(f[j]);
                if q.max(hi) - q.min(lo) > w {
                    break;
                }
                lo = lo.min(q);
                hi = hi.max(q);
                sum += f[j] as u64;
                j += 1;
            }
            if j - i >= min_run {
                let avg = ((sum + (j - i) as u64 / 2) / (j - i) as u64).max(1) as u32;
                for x in &mut f[i..j] {
                    *x = avg;
                }
            }
            i = j;
        }
    }

    /// `GZHOT_PROBE=records.bin cargo test --release --lib level_probe -- --nocapture`
    #[test]
    fn level_probe() {
        let Ok(path) = std::env::var("GZHOT_PROBE") else { return };
        let data = std::fs::read(path).unwrap();
        let mut tab = Box::new(Tab([0; 1 << enc::MAX_TAB_BITS]));
        let mut seqs = Box::new([0u64; MAX_SEQS]);
        let mut tot_ll = [0u32; NUM_LL];
        let mut tot_off = [0u32; NUM_OFF];
        let (mut off, mut recs, mut extra, mut bytes) = (0, 0u64, 0u64, 0u64);
        while off + 4 <= data.len() {
            let n = u32::from_le_bytes(data[off..off + 4].try_into().unwrap()) as usize;
            let rec = &data[off + 4..off + 4 + n.min(CHUNK)];
            off += 4 + n;
            let mut freq = Freq { ll: [0; NUM_LL], off: [0; NUM_OFF] };
            unsafe {
                scan_sized!(rec.len(), false, true, &FIXED, &mut tab, &mut freq, &mut seqs, rec, core::ptr::null_mut(), 0, true);
            }
            freq.ll[EOB] = 1;
            for (a, &f) in tot_ll.iter_mut().zip(freq.ll.iter()) {
                *a += f as u32;
            }
            for (a, &f) in tot_off.iter_mut().zip(freq.off.iter()) {
                *a += f as u32;
            }
            extra += extra_and_fixed(&freq).0 as u64;
            recs += 1;
            bytes += rec.len() as u64;
        }
        println!("{recs} records of {} B", bytes / recs);
        let mut codes: Box<Codes> = unsafe { Box::new_zeroed().assume_init() };
        for smooth in [true, false] {
            for (w, min_run) in [(0, 4), (64, 4), (128, 4), (192, 4), (256, 4), (384, 4), (512, 4), (768, 4), (256, 3), (512, 3)] {
                // as build_shared scales and smooths
                let scale = |acc: &[u32], f: &mut [u32]| {
                    let total: u64 = acc.iter().map(|&a| a as u64).sum();
                    let mut shift = 0;
                    while total >> shift > 1 << 17 {
                        shift += 1;
                    }
                    for (f, &a) in f.iter_mut().zip(acc) {
                        *f = if a != 0 { (a >> shift).max(1) * 16 } else { 0 };
                    }
                };
                let mut f_ll = [0u32; NUM_LL];
                let mut f_off = [0u32; NUM_OFF];
                scale(&tot_ll, &mut f_ll);
                scale(&tot_off, &mut f_off);
                if smooth {
                    for f in &mut f_ll[0x20..0x7f] {
                        *f += 1;
                    }
                    for b in [b'\t', b'\n', b'\r'] {
                        f_ll[b as usize] += 1;
                    }
                }
                for f in &mut f_ll[EOB..FIRST_LEN + NUM_LEN] {
                    *f += 1;
                }
                for f in &mut f_off[..SHARED_OFF_SLOTS] {
                    *f += 1;
                }
                if w != 0 {
                    level(&mut f_ll[..256], w, min_run);
                    level(&mut f_ll[FIRST_LEN..FIRST_LEN + NUM_LEN], w, min_run);
                    level(&mut f_off[..USED_OFF], w, min_run);
                }
                codes.build(&f_ll, &f_off);
                let mut sym = 0u64;
                for (s, &f) in tot_ll.iter().enumerate() {
                    sym += f as u64 * codes.ll_lens[s] as u64;
                }
                for (s, &f) in tot_off.iter().enumerate() {
                    sym += f as u64 * codes.off_lens[s] as u64;
                }
                let per = (sym + extra) as f64 / recs as f64;
                println!(
                    "smooth {smooth:5} band {:4.2} run {min_run}: header {:4} bits, symbols {:8.1} bits, total {:7.1} B",
                    w as f64 / 256.0,
                    codes.hdr_bits,
                    per,
                    (codes.hdr_bits as f64 + per) / 8.0
                );
            }
        }
    }
}

#[cfg(test)]
mod build_probe {
    use super::*;

    /// `GZHOT_PROBE=records.bin cargo test --release --lib build_probe -- --nocapture`
    #[test]
    fn build_probe() {
        let Ok(path) = std::env::var("GZHOT_PROBE") else { return };
        let data = std::fs::read(path).unwrap();
        let mut tab = Box::new(Tab([0; 1 << enc::MAX_TAB_BITS]));
        let mut seqs = Box::new([0u64; MAX_SEQS]);
        let mut all = Vec::new();
        let mut off = 0;
        while off + 4 <= data.len() {
            let n = u32::from_le_bytes(data[off..off + 4].try_into().unwrap()) as usize;
            let rec = &data[off + 4..off + 4 + n.min(CHUNK)];
            off += 4 + n;
            let mut freq = Freq { ll: [0; NUM_LL], off: [0; NUM_OFF] };
            unsafe {
                scan_sized!(rec.len(), false, true, &FIXED, &mut tab, &mut freq, &mut seqs, rec, core::ptr::null_mut(), 0, true);
            }
            freq.ll[EOB] = 1;
            let mut f_ll = [0u32; NUM_LL];
            let mut f_off = [0u32; NUM_OFF];
            for (w, &f) in f_ll.iter_mut().zip(freq.ll.iter()) {
                *w = f as u32;
            }
            for (w, &f) in f_off.iter_mut().zip(freq.off.iter()) {
                *w = f as u32;
            }
            all.push((f_ll, f_off));
        }
        let mut codes: Box<Codes> = unsafe { Box::new_zeroed().assume_init() };
        let mut best = f64::MAX;
        let mut hdr = 0u64;
        let mut used = 0usize;
        for _ in 0..30 {
            let t = std::time::Instant::now();
            hdr = 0;
            for (f_ll, f_off) in &all {
                codes.build(f_ll, f_off);
                hdr += codes.hdr_bits as u64;
            }
            best = best.min(t.elapsed().as_secs_f64());
        }
        for (f_ll, f_off) in &all {
            used += f_ll.iter().chain(f_off.iter()).filter(|&&f| f != 0).count();
        }
        let mut parts = [f64::MAX; 4];
        for _ in 0..30 {
            let mut acc = [0f64; 4];
            for (f_ll, f_off) in &all {
                let t = std::time::Instant::now();
                huff::make_lens(&f_ll[..USED_LL], &mut codes.ll_lens[..USED_LL], MAX_LL_BITS);
                let t1 = std::time::Instant::now();
                huff::make_lens(&f_off[..USED_OFF], &mut codes.off_lens[..USED_OFF], MAX_OFF_BITS);
                let t2 = std::time::Instant::now();
                codes.write_header();
                let t3 = std::time::Instant::now();
                codes.fill();
                let t4 = std::time::Instant::now();
                acc[0] += (t1 - t).as_secs_f64();
                acc[1] += (t2 - t1).as_secs_f64();
                acc[2] += (t3 - t2).as_secs_f64();
                acc[3] += (t4 - t3).as_secs_f64();
            }
            for i in 0..4 {
                parts[i] = parts[i].min(acc[i]);
            }
        }
        println!("  lengths of literals {:.2}, of offsets {:.2}, header {:.2}, tables {:.2} us",
            parts[0] / all.len() as f64 * 1e6, parts[1] / all.len() as f64 * 1e6,
            parts[2] / all.len() as f64 * 1e6, parts[3] / all.len() as f64 * 1e6);
        println!(
            "{} payloads: {:.2} us per build of own codes, header {} bits, {} symbols in use",
            all.len(),
            best / all.len() as f64 * 1e6,
            hdr / all.len() as u64,
            used / all.len()
        );
    }
}
