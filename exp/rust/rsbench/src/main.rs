//! fastgzip (Rust) against the C encoders on the same payloads, one thread.
//! usage: rsbench <rounds> <records.bin>...   ([u32 len][bytes] repeated)
//! Per call: best of <rounds> passes over all payloads, the encoders taking turns.
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

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let rounds: usize = args[1].parse().unwrap();
    for path in &args[2..] {
        let data = std::fs::read(path).unwrap();
        let recs = records(&data);
        let total_in: usize = recs.iter().map(|r| r.len()).sum();
        let mut stock = gzlocal::Gzip::new(1);
        let mut cfast = gzlocal::Gzip::with_session(gzlocal::Session::CodesFast);
        let mut ccodes = gzlocal::Gzip::with_session(gzlocal::Session::Codes);
        let mut rust = fastgzip::Gzip::new();
        let mut best = [f64::MAX; 4];
        let mut size = [0usize; 4];
        // ONLY_RUST=1: time only fastgzip (stock once, for the size).
        let only_rust = std::env::var("ONLY_RUST").is_ok();
        for round in 0..rounds {
            for which in 0..4 {
                if only_rust && which != 3 && !(which == 0 && round == 0) {
                    continue;
                }
                let t = Instant::now();
                let mut total = 0;
                for r in &recs {
                    total += match which {
                        0 => stock.compress(r).len(),
                        1 => ccodes.compress(r).len(),
                        2 => cfast.compress(r).len(),
                        _ => rust.compress(r).len(),
                    };
                }
                best[which] = best[which].min(t.elapsed().as_secs_f64());
                size[which] = total;
            }
            if round == 0 {
                for r in &recs {
                    let mut back = Vec::new();
                    flate2::read::MultiGzDecoder::new(rust.compress(r)).read_to_end(&mut back).unwrap();
                    assert!(back == *r);
                }
            }
        }
        let name = path.rsplit('/').next().unwrap();
        println!("{name}: {} payloads, {} B on average", recs.len(), total_in / recs.len());
        for (which, label) in ["libdeflate level 1", "C Session::Codes", "C Session::CodesFast", "fastgzip (Rust)"].iter().enumerate() {
            if only_rust && which != 3 {
                continue;
            }
            println!(
                "  {label:22} {:7.3} us/call  {:5.1}% of stock time   {:6.2}% of in   {:+6.2}% vs stock",
                best[which] / recs.len() as f64 * 1e6,
                best[which] * 100.0 / best[0],
                size[which] as f64 * 100.0 / total_in as f64,
                (size[which] as f64 / size[0] as f64 - 1.0) * 100.0
            );
        }
        println!("  fastgzip: {:?}", rust.stats());
    }
}
