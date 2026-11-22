//! One encoder at one level over a set of payloads, for counting what it
//! executes: one <now|before> <level> <passes> <records.bin>
//! (VARIANT and HOPS_FROM as in ab, for `now`.)
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
    if a[1] == "before" {
        let mut gz = before::Gzip::with_level(level);
        for _ in 0..passes {
            size = recs.iter().map(|r| gz.compress(r).len()).sum();
        }
    } else {
        let mut gz = fastgzip::Gzip::with_level(level);
        if let Some(bits) = std::env::var("VARIANT").ok().and_then(|v| v.parse().ok()) {
            gz.__variant(bits);
        }
        if let Some(lg) = std::env::var("HOPS_FROM").ok().and_then(|v| v.parse().ok()) {
            gz.__hops_from(lg);
        }
        for _ in 0..passes {
            size = recs.iter().map(|r| gz.compress(r).len()).sum();
        }
    }
    println!("{} level {level}: {size} B", a[1]);
}
