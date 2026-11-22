//! One encoder at one level over a set of payloads, for counting what it
//! executes: one <now|before|ld> <level> <passes> <records.bin>
//! (`ld` is unmodified libdeflate.)
fn main() {
    let a: Vec<String> = std::env::args().collect();
    let level: u8 = a[2].parse().unwrap();
    let passes: usize = a[3].parse().unwrap();
    let data = std::fs::read(&a[4]).unwrap();
    let mut recs = Vec::new();
    let mut off = 0;
    while off + 4 <= data.len() {
        let n = u32::from_le_bytes(data[off..off + 4].try_into().unwrap()) as usize;
        recs.push(&data[off + 4..off + 4 + n]);
        off += 4 + n;
    }
    let mut size = 0usize;
    match a[1].as_str() {
        "before" => {
            let mut gz = before::Gzip::with_level(level);
            for _ in 0..passes {
                size = recs.iter().map(|r| gz.compress(r).len()).sum();
            }
        }
        "ld" => {
            let mut gz = gzlocal::Gzip::new(level as i32);
            for _ in 0..passes {
                size = recs.iter().map(|r| gz.compress(r).len()).sum();
            }
        }
        _ => {
            let mut gz = fastgzip::Gzip::with_level(level);
            for _ in 0..passes {
                size = recs.iter().map(|r| gz.compress(r).len()).sum();
            }
        }
    }
    println!("{} level {level}: {size} B", a[1]);
}
