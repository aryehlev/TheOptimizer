//! The working copy next to the copy that was measured before, and to
//! libdeflate: ab <rounds> <records.bin>...   (LEVELS as in cmp)
//! Rounds of the three are interleaved, so that what the machine is doing
//! at the time weighs on all of them alike.
use std::time::Instant;

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let rounds: usize = args[1].parse().unwrap();
    let spec = std::env::var("LEVELS").unwrap_or_else(|_| "1-9".into());
    let mut levels = Vec::new();
    for part in spec.split(',') {
        if let Some((a, b)) = part.split_once('-') {
            levels.extend(a.parse::<u32>().unwrap()..=b.parse::<u32>().unwrap());
        } else {
            levels.push(part.parse().unwrap());
        }
    }
    for path in &args[2..] {
        let data = std::fs::read(path).unwrap();
        let mut recs = Vec::new();
        let mut off = 0;
        while off + 4 <= data.len() {
            let n = u32::from_le_bytes(data[off..off + 4].try_into().unwrap()) as usize;
            recs.push(&data[off + 4..off + 4 + n]);
            off += 4 + n;
        }
        print!("{:<16}", path.rsplit('/').next().unwrap());
        for &level in &levels {
            let mut new = fastgzip::Gzip::with_level(level as u8);
            let mut old = before::Gzip::with_level(level as u8);
            let mut ld = gzlocal::Gzip::new(level as i32);
            let (mut tn, mut to, mut tl) = (f64::MAX, f64::MAX, f64::MAX);
            let (mut sn, mut so) = (0usize, 0usize);
            for _ in 0..rounds {
                let t = Instant::now();
                sn = recs.iter().map(|r| new.compress(r).len()).sum();
                tn = tn.min(t.elapsed().as_secs_f64());
                let t = Instant::now();
                so = recs.iter().map(|r| old.compress(r).len()).sum();
                to = to.min(t.elapsed().as_secs_f64());
                let t = Instant::now();
                let _s: usize = recs.iter().map(|r| ld.compress(r).len()).sum();
                tl = tl.min(t.elapsed().as_secs_f64());
            }
            let _ = (sn, so);
            print!("  L{level} {:.2}/{:.2}", tn / tl, to / tl);
        }
        println!();
    }
}
