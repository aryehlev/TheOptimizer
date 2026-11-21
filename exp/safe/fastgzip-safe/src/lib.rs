//! gzip for a stream of small, similar payloads (JSON requests of a few
//! kilobytes) on a hot path.  Pure Rust; the output is ordinary gzip.
//!
//! ```
//! // On the worker thread, inside the task; `body` is your request body.
//! # let (payload, mut body) = (vec![b'a'; 5000], Vec::new());
//! fastgzip_safe::gzip_with(&payload, |gz| body.extend_from_slice(gz));
//! ```
//!
//! or keep a compressor of your own, for instance one per kind of payload:
//!
//! ```
//! let mut gz = fastgzip_safe::Gzip::new();
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
//! kind of payload: codes made for one kind fit another poorly, and a payload
//! they do not fit is written the slow way.

// No unsafe code, and no way to allow any.  With the feature `prefetch` there
// is one unsafe block, around a hint instruction: see `fetch_encoder`.
#![cfg_attr(not(feature = "prefetch"), forbid(unsafe_code))]
#![cfg_attr(feature = "prefetch", deny(unsafe_code))]
#![warn(missing_docs)]

mod codes;
mod enc;
mod huff;
mod tables;

use codes::{Codes, FIXED, HDR_BYTES, LEN_TAB, OFF_TAB};
use enc::{
    align, append_bits, emit_seqs, rebase, scan, stored, Freq, Input, Output, Place, Seq, Tab,
    CHUNK, MAX_SEQS,
};
use std::cell::RefCell;
use tables::*;

/// A block is written in one pass only if it is at least this long.  For a
/// shorter one the header of a dynamic block is a large part of the output,
/// and whether the fixed codes would do better has to be worked out.
const MIN_ONE_PASS: usize = 1024;
/// The shared codes are remade after 1, 2, 4 ... and then every this many
/// blocks.  Making codes takes about as long as compressing a payload, so in
/// the long run it should be rare; early on, when the codes have seen little,
/// it pays at once.
const MAX_PERIOD: u32 = 1024;
/// About this many blocks per period have their symbols counted while they
/// are written in one pass (all of them while the period is this short).
/// Counting makes a block some 15% slower.
const SAMPLES_PER_PERIOD: u32 = 32;

/// The members of the gzip header: magic, deflate, no flags, no time, "fastest
/// algorithm", unknown system.  The same ten bytes libdeflate writes at level 1.
const GZIP_HEADER: [u8; 10] = [0x1f, 0x8b, 8, 0, 0, 0, 0, 0, 4, 0xff];

/// How a compressor's blocks were written; see [`Gzip::stats`].  A payload of
/// up to 16 KiB is one block; a larger one is a block per 16 KiB.
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

/// Everything a compressor keeps.  The fields that every call reads come
/// first and are followed by the tables of the shared codes, so that a call
/// that finds its caches cold has few lines to fetch.  The four large arrays
/// are allocations of their own, which is how they come to be zeroed where
/// they are allocated and never pass over the stack.
#[repr(C, align(64))]
struct State {
    /// The shared codes exist.
    valid: bool,
    /// The last block that was looked at closely suited the shared codes.
    direct_ok: bool,
    /// Blocks between two makings of the shared codes: a power of two.
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
    seqs: Box<[Seq; MAX_SEQS]>,
    tab: Box<Tab>,
    /// The copy of the input that the encoder reads: see `enc::Input`.
    inp: Box<Input>,
    /// Where the encoder writes: see `enc::Output`.  A payload of up to
    /// `CHUNK` bytes is handed to the caller from here.
    out: Box<Output>,
}

/// A zeroed array on the heap.  `vec!` of zeros asks the allocator for zeroed
/// memory, so nothing is written here and nothing is built on the stack.
fn zeroed<T: Clone + Default, const N: usize>() -> Box<[T; N]> {
    match vec![T::default(); N].into_boxed_slice().try_into() {
        Ok(array) => array,
        Err(_) => unreachable!("a vector of N elements"),
    }
}

const NO_CODES: Codes = Codes {
    lit: [0; 256],
    len: [0; LEN_TAB],
    eob: 0,
    off: [0; OFF_TAB],
    hdr_bits: 0,
    hdr: [0; HDR_BYTES],
    ll_lens: [0; NUM_LL],
    off_lens: [0; NUM_OFF],
};

/// A gzip compressor for payloads of one kind.
///
/// It owns its working memory (about 200 KiB, of which a call touches what
/// its payload needs) and allocates nothing per call: a payload of up to
/// 16 KiB is written where it is handed back from, and for larger ones there
/// is a buffer that grows to fit.  It is `Send`, so it can live in a
/// `thread_local!`, in a pool, or in a task.
pub struct Gzip {
    st: Box<State>,
    /// The output of a payload of more than `CHUNK` bytes.
    large: Vec<u8>,
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
        let st = Box::new(State {
            valid: false,
            direct_ok: false,
            period: 1,
            since_build: 0,
            calls: 0,
            misses: 0,
            miss_limit: 3,
            stats: Stats::default(),
            shared: NO_CODES,
            freq: NO_COUNTS,
            acc_ll: [0; NUM_LL],
            acc_off: [0; NUM_OFF],
            own: NO_CODES,
            seqs: zeroed(),
            tab: zeroed(),
            inp: zeroed(),
            out: zeroed(),
        });
        Gzip { st, large: Vec::new() }
    }

    /// Compress `payload` into this compressor's buffer and return the gzip
    /// bytes.  They are valid until the next call.
    pub fn compress(&mut self, payload: &[u8]) -> &[u8] {
        let n = payload.len();
        let st = &mut *self.st;
        if n >= MIN_ONE_PASS && st.valid && st.direct_ok {
            fetch_encoder(n);
        }
        if n <= CHUNK {
            // The checksum first.  It reads the payload front to back, which
            // also brings it into the cache for the copy that follows.
            let crc = crc32fast::hash(payload);
            st.out[..10].copy_from_slice(&GZIP_HEADER);
            st.inp[..n].copy_from_slice(payload);
            let o = st.block(n).div_ceil(8);
            st.out[o..o + 4].copy_from_slice(&crc.to_le_bytes());
            st.out[o + 4..o + 8].copy_from_slice(&(n as u32).to_le_bytes());
            &self.st.out[..o + 8]
        } else {
            // Every block ends up no larger than stored (its bytes and 5
            // more), and up to 13 bytes go between two blocks.
            self.large.clear();
            self.large.reserve(18 + n + 24 * (n / CHUNK + 1)); // no call once it has grown
            self.large.extend_from_slice(&GZIP_HEADER);
            let crc = st.large(payload, &mut self.large);
            self.large.extend_from_slice(&crc.to_le_bytes());
            self.large.extend_from_slice(&(n as u32).to_le_bytes());
            &self.large
        }
    }

    /// How this compressor's blocks have been written so far.  If `own_codes`
    /// keeps growing, the payloads it is given are not of one kind.
    pub fn stats(&self) -> Stats {
        self.st.stats
    }
}

/// `scan` with the table size that suits a payload of `n` bytes: the smallest
/// that has an entry for every position (8 KiB for up to 4096 bytes, 16 and
/// 32 KiB above; 2 KiB for small payloads).  A smaller table is quicker to
/// clear and to fetch, and a larger one finds only slightly more.  The size
/// is a constant in each copy of `scan`.
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

const NO_COUNTS: Freq = Freq { ll: [0; NUM_LL], off: [0; NUM_OFF] };

/// Asks for the machine code of the one-pass encoder that a payload of `n`
/// bytes will run, so that it is on its way while the checksum is computed.
///
/// A thread that did megabytes of other work since its last payload no longer
/// has the encoder in its instruction cache, and instructions that are missing
/// stall the processor one cache line after the other; this asks for all of
/// them at once.  Only on arm64, where it was measured to help, and only with
/// the feature `prefetch`: the language has no safe way to say it, so it is
/// the one place that needs `unsafe`.
#[cfg(all(feature = "prefetch", target_arch = "aarch64", not(miri)))]
#[allow(unsafe_code)]
#[inline(always)]
fn fetch_encoder(n: usize) {
    type Encoder = fn(
        &Codes, &mut Tab, &mut Freq, &mut [Seq; MAX_SEQS], &Input, u16, u16, bool, &mut Output, usize, Place,
    ) -> usize;
    // As `scan_sized` chooses.
    let code = match n {
        0..=1024 => scan::<10, true, false> as Encoder,
        1025..=4096 => scan::<12, true, false> as Encoder,
        4097..=8192 => scan::<13, true, false> as Encoder,
        _ => scan::<14, true, false> as Encoder,
    } as usize;
    let mut line = code & !63;
    while line < code + 2048 {
        // SAFETY: a prefetch is a hint.  It reads nothing and does not
        // fault, whatever the address.
        unsafe {
            core::arch::asm!(
                "prfm pldl2keep, [{line}]",
                line = in(reg) line,
                options(nostack, readonly, preserves_flags)
            );
        }
        line += 64;
    }
}

#[cfg(not(all(feature = "prefetch", target_arch = "aarch64", not(miri))))]
#[inline(always)]
fn fetch_encoder(_n: usize) {}

impl State {
    /// A payload of at most `CHUNK` bytes, which is at the front of `inp`, as
    /// the only block of its stream, behind the gzip header in `out`.
    /// Returns the bit of `out` after it.  The block is never larger than a
    /// stored one would be.
    #[inline]
    fn block(&mut self, n: usize) -> usize {
        const AT: usize = 8 * GZIP_HEADER.len();
        if n >= MIN_ONE_PASS && self.valid && self.direct_ok {
            let count = self.count_this_one();
            let place = Place::whole(true);
            let end = if count {
                self.freq = NO_COUNTS;
                scan_sized!(
                    n, true, true,
                    &self.shared, &mut self.tab, &mut self.freq, &mut self.seqs,
                    &self.inp, 0, n as u16, true, &mut self.out, AT, place
                )
            } else {
                scan_sized!(
                    n, true, false,
                    &self.shared, &mut self.tab, &mut self.freq, &mut self.seqs,
                    &self.inp, 0, n as u16, true, &mut self.out, AT, place
                )
            };
            // 0: a byte the codes have no codeword for.
            if end != 0 && end - AT <= 8 * (n + 5) && (!count || self.counted_fits()) {
                if self.one_pass_done(count) {
                    self.build_shared(); // for the payloads that follow
                }
                return end;
            }
        }
        self.two_pass(0, n, true, AT, true)
    }

    /// A payload of more than `CHUNK` bytes: a block per `CHUNK`, each one
    /// searching the block before it as well.  As long as blocks can be
    /// written in one pass they are written as a single DEFLATE block, with
    /// one header.  The bytes are appended to `to`; returns the CRC-32 of
    /// the payload, which is taken block by block from the copy the encoder
    /// reads, so that the payload itself is read once.
    #[inline(never)]
    fn large(&mut self, payload: &[u8], to: &mut Vec<u8>) -> u32 {
        let n = payload.len();
        let mut crc = crc32fast::Hasher::new();
        // Bits in `out` that have not been handed over to `to`: after each
        // block the complete bytes are, and the unfinished one moves to the
        // front.
        let mut bitpos = 0;
        let mut open = false; // a block with the shared codes is unfinished
        let mut at = 0;
        while at < n {
            let end = (at + CHUNK).min(n);
            // The window: the block before this one, and this one.  The first
            // block goes to the front of `inp` and the second behind it; from
            // the third on, the block before moves to the front first, and
            // the positions in the table move with it.
            let start = if at == 0 { 0 } else { CHUNK };
            if at >= 2 * CHUNK {
                rebase(&mut self.tab);
                self.inp.copy_within(CHUNK..2 * CHUNK, 0);
            }
            let stop = start + (end - at);
            self.inp[start..stop].copy_from_slice(&payload[at..end]);
            crc.update(&self.inp[start..stop]);
            bitpos = self.chunk(start, stop, bitpos, &mut open);
            let whole = bitpos >> 3;
            to.extend_from_slice(&self.out[..whole]);
            self.out[0] = self.out[whole];
            bitpos &= 7;
            at = end;
        }
        if open {
            bitpos = append_bits(&mut self.out[..], bitpos, self.shared.eob & 0xFFFF, self.shared.eob >> 16);
        }
        // None of the blocks above says that it is the last: which one that
        // would be is not known when its header is written.  An empty block
        // with the fixed codes says it: BFINAL, BTYPE = 1, end of block.
        bitpos = append_bits(&mut self.out[..], bitpos, 0b011, 10);
        to.extend_from_slice(&self.out[..bitpos.div_ceil(8)]);
        crc.finalize()
    }

    /// One block of a large payload: `inp[start..end]`, with `inp[..start]`
    /// to find matches in, written from bit `bitpos` of `out` on.  Returns
    /// the bit after it.
    fn chunk(&mut self, start: usize, end: usize, mut bitpos: usize, open: &mut bool) -> usize {
        let n = end - start;
        let mut clear = start == 0;
        // Continuing an unfinished block costs no header, however short this
        // one is.
        if self.valid && self.direct_ok && (*open || n >= MIN_ONE_PASS) {
            let count = self.count_this_one();
            if !*open {
                bitpos = align(&mut self.out[..], bitpos);
            }
            let place = Place { header: !*open, last: false, eob: false };
            let after = if count {
                self.freq = NO_COUNTS;
                scan::<14, true, true>(
                    &self.shared, &mut self.tab, &mut self.freq, &mut self.seqs,
                    &self.inp, start as u16, end as u16, clear, &mut self.out, bitpos, place,
                )
            } else {
                scan::<14, true, false>(
                    &self.shared, &mut self.tab, &mut self.freq, &mut self.seqs,
                    &self.inp, start as u16, end as u16, clear, &mut self.out, bitpos, place,
                )
            };
            if after != 0 && after - bitpos <= 8 * (n + 5) {
                let fit = !count || self.counted_fits();
                if fit {
                    *open = true;
                    bitpos = after;
                    if self.one_pass_done(count) {
                        // New codes are due.  The block that uses the
                        // current ones has to end first.
                        bitpos = append_bits(&mut self.out[..], bitpos, self.shared.eob & 0xFFFF, self.shared.eob >> 16);
                        *open = false;
                        self.build_shared();
                    }
                    return bitpos;
                }
                if start != 0 {
                    // The codes fit this block badly, but searching it again
                    // would be without the block before it (see below), and
                    // that costs more than the codes do.  Keep what was
                    // written, and look closely at the blocks that follow.
                    *open = true;
                    self.since_build += 1;
                    self.stats.one_pass += 1;
                    self.accumulate();
                    self.direct_ok = false;
                    return after;
                }
            }
            // Not written: the output continues at `bitpos` as if nothing
            // had happened.  The table, though, now holds positions of this
            // block, which the second search must not find.
            clear = true;
        }
        if *open {
            bitpos = append_bits(&mut self.out[..], bitpos, self.shared.eob & 0xFFFF, self.shared.eob >> 16);
            *open = false;
        }
        bitpos = align(&mut self.out[..], bitpos);
        self.two_pass(start, end, clear, bitpos, false)
    }

    /// Should the block about to be written in one pass have its symbols
    /// counted?  Some are, and the one after which the codes are due to be
    /// remade.  The counts go into the next codes and say whether the current
    /// ones still fit.
    #[inline]
    fn count_this_one(&mut self) -> bool {
        self.calls = self.calls.wrapping_add(1);
        let interval = (self.period / SAMPLES_PER_PERIOD).max(1); // a power of two
        self.calls & (interval - 1) == 0 || self.since_build + 1 >= self.period
    }

    /// After a block was written in one pass with its symbols counted: do the
    /// shared codes still fit?
    fn counted_fits(&mut self) -> bool {
        self.freq.ll[EOB] = 1;
        fits(sym_cost(&self.shared, &self.freq).0, entropy(&self.freq))
    }

    /// Book-keeping for a block written in one pass.  True if the shared
    /// codes are now due to be remade.
    #[inline]
    fn one_pass_done(&mut self, counted: bool) -> bool {
        self.since_build += 1;
        self.stats.one_pass += 1;
        if !counted {
            return false;
        }
        self.accumulate();
        self.misses = 0;
        self.miss_limit = 3;
        self.since_build >= self.period
    }

    /// Searches the block `inp[start..end]` first, then writes it as a block
    /// of its own with whichever codes make it smallest: the shared ones if
    /// they fit, else its own, the fixed ones, or none.  The block goes to
    /// bit `bitpos` of `out`, which is a byte boundary; returns the bit after
    /// it.
    #[inline(never)]
    fn two_pass(&mut self, start: usize, end: usize, clear: bool, bitpos: usize, last: bool) -> usize {
        let n = end - start;
        let place = Place::whole(last);
        self.freq = NO_COUNTS;
        // The search writes nothing.
        let n_seqs = if start != 0 {
            scan::<14, false, true>(
                &FIXED, &mut self.tab, &mut self.freq, &mut self.seqs,
                &self.inp, start as u16, end as u16, clear, &mut self.out, bitpos, place,
            )
        } else {
            scan_sized!(
                n, false, true,
                &FIXED, &mut self.tab, &mut self.freq, &mut self.seqs,
                &self.inp, start as u16, end as u16, clear, &mut self.out, bitpos, place
            )
        };
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
            return emit_seqs(
                &self.shared, &self.inp, start, end, &self.seqs[..n_seqs], &mut self.out, bitpos, place,
            );
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
            stored(&self.inp[start..end], &mut self.out[..], bitpos, last)
        } else if fixed_bits <= own_bits {
            self.stats.fixed += 1;
            emit_seqs(&FIXED, &self.inp, start, end, &self.seqs[..n_seqs], &mut self.out, bitpos, place)
        } else {
            self.stats.own_codes += 1;
            emit_seqs(&self.own, &self.inp, start, end, &self.seqs[..n_seqs], &mut self.out, bitpos, place)
        }
    }

    /// Adds the counts of the block just written to the running totals.
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
        // every offset), so that a symbol appearing for the first time rarely
        // forces new codes.
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
        for b in *b"\t\n\r" {
            f_ll[b as usize] += 1;
        }
        for f in &mut f_ll[EOB..FIRST_LEN + NUM_LEN] {
            *f += 1;
        }
        for f in &mut f_off[..USED_OFF] {
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
mod tests {
    #[test]
    fn size() {
        // What a compressor takes: its state and the four arrays.
        use super::*;
        let bytes = std::mem::size_of::<State>()
            + std::mem::size_of::<[Seq; MAX_SEQS]>()
            + std::mem::size_of::<Tab>()
            + std::mem::size_of::<Input>()
            + std::mem::size_of::<Output>();
        assert!((200 << 10..206 << 10).contains(&bytes), "{bytes}");
    }
}
