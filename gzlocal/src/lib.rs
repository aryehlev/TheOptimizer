//! gzip for small payloads on a multi-threaded runtime: one libdeflate
//! compressor and one output buffer per thread, no allocation per call.
//!
//! ```no_run
//! // on the worker thread, inside the task; `out` is your response buffer
//! # let (payload, mut out) = (vec![0u8; 5000], Vec::new());
//! gzlocal::gzip_with(&payload, |gz| out.extend_from_slice(gz));
//! ```
//!
//! `gzip_with` gives the same bytes as stock libdeflate at level 1.
//!
//! `gzip_codes_with` is for payloads of one kind (the same sort of JSON, call
//! after call): they share their Huffman codes, and because the codes exist
//! before a payload arrives it is written in one pass instead of two. The
//! output is ordinary gzip, about 1% larger, and depends on the payloads that
//! came before on that thread. Nothing but the codes is kept between calls.
//!
//! `gzip_fast_with` is the same with a cheaper search for repetitions. It
//! takes a little over a third of the time stock libdeflate takes, and the
//! output is about 2% larger than stock's on JSON requests of a few kilobytes.
//!
//! `gzip_session_with` also continues a payload that starts with the same
//! bytes as the one before it (one request sent to several recipients, with
//! what differs per recipient written last).
//!
//! See the README for measurements.

use std::cell::RefCell;
use std::os::raw::{c_int, c_void};
use std::ptr::NonNull;
#[cfg(gzlocal_session)]
use std::sync::atomic::{AtomicU32, Ordering};

#[repr(C)]
struct RawCompressor {
    _private: [u8; 0],
}

extern "C" {
    fn libdeflate_alloc_compressor(level: c_int) -> *mut RawCompressor;
    fn libdeflate_free_compressor(c: *mut RawCompressor);
    fn libdeflate_gzip_compress(
        c: *mut RawCompressor,
        input: *const c_void,
        in_nbytes: usize,
        out: *mut c_void,
        out_nbytes_avail: usize,
    ) -> usize;
    fn libdeflate_gzip_compress_bound(c: *mut RawCompressor, in_nbytes: usize) -> usize;
}

#[cfg(gzlocal_session)]
extern "C" {
    fn libdeflate_set_session(c: *mut RawCompressor, mode: c_int);
    fn libdeflate_session_set_order(c: *mut RawCompressor, order: c_int);
    fn libdeflate_session_set_search(c: *mut RawCompressor, one_candidate: c_int);
    fn libdeflate_session_own_codes(c: *const RawCompressor) -> std::os::raw::c_ulonglong;
}

/// The level the thread-local compressors use.
pub const LEVEL: i32 = 1;

/// Which libdeflate was compiled in: "patched", "stock" or "sized".
pub const VARIANT: &str = env!("GZLOCAL_VARIANT");

/// What consecutive payloads of one compressor share. Level 1 only.
#[cfg(gzlocal_session)]
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Session {
    /// Nothing: every payload is compressed on its own, as stock libdeflate would.
    Off,
    /// The Huffman codes. For payloads up to 16 KiB that resemble each other.
    /// Payloads of 1 KiB and more are written in one pass.
    Codes,
    /// As `Codes`, with a cheaper search in that one pass: one earlier
    /// position is tried per hash value instead of two, and five bytes are
    /// hashed instead of four. Clearly faster; the output is about 1% larger
    /// than with `Codes` on JSON requests of a few kilobytes, and a few
    /// percent larger on text that repeats itself a lot.
    CodesFast,
    /// The codes, and the compressed form of a common beginning: a payload of
    /// up to 8 KiB that starts with the same bytes as the previous one is
    /// continued from that one's output. Two passes.
    CodesAndPrefix,
}

/// With this much room a session writes its single pass straight into the
/// caller's buffer; with less it writes to a buffer of its own and copies.
fn one_pass_room(len: usize) -> usize {
    if len <= 16 * 1024 {
        2 * len + 640
    } else {
        0
    }
}

/// A compressor and the buffer it writes to.
pub struct Gzip {
    c: NonNull<RawCompressor>,
    buf: Vec<u8>,
}

impl Gzip {
    pub fn new(level: i32) -> Self {
        let c = unsafe { libdeflate_alloc_compressor(level) };
        Gzip { c: NonNull::new(c).expect("libdeflate_alloc_compressor failed"), buf: Vec::new() }
    }

    /// A level 1 compressor whose consecutive payloads share work. Use one per
    /// kind of payload: codes made for one kind fit another badly, and then
    /// each payload falls back to its own codes and nothing is gained.
    #[cfg(gzlocal_session)]
    pub fn with_session(session: Session) -> Self {
        let g = Gzip::new(1);
        let mode = match session {
            Session::Off => 0,
            Session::CodesAndPrefix => 1,
            Session::Codes | Session::CodesFast => 2,
        };
        unsafe {
            libdeflate_set_session(g.c.as_ptr(), mode);
            libdeflate_session_set_search(g.c.as_ptr(), (session == Session::CodesFast) as c_int);
        }
        g
    }

    /// The size of the hash table this compressor searches with, as a power
    /// of two: 4 bytes times 2^`order`, `order` from 12 to 15. It applies to
    /// `Session::Codes` and `Session::CodesFast`.
    ///
    /// The default, 15 (128 KiB), is fastest when the table is still in the
    /// CPU's caches at the next call. If the thread does a lot of other work
    /// between two calls it is not, and 13 (32 KiB) is faster. Which of the
    /// two your server is can only be measured there.
    #[cfg(gzlocal_session)]
    pub fn set_table_order(&mut self, order: u32) {
        unsafe { libdeflate_session_set_order(self.c.as_ptr(), order.min(15) as c_int) };
    }

    /// How many payloads of up to 16 KiB this session wrote with codes of
    /// their own, because the shared codes could not encode them or fitted
    /// them badly. Those payloads are correct; they only gained nothing. If
    /// most payloads end up here, the compressor is being fed more than one
    /// kind of payload.
    #[cfg(gzlocal_session)]
    pub fn own_codes(&self) -> u64 {
        unsafe { libdeflate_session_own_codes(self.c.as_ptr()) as u64 }
    }

    /// Compress `payload` into this compressor's buffer and return the gzip
    /// bytes. They are valid until the next call.
    pub fn compress(&mut self, payload: &[u8]) -> &[u8] {
        let bound = unsafe { libdeflate_gzip_compress_bound(self.c.as_ptr(), payload.len()) };
        self.buf.clear();
        self.buf.reserve(bound.max(one_pass_room(payload.len())));
        // SAFETY: the buffer has room for `bound` bytes and more, libdeflate
        // writes within what it is given and returns how many bytes count.
        let n = unsafe {
            libdeflate_gzip_compress(
                self.c.as_ptr(),
                payload.as_ptr().cast(),
                payload.len(),
                self.buf.as_mut_ptr().cast(),
                self.buf.capacity(),
            )
        };
        assert!(n != 0, "libdeflate needed more than its own bound");
        unsafe { self.buf.set_len(n) };
        &self.buf
    }

}

impl Drop for Gzip {
    fn drop(&mut self) {
        unsafe { libdeflate_free_compressor(self.c.as_ptr()) };
    }
}

// The compressor is only ever used through &mut self.
unsafe impl Send for Gzip {}

thread_local! {
    static LOCAL: RefCell<Gzip> = RefCell::new(Gzip::new(LEVEL));
}

/// gzip `payload` with this thread's compressor and hand the bytes to `f`.
/// Call it on the worker thread itself, never through `spawn_blocking`.
pub fn gzip_with<R>(payload: &[u8], f: impl FnOnce(&[u8]) -> R) -> R {
    LOCAL.with(|g| f(g.borrow_mut().compress(payload)))
}

#[cfg(gzlocal_session)]
static CODES_TABLE_ORDER: AtomicU32 = AtomicU32::new(15);

#[cfg(gzlocal_session)]
thread_local! {
    static LOCAL_CODES: RefCell<Gzip> = RefCell::new({
        let mut g = Gzip::with_session(Session::Codes);
        g.set_table_order(CODES_TABLE_ORDER.load(Ordering::Relaxed));
        g
    });
    static LOCAL_FAST: RefCell<Gzip> = RefCell::new({
        let mut g = Gzip::with_session(Session::CodesFast);
        g.set_table_order(CODES_TABLE_ORDER.load(Ordering::Relaxed));
        g
    });
    static LOCAL_SESSION: RefCell<Gzip> = RefCell::new(Gzip::with_session(Session::CodesAndPrefix));
}

/// The table order (see [`Gzip::set_table_order`]) of the compressors that
/// `gzip_codes_with` and `gzip_fast_with` create, one per thread, from now on.
/// Call it once at startup, before the worker threads compress anything.
#[cfg(gzlocal_session)]
pub fn set_codes_table_order(order: u32) {
    CODES_TABLE_ORDER.store(order.clamp(12, 15), Ordering::Relaxed);
}

/// [`Gzip::own_codes`] of this thread's `gzip_codes_with` compressor.
#[cfg(gzlocal_session)]
pub fn codes_own_codes() -> u64 {
    LOCAL_CODES.with(|g| g.borrow().own_codes())
}

/// Like `gzip_with`, with this thread's `Session::Codes` compressor: for
/// payloads that resemble each other but do not begin alike (different
/// requests of the same kind). They share their codes and are written in one
/// pass. For a second kind of payload, keep a second
/// `Gzip::with_session(Session::Codes)` in a `thread_local!` of your own.
#[cfg(gzlocal_session)]
pub fn gzip_codes_with<R>(payload: &[u8], f: impl FnOnce(&[u8]) -> R) -> R {
    LOCAL_CODES.with(|g| f(g.borrow_mut().compress(payload)))
}

/// Like `gzip_codes_with`, with this thread's `Session::CodesFast` compressor:
/// the fastest of the three, for an output about 1% larger than that of
/// `gzip_codes_with`. It has a compressor of its own, so a thread that calls
/// both keeps two sets of codes.
#[cfg(gzlocal_session)]
pub fn gzip_fast_with<R>(payload: &[u8], f: impl FnOnce(&[u8]) -> R) -> R {
    LOCAL_FAST.with(|g| f(g.borrow_mut().compress(payload)))
}

/// [`Gzip::own_codes`] of this thread's `gzip_fast_with` compressor.
#[cfg(gzlocal_session)]
pub fn fast_own_codes() -> u64 {
    LOCAL_FAST.with(|g| g.borrow().own_codes())
}

/// Like `gzip_with`, with this thread's `Session::CodesAndPrefix` compressor:
/// for one request sent to several recipients.
#[cfg(gzlocal_session)]
pub fn gzip_session_with<R>(payload: &[u8], f: impl FnOnce(&[u8]) -> R) -> R {
    LOCAL_SESSION.with(|g| f(g.borrow_mut().compress(payload)))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[repr(C)]
    struct RawDecompressor {
        _private: [u8; 0],
    }
    extern "C" {
        fn libdeflate_alloc_decompressor() -> *mut RawDecompressor;
        fn libdeflate_free_decompressor(d: *mut RawDecompressor);
        fn libdeflate_gzip_decompress(
            d: *mut RawDecompressor,
            input: *const c_void,
            in_nbytes: usize,
            out: *mut c_void,
            out_nbytes_avail: usize,
            actual_out_nbytes_ret: *mut usize,
        ) -> c_int;
    }

    fn gunzip(gz: &[u8]) -> Vec<u8> {
        let mut out = vec![0u8; 1 << 16];
        let mut n = 0usize;
        let rc = unsafe {
            let d = libdeflate_alloc_decompressor();
            let rc = libdeflate_gzip_decompress(d, gz.as_ptr().cast(), gz.len(), out.as_mut_ptr().cast(), out.len(), &mut n);
            libdeflate_free_decompressor(d);
            rc
        };
        assert_eq!(rc, 0, "not valid gzip");
        out.truncate(n);
        out
    }

    /// A request-shaped payload: a long part common to one "auction", then a
    /// short part that differs per recipient.
    fn payload(auction: u32, recipient: u32) -> Vec<u8> {
        let mut s = format!("{{\"id\":\"a{auction:08x}\",\"site\":{{\"domain\":\"example{}.com\",\"page\":\"https://example.com/", auction % 7);
        for k in 0..60 {
            s.push_str(&format!("section-{}/item-{}?ref={:x}&", k % 9, auction.wrapping_mul(2654435761).rotate_left(k) % 1000, auction ^ k));
        }
        s.push_str(&format!("\"}},\"user\":{{\"buyeruid\":\"u{:016x}\"}},\"floor\":{}.{:02}}}", (recipient as u64 + 1) * 0x9E3779B97F4A7C15, recipient % 5, recipient * 7 % 100));
        s.into_bytes()
    }

    #[test]
    fn round_trip_header_and_determinism() {
        let p = payload(1, 1);
        let a = gzip_with(&p, |gz| gz.to_vec());
        assert_eq!(&a[..3], &[0x1f, 0x8b, 8]);
        assert_eq!(gunzip(&a), p);
        // Without a session the output does not depend on what came before.
        gzip_with(&payload(2, 3), |_| ());
        assert_eq!(gzip_with(&p, |gz| gz.to_vec()), a);
        assert_eq!(Gzip::new(LEVEL).compress(&p), &a[..]);
    }

    #[cfg(gzlocal_session)]
    #[test]
    fn sessions_round_trip() {
        for session in [Session::Codes, Session::CodesFast, Session::CodesAndPrefix, Session::Off] {
            let mut g = Gzip::with_session(session);
            let mut plain = Gzip::new(1);
            let (mut with, mut without) = (0usize, 0usize);
            for auction in 0..200u32 {
                for recipient in 0..6u32 {
                    let p = payload(auction, recipient);
                    let gz = g.compress(&p).to_vec();
                    assert_eq!(gunzip(&gz), p, "{session:?} auction {auction} recipient {recipient}");
                    with += gz.len();
                    without += plain.compress(&p).len();
                }
            }
            match session {
                Session::Off => assert_eq!(with, without),
                // Sharing costs a little size, never much.
                _ => assert!(with < without + without / 20, "{session:?}: {with} vs {without}"),
            }
        }
    }

    #[cfg(gzlocal_session)]
    fn odd_inputs() -> Vec<Vec<u8>> {
        let base = payload(7, 0);
        let mut noise = vec![0u8; 3000];
        let mut x = 12345u32;
        for b in noise.iter_mut() {
            x = x.wrapping_mul(1664525).wrapping_add(1013904223);
            *b = (x >> 24) as u8;
        }
        vec![
            base.clone(),
            base.clone(),                               // the same again
            base[..base.len() / 2].to_vec(),            // cut short
            [&base[..], &base[..500]].concat(),         // longer
            Vec::new(),                                 // empty
            b"x".to_vec(),
            noise.clone(),                              // incompressible
            base.clone(),
            [&base[..700], &noise[..300]].concat(),     // same beginning, other end
            "caf\u{e9} \u{4e2d}\u{6587} ".repeat(300).into_bytes(), // bytes above 0x7F
            b"0123456789abcdefABCDEF-_".repeat(200),    // one long token
            vec![b'a'; 9000],                           // larger than the prefix limit
            vec![b'a'; 20000],                          // larger than the session limit
            base.clone(),
        ]
    }

    #[cfg(gzlocal_session)]
    #[test]
    fn session_odd_inputs() {
        for session in [Session::CodesAndPrefix, Session::Codes, Session::CodesFast] {
            let mut g = Gzip::with_session(session);
            for round in 0..3 {
                for (i, p) in odd_inputs().iter().enumerate() {
                    assert_eq!(&gunzip(g.compress(p)), p, "{session:?} round {round} case {i}");
                }
            }
        }
    }

    #[cfg(gzlocal_session)]
    #[test]
    fn one_pass_sessions_use_the_shared_codes() {
        for session in [Session::Codes, Session::CodesFast] {
            let mut g = Gzip::with_session(session);
            let mut plain = Gzip::new(1);
            let (mut with, mut without) = (0usize, 0usize);
            for auction in 0..600u32 {
                let p = payload(auction, auction % 6);
                let gz = g.compress(&p).to_vec();
                assert_eq!(gunzip(&gz), p, "{session:?} auction {auction}");
                with += gz.len();
                without += plain.compress(&p).len();
            }
            // These payloads are one phrase over and over, which is where the
            // cheaper search costs most: about 5% against 1% to 2% on requests.
            let allowed = if session == Session::CodesFast { without / 12 } else { without / 20 };
            assert!(with < without + allowed, "{session:?}: {with} vs {without}");
            assert!(g.own_codes() < 30, "{session:?}: {} of 600 payloads did not use the shared codes", g.own_codes());
            // What the codes cannot encode, or fit badly, still comes out right, and is counted.
            let before = g.own_codes();
            for (i, p) in odd_inputs().iter().enumerate() {
                assert_eq!(&gunzip(g.compress(p)), p, "{session:?} case {i}");
            }
            assert!(g.own_codes() > before);
        }
    }

    /// The two searches are different encoders: the fast one must not be the
    /// other under a new name, and must not cost much size.
    #[cfg(gzlocal_session)]
    #[test]
    fn the_fast_search_is_its_own_encoder() {
        let mut codes = Gzip::with_session(Session::Codes);
        let mut fast = Gzip::with_session(Session::CodesFast);
        let (mut a, mut b, mut differ) = (0usize, 0usize, 0usize);
        for auction in 0..600u32 {
            let p = payload(auction, auction % 6);
            let x = codes.compress(&p).to_vec();
            let y = fast.compress(&p).to_vec();
            assert_eq!(gunzip(&y), p);
            differ += (x != y) as usize;
            a += x.len();
            b += y.len();
        }
        assert!(differ > 500, "only {differ} of 600 outputs differ");
        assert!(b < a + a / 20, "fast {b} vs codes {a}");
    }

    #[cfg(gzlocal_session)]
    #[test]
    fn table_orders_give_the_same_payloads() {
        let mut sizes = Vec::new();
        for (order, session) in [0u32, 12, 13, 14, 15, 99].into_iter().flat_map(|o| [(o, Session::Codes), (o, Session::CodesFast)]) {
            let mut s = Gzip::with_session(session);
            s.set_table_order(order);
            let mut total = 0usize;
            for auction in 0..300u32 {
                let p = payload(auction, auction % 6);
                let gz = s.compress(&p).to_vec();
                assert_eq!(gunzip(&gz), p, "{session:?} order {order} auction {auction}");
                total += gz.len();
            }
            sizes.push(total);
        }
        let (min, max) = (*sizes.iter().min().unwrap(), *sizes.iter().max().unwrap());
        assert!(max < min + min / 25, "the table size and the search should hardly change the output: {sizes:?}");
    }

    #[cfg(gzlocal_session)]
    #[test]
    fn every_thread_has_its_own_session() {
        set_codes_table_order(13);
        std::thread::scope(|s| {
            for t in 0..4u32 {
                s.spawn(move || {
                    for round in 0..6u32 {
                        for a in 0..80u32 {
                            let p = payload(a * 4 + t, round);
                            gzip_codes_with(&p, |gz| assert_eq!(gunzip(gz), p, "thread {t} round {round} auction {a}"));
                            gzip_fast_with(&p, |gz| assert_eq!(gunzip(gz), p, "fast, thread {t} round {round} auction {a}"));
                            gzip_session_with(&p, |gz| assert_eq!(gunzip(gz), p));
                        }
                    }
                    assert!(codes_own_codes() < 30);
                    assert!(fast_own_codes() < 30);
                });
            }
        });
        set_codes_table_order(15);
    }
}
