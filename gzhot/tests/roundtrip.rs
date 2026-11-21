mod gen;

use flate2::read::MultiGzDecoder;
use gen::{any_payload, bid_request, Rng};
use gzhot::Gzip;
use std::io::Read;

/// Decodes with flate2 (miniz_oxide), an implementation that shares no code
/// with this crate, and checks what gzip promises.
fn check(gz: &mut Gzip, data: &[u8]) -> usize {
    let out = gz.compress(data);
    assert_eq!(&out[..10], &[0x1f, 0x8b, 8, 0, 0, 0, 0, 0, 4, 0xff]);
    let mut back = Vec::with_capacity(data.len());
    MultiGzDecoder::new(out).read_to_end(&mut back).expect("not a gzip stream");
    assert!(back == data, "{} bytes came back as {} other bytes", data.len(), back.len());
    // No larger than storing it: 18 bytes of gzip, 5 per stored block.
    assert!(out.len() <= 18 + data.len() + 11 * (data.len() / 16384 + 1));
    out.len()
}

#[test]
#[cfg_attr(miri, ignore)] // too slow there; see every_path_once
fn empty_and_tiny() {
    let mut gz = Gzip::new();
    assert_eq!(check(&mut gz, b""), 20);
    for n in 0..300usize {
        let data: Vec<u8> = (0..n).map(|i| (i * 7 % 251) as u8).collect();
        check(&mut gz, &data);
        check(&mut gz, &vec![b'x'; n]);
        check(&mut gz, &b"{\"id\":\"abc\",\"n\":12}".repeat(n / 19 + 1)[..n]);
    }
}

#[test]
#[cfg_attr(miri, ignore)] // too slow there; see every_path_once
fn requests_share_codes() {
    let mut rng = Rng(1);
    let mut gz = Gzip::new();
    let mut total = 0;
    for _ in 0..600 {
        let size = 1500 + rng.below(4000);
        total += check(&mut gz, &bid_request(&mut rng, size, 0));
    }
    let s = gz.stats();
    assert!(s.one_pass >= 590, "{s:?}");
    assert_eq!(s.own_codes + s.fixed + s.stored, 0, "{s:?}");
    assert!(s.rebuilds <= 16, "{s:?}");
    assert!(total > 0);
}

#[test]
#[cfg_attr(miri, ignore)] // too slow there; see every_path_once
fn a_change_of_payloads() {
    // Codes made for one kind, then another kind, then bytes that have no
    // codeword at all: each must come back, and the codes must follow.
    let mut rng = Rng(2);
    let mut gz = Gzip::new();
    for round in 0..6 {
        for _ in 0..40 {
            check(&mut gz, &bid_request(&mut rng, 3000, round));
        }
        let binary: Vec<u8> = (0..3000).map(|_| 0x80 | rng.next() as u8).collect();
        check(&mut gz, &binary); // seven bits of eight: codes of its own
        let noise: Vec<u8> = (0..3000).map(|_| rng.next() as u8).collect();
        check(&mut gz, &noise); // nothing to gain: stored
        check(&mut gz, &vec![0u8; 5000]);
        let mut mixed = bid_request(&mut rng, 3000, round);
        mixed[1500] = 0xfe; // one byte the codes have never seen
        check(&mut gz, &mixed);
    }
    let s = gz.stats();
    assert!(s.one_pass > 150 && s.stored >= 6 && s.own_codes >= 6, "{s:?}");
}

#[test]
#[cfg_attr(miri, ignore)] // too slow there; see every_path_once
fn every_shape() {
    let mut rng = Rng(3);
    let mut gz = Gzip::new();
    for i in 0..6000 {
        let data = any_payload(&mut rng, if i % 16 == 0 { 70000 } else { 9000 });
        check(&mut gz, &data);
        if i % 500 == 0 {
            gz = Gzip::new();
        }
    }
}

#[test]
#[cfg_attr(miri, ignore)] // too slow there; see every_path_once
fn large_payloads() {
    let mut rng = Rng(4);
    let mut gz = Gzip::new();
    for &n in &[16383usize, 16384, 16385, 32768, 32769, 49152, 100_000, 1 << 20] {
        let mut data = Vec::with_capacity(n + 6000);
        while data.len() < n {
            data.extend_from_slice(&bid_request(&mut rng, 4000, 0));
        }
        data.truncate(n);
        let size = check(&mut gz, &data);
        assert!(size < n / 2, "{n} bytes of requests became {size}");
        // and with nothing to find
        let noise: Vec<u8> = (0..n).map(|_| rng.next() as u8).collect();
        check(&mut gz, &noise);
    }
}

#[test]
#[cfg_attr(miri, ignore)] // too slow there; see every_path_once
fn block_edges() {
    // Matches that end at, just before and just after the end of the input
    // and of a block, at every length a match can have.
    let mut gz = Gzip::new();
    let mut rng = Rng(5);
    let unit: Vec<u8> = (0..700).map(|_| b'a' + rng.below(26) as u8).collect();
    for n in (1020..1300).chain(16370..16400).chain(32750..32790) {
        let mut data = unit.repeat(n / 700 + 1);
        data.truncate(n);
        check(&mut gz, &data);
        let k = data.len() - 1 - rng.below(12.min(n - 1));
        data[k] ^= 1;
        check(&mut gz, &data);
    }
}

#[test]
#[cfg_attr(miri, ignore)] // too slow there; see every_path_once
fn thread_local() {
    let mut rng = Rng(6);
    for _ in 0..50 {
        let data = bid_request(&mut rng, 4000, 0);
        let back = gzhot::gzip_with(&data, |gz| {
            let mut back = Vec::new();
            MultiGzDecoder::new(gz).read_to_end(&mut back).unwrap();
            back
        });
        assert!(back == data);
    }
    assert!(gzhot::local_stats().one_pass >= 45);
}

#[test]
fn send() {
    fn is_send<T: Send>() {}
    is_send::<Gzip>();
}

/// Every way a block can be written, with as few payloads as that takes:
/// small enough to run under Miri.
#[test]
fn every_path_once() {
    let mut rng = Rng(7);
    let mut gz = Gzip::new();
    for _ in 0..18 {
        check(&mut gz, &bid_request(&mut rng, 1300, 0)); // one pass, some counted
    }
    let mut odd = bid_request(&mut rng, 1300, 0);
    odd[700] = 0xf3;
    check(&mut gz, &odd); // a byte without a codeword
    check(&mut gz, &bid_request(&mut rng, 1300, 0));
    let noise: Vec<u8> = (0..1200).map(|_| rng.next() as u8).collect();
    check(&mut gz, &noise); // stored
    let binary: Vec<u8> = (0..1200).map(|_| 0x80 | rng.next() as u8 & 0x1f).collect();
    check(&mut gz, &binary); // codes of its own
    check(&mut gz, b"{\"id\":\"7\",\"ok\":true}"); // the fixed codes
    check(&mut gz, b"");
    check(&mut gz, &vec![b'z'; 700]); // the longest matches
    let mut long = Vec::new();
    while long.len() < 40_000 {
        long.extend_from_slice(&bid_request(&mut rng, 1300, 0));
    }
    check(&mut gz, &long); // three blocks
    let s = gz.stats();
    assert!(s.one_pass >= 16 && s.two_pass >= 2 && s.own_codes >= 1, "{s:?}");
    assert!(s.fixed >= 2 && s.stored >= 1 && s.rebuilds >= 3, "{s:?}");
}
