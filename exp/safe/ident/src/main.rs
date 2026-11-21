//! The safe-only encoder against the original: the same payloads through
//! compressors of both kinds, in the same order, and every output compared
//! byte for byte.
//!
//!     ident gen <seed> <payloads>      the stress run's payloads
//!     ident file <records.bin>...      [u32 len][bytes] repeated
#[path = "../../fastgzip/tests/gen/mod.rs"]
mod gen;
use gen::{any_payload, request, Rng};

struct Pair(fastgzip::Gzip, fastgzip_safe::Gzip);

impl Pair {
    fn new() -> Self {
        Pair(fastgzip::Gzip::new(), fastgzip_safe::Gzip::new())
    }
    fn check(&mut self, what: &str, data: &[u8]) -> usize {
        let a = self.0.compress(data);
        let b = self.1.compress(data);
        if a != b {
            let at = a.iter().zip(b.iter()).position(|(x, y)| x != y).unwrap_or(a.len().min(b.len()));
            panic!("{what} ({} bytes): outputs of {} and {} bytes differ at byte {at}", data.len(), a.len(), b.len());
        }
        a.len()
    }
    fn same_stats(&self) {
        assert_eq!(format!("{:?}", self.0.stats()), format!("{:?}", self.1.stats()));
    }
}

fn main() {
    let args: Vec<String> = std::env::args().collect();
    match args[1].as_str() {
        "gen" => {
            let seed: u64 = args[2].parse().unwrap();
            let count: usize = args[3].parse().unwrap();
            let mut rng = Rng(seed.wrapping_mul(0x9E37_79B9_7F4A_7C15) | 1);
            let mut gz: Vec<Pair> = (0..4).map(|_| Pair::new()).collect();
            let (mut bytes_in, mut bytes_out) = (0u64, 0u64);
            let mut phase = 0;
            let mut left = 0;
            for i in 0..count {
                if left == 0 {
                    phase = rng.below(6);
                    left = 1 + rng.below(400);
                }
                left -= 1;
                let data = match phase {
                    0 | 1 => {
                        let size = 300 + rng.below(6000);
                        request(&mut rng, size, phase)
                    }
                    2 => {
                        let kind = rng.below(4);
                        let size = 200 + rng.below(9000);
                        request(&mut rng, size, kind)
                    }
                    3 => {
                        let size = 1000 + rng.below(5000);
                        let mut d = request(&mut rng, size, 0);
                        let other = any_payload(&mut rng, 600);
                        let at = rng.below(d.len());
                        d.splice(at..at, other);
                        d
                    }
                    4 => any_payload(&mut rng, 9000),
                    _ => {
                        let max = if rng.below(8) == 0 { 200_000 } else { 20_000 };
                        any_payload(&mut rng, max)
                    }
                };
                let which = if phase == 2 { rng.below(4) } else { 0 };
                bytes_in += data.len() as u64;
                bytes_out += gz[which].check(&format!("payload {i}"), &data) as u64;
                if rng.below(5000) == 0 {
                    gz[which].same_stats();
                    gz[which] = Pair::new();
                }
            }
            for g in &gz {
                g.same_stats();
            }
            println!("identical: seed {seed}, {count} payloads, {bytes_in} -> {bytes_out} bytes");
        }
        "file" => {
            for path in &args[2..] {
                let data = std::fs::read(path).unwrap();
                // Only files that are records from end to end.
                let mut off = 0;
                while off + 4 <= data.len() {
                    let n = u32::from_le_bytes(data[off..off + 4].try_into().unwrap()) as usize;
                    off = off.saturating_add(4 + n);
                }
                if off != data.len() {
                    println!("skipped: {path} is not a file of records");
                    continue;
                }
                let mut pair = Pair::new();
                let (mut off, mut count, mut out) = (0, 0, 0);
                // twice over the file: the second time with warm codes
                for pass in 0..2 {
                    off = 0;
                    while off + 4 <= data.len() {
                        let n = u32::from_le_bytes(data[off..off + 4].try_into().unwrap()) as usize;
                        out += pair.check(&format!("{path} pass {pass} record at {off}"), &data[off + 4..off + 4 + n]);
                        off += 4 + n;
                        count += 1;
                    }
                }
                let _ = off;
                pair.same_stats();
                println!("identical: {path}, {count} payloads, {out} bytes out, {:?}", pair.0.stats());
            }
        }
        _ => panic!("gen or file"),
    }
}
