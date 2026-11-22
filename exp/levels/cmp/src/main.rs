//! fastgzip's levels next to unmodified libdeflate's, level by level.
//! usage: cmp <rounds> <records.bin>...   ([u32 len][bytes] repeated)
//! LEVELS=0-9 (default), e.g. LEVELS=1,5 ; REF=0 leaves libdeflate out.
use std::io::Read;
use std::time::Instant;

fn records(data: &[u8]) -> Vec<&[u8]> {
    let mut recs = Vec::new();
    let mut off = 0;
    while off + 4 <= data.len() {
        let n = u32::from_le_bytes(data[off..off + 4].try_into().unwrap()) as usize;
        recs.push(&data[off + 4..off + 4 + n]);
        off += 4 + n;
    }
    recs
}

fn levels() -> Vec<u32> {
    let spec = std::env::var("LEVELS").unwrap_or_else(|_| "0-9".into());
    let mut v = Vec::new();
    for part in spec.split(',') {
        if let Some((a, b)) = part.split_once('-') {
            v.extend(a.parse::<u32>().unwrap()..=b.parse::<u32>().unwrap());
        } else {
            v.push(part.parse().unwrap());
        }
    }
    v
}

/// Best time of `rounds` passes over the payloads (seconds), and the total
/// size of the last pass.
fn time(rounds: usize, recs: &[&[u8]], mut f: impl FnMut(&[u8]) -> usize) -> (f64, usize) {
    let (mut best, mut size) = (f64::MAX, 0);
    for _ in 0..rounds {
        let t = Instant::now();
        size = recs.iter().map(|r| f(r)).sum();
        best = best.min(t.elapsed().as_secs_f64());
    }
    (best, size)
}

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let rounds: usize = args[1].parse().unwrap();
    let levels = levels();
    let with_ref = std::env::var("REF").map(|v| v != "0").unwrap_or(true);
    for path in &args[2..] {
        let data = std::fs::read(path).unwrap();
        let recs = records(&data);
        let total_in: usize = recs.iter().map(|r| r.len()).sum();
        let n = recs.len() as f64;
        println!(
            "{}: {} payloads, {} B on average",
            path.rsplit('/').next().unwrap(),
            recs.len(),
            total_in / recs.len()
        );
        println!("  level   libdeflate           fastgzip             time    size");
        // libdeflate level 1 is the yardstick for level 0
        let mut l1 = (0.0, 0usize);
        if with_ref {
            let mut gz = gzlocal::Gzip::new(1);
            l1 = time(rounds, &recs, |r| gz.compress(r).len());
        }
        for &level in &levels {
            let tune = |gz: &mut fastgzip::Gzip, fast: bool| gz.__plain_search(!fast);
            if level == 0 {
                // level 0 must write what the published crate writes, and
                // take no longer
                let mut a = fastgzip::Gzip::new();
                let mut b = published::Gzip::new();
                for r in &recs {
                    assert!(a.compress(r) == b.compress(r), "level 0 differs from the published crate");
                }
                let mut b = published::Gzip::new();
                let (t, s) = time(rounds, &recs, |r| b.compress(r).len());
                println!("      0   as published:        {:7.2} us {:8} B", t / n * 1e6, s);
            }
            let fast = std::env::var("FAST").map(|v| v != "0").unwrap_or(true);
            let mut ours = fastgzip::Gzip::with_level(level as u8);
            let mut plain = fastgzip::Gzip::with_level(level as u8);
            tune(&mut ours, true);
            tune(&mut plain, false);
            // every output must decode to its input, and the fast searches
            // must find what the plain ones find
            for r in &recs {
                let out = ours.compress(r);
                let mut back = Vec::with_capacity(r.len());
                flate2::read::MultiGzDecoder::new(out).read_to_end(&mut back).expect("not gzip");
                assert!(back == *r, "level {level}: wrong bytes back");
                assert!(out == plain.compress(r), "level {level}: fast and plain differ");
            }
            let mut ours = fastgzip::Gzip::with_level(level as u8);
            tune(&mut ours, fast);
            let (t, s) = time(rounds, &recs, |r| ours.compress(r).len());
            if !with_ref {
                println!("  {level:5}   {:>20} {:7.2} us {:8} B", "", t / n * 1e6, s);
                continue;
            }
            let (rt, rs) = if level == 0 {
                l1
            } else {
                let mut gz = gzlocal::Gzip::new(level as i32);
                time(rounds, &recs, |r| gz.compress(r).len())
            };
            println!(
                "  {level:5}   {:7.2} us {:8} B  {:7.2} us {:8} B  {:5.2}x  {:+6.2}%{}",
                rt / n * 1e6,
                rs,
                t / n * 1e6,
                s,
                t / rt,
                (s as f64 / rs as f64 - 1.0) * 100.0,
                if level == 0 { "   (against libdeflate level 1)" } else { "" }
            );
        }
    }
}
