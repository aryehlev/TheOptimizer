//! fastgzip against libdeflate (and the C encoders) on the same payloads,
//! one thread.
//! usage: rsbench <rounds> <records.bin>...   ([u32 len][bytes] repeated)
//! Per call: best of <rounds> passes over all payloads, the encoders taking
//! turns.  WHICH=<letters> chooses them: l libdeflate level 1, c C
//! Session::Codes, f C Session::CodesFast, r fastgzip, s fastgzip-safe,
//! a the first safe version (output through a slice), u fastgzip with the
//! safe version's way of ending a long match.
//! The default is "lrs".
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

type Encoder = (&'static str, Box<dyn FnMut(&[u8]) -> usize>);

fn encoders(which: &str) -> Vec<Encoder> {
    let mut v: Vec<Encoder> = Vec::new();
    for ch in which.chars() {
        v.push(match ch {
            'l' => {
                let mut gz = gzlocal::Gzip::new(1);
                ("libdeflate level 1", Box::new(move |r| gz.compress(r).len()))
            }
            'c' => {
                let mut gz = gzlocal::Gzip::with_session(gzlocal::Session::Codes);
                ("C Session::Codes", Box::new(move |r| gz.compress(r).len()))
            }
            'f' => {
                let mut gz = gzlocal::Gzip::with_session(gzlocal::Session::CodesFast);
                ("C Session::CodesFast", Box::new(move |r| gz.compress(r).len()))
            }
            'r' => {
                let mut gz = fastgzip::Gzip::new();
                ("fastgzip", Box::new(move |r| gz.compress(r).len()))
            }
            's' => {
                let mut gz = fastgzip_safe::Gzip::new();
                ("fastgzip, no unsafe", Box::new(move |r| gz.compress(r).len()))
            }
            'a' => {
                let mut gz = fastgzip_safe_s1::Gzip::new();
                ("no unsafe, first try", Box::new(move |r| gz.compress(r).len()))
            }
            'u' => {
                let mut gz = fastgzip_u2::Gzip::new();
                ("fastgzip, match end", Box::new(move |r| gz.compress(r).len()))
            }
            _ => panic!("WHICH: letters of lcfrsau"),
        });
    }
    v
}

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let rounds: usize = args[1].parse().unwrap();
    let which = std::env::var("WHICH").unwrap_or_else(|_| "lrs".into());
    for path in &args[2..] {
        let data = std::fs::read(path).unwrap();
        let recs = records(&data);
        let total_in: usize = recs.iter().map(|r| r.len()).sum();
        let mut enc = encoders(&which);
        let mut best = vec![f64::MAX; enc.len()];
        let mut size = vec![0usize; enc.len()];
        for round in 0..rounds {
            // A different one goes first each round.
            for k in 0..enc.len() {
                let e = (k + round) % enc.len();
                let t = Instant::now();
                let mut total = 0;
                for r in &recs {
                    total += (enc[e].1)(r);
                }
                best[e] = best[e].min(t.elapsed().as_secs_f64());
                size[e] = total;
            }
        }
        // Every Rust output comes back as its input.
        // And the versions agree byte for byte.
        let mut a = fastgzip::Gzip::new();
        let mut b = fastgzip_safe::Gzip::new();
        let mut c = fastgzip_safe_s1::Gzip::new();
        let mut d = fastgzip_u2::Gzip::new();
        let mut back = Vec::new();
        for r in &recs {
            let out = a.compress(r);
            back.clear();
            flate2::read::MultiGzDecoder::new(out).read_to_end(&mut back).unwrap();
            assert!(back == *r);
            assert!(out == b.compress(r) && out == c.compress(r) && out == d.compress(r));
        }
        let name = path.rsplit('/').next().unwrap();
        println!("{name}: {} payloads, {} B on average", recs.len(), total_in / recs.len());
        for (e, (label, _)) in enc.iter().enumerate() {
            println!(
                "  {label:22} {:7.3} us/call  {:5.1}% of the first   {:6.2}% of in   {:+6.2}% vs the first",
                best[e] / recs.len() as f64 * 1e6,
                best[e] * 100.0 / best[0],
                size[e] as f64 * 100.0 / total_in as f64,
                (size[e] as f64 / size[0] as f64 - 1.0) * 100.0
            );
        }
    }
}
