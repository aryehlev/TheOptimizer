# gzhot

gzip for a stream of small, similar payloads (JSON requests of a few
kilobytes) on a hot path. Pure Rust: no C, no build script, one dependency
(`crc32fast`). The output is ordinary gzip.

```rust
// on the worker thread, inside the task
gzhot::gzip_with(&payload, |gz| body.extend_from_slice(gz));
```

or with a compressor of your own (one per kind of payload, see below):

```rust
let mut gz = gzhot::Gzip::new();
let bytes: &[u8] = gz.compress(&payload); // valid until the next call
```

It is the fast mode of gzlocal 0.4 (`gzip_fast_with`), written again in
Rust, with every part looked at for what it costs. It came out faster than
the C version, and unlike it, it stays fast for payloads over 16 KiB.

## What it costs

Microseconds per call inside tokio (2 workers), on a GitHub arm64 runner
(Neoverse N2). "Other work" is memory the worker thread walks between two
calls, which is what decides how much of the compressor is still in the
caches when the next payload arrives.

@@NUMBERS@@

Your payloads will differ. `cargo run --release --example payloads --
requests.jsonl` runs a file of them (one per line) through one compressor and
prints the output size, the time per call and how the blocks were written;
`examples/tokio_bench.rs` does the timing inside tokio with other work in
between.

## Using it well

**One compressor per kind of payload.** Consecutive payloads of one `Gzip`
share their Huffman codes. Requests to different recipients that are all
OpenRTB JSON are one kind as far as that goes (the mixed set above is 70
sample requests from different exchanges on one compressor). JSON and
protobuf, or JSON and HTML, are not: give each its own `Gzip`. `gzip_with`
uses one compressor per thread for everything it is given.

**Look at `stats()` once.** `Gzip::stats()` (and `local_stats()` for the
thread-local one) says how the blocks were written. In steady state nearly
all of them should be `one_pass`. If `own_codes` keeps growing, the payloads
are not of one kind, and the calls that hit it cost two to three times as
much.

**The output depends on what came before.** Each output is a complete gzip
stream that any decoder reads on its own, but the same payload compressed
twice gives different bytes, because the codes have moved in between. Do not
compare outputs byte for byte in tests; decompress them.

**Memory.** A `Gzip` is about 80 KiB and its output buffer, which grows to
twice the largest payload it has seen and is reused. Nothing is allocated
per call. A `Gzip` is `Send`.

**Not on a blocking pool.** A call takes microseconds; `spawn_blocking` costs
more than that, and puts the payload on a thread whose compressor has other
codes.

## How it is made fast, part by part

A general DEFLATE compressor reads a payload twice. First it searches for
repetitions and counts the symbols it would write; then it makes Huffman
codes from the counts and goes over the payload's items again to write them.
For a payload of a few kilobytes, making the codes is a large part of the
whole.

**The codes exist before the payload does.** They are made from the payloads
that came before, so a payload is written while it is searched: one pass, and
no codes to make. This is where most of the time goes away. The price is
that the codes are not exactly this payload's, which is most of the
difference in output size. Nothing else is carried from one payload to the
next: no dictionary, no cache of earlier outputs.

**The checksum comes first** (`lib.rs`, `compress`). gzip wants a CRC-32 of
the input. `crc32fast` computes it with carry-less multiplication on both
arm64 and x86-64; doing it before the search also means the search finds the
payload in the cache.

**Room for the worst case is reserved once** (`compress`). Then nothing in
the encoder tests for space: a flush is a plain 8-byte store. The buffer
belongs to the compressor, so after the first few calls `reserve` is a
comparison.

**The search** (`enc.rs`, `scan`):

- One earlier position per hash value, and a table with about one entry per
  input byte: 8 KiB for a payload of up to 4096 bytes. Small enough to live
  in the first-level cache.
- The table is zeroed at the start of every payload. That is cheap at this
  size, and it matters when the thread has done other work since its last
  payload: zeroing walks the table front to back, which the hardware fetches
  far faster than the scattered first touches of the lookups. gzlocal 0.3
  kept its table between calls to save the clearing, and lost more than it
  saved as soon as the caches were cold.
- A position is an offset into the payload, so an empty entry reads as
  position 0. The bytes there are compared like any other candidate's. No
  entry is tested for being empty, and the only branch in a step is the one
  taken for a match.
- A step reads eight bytes at the current position, once. The low byte is the
  literal, the low four bytes are compared with the candidate's, and bytes 1
  to 5 are hashed for the next position, so that the next table lookup can
  start before the next step does.
- Five bytes are hashed, not three or four. A repetition of four bytes saves
  next to nothing in the output, and not looking for it means fewer false
  candidates.
- The hash is one multiplication and one shift: the shift that would drop
  the three bytes that are not hashed is folded into the multiplier.
- Eight bytes are read at the candidate too, though four decide. When they
  decide for a match, the XOR that was computed for the comparison already
  says how long a match of up to seven bytes is, which most are.
- Inside a match only three positions go into the table: the two after its
  start, whose hashes come out of the word already read, and the last one,
  whose word also gives the hash for the position after the match. One load
  per match instead of one per position.
- One bound check per four steps.
- The table size is a constant in each compiled copy of the loop (a const
  generic), so the hash shift is an immediate and the clearing has a fixed
  size.

**Writing** (`scan`, `codes.rs`):

- Everything to be written for a byte is one 32-bit table entry: codeword in
  the low half, its length in the high half. The same for a match length
  (codeword and extra bits already combined) and an offset slot. libdeflate
  keeps codewords and lengths in separate arrays and looks the length slot up
  in a third.
- No literal or length codeword is longer than 14 bits (the format allows
  15). Then four literals and the up to 7 bits left over from the last flush
  always fit in the 64-bit buffer, so the steps come four to a flush, with no
  test for room.
- A byte the codes have no codeword for is not tested for where it is
  written. Its table entry adds 2^15 to the bit count; shifts only use the
  count modulo 64, a flush keeps everything from bit 15 up, and the mark is
  looked at once, when the block is done.
- A match is assembled into one value of at most 47 bits and OR-ed in once.
  The offset slot and its extra bits are arithmetic on the bit length of the
  distance, not a table lookup.
- The block header is made when the codes are, and copied: 128 bytes with a
  fixed-size copy, which is a few vector moves.

**Keeping the codes current** (`lib.rs`):

- Codes are remade after the 1st, 2nd, 6th, 14th ... payload and then every
  1024 payloads. Early on new codes pay at once; later, making them every 64
  payloads (as gzlocal 0.4 does) cost 2 to 5% for no gain in size.
- Between two makings, about 32 payloads have their symbols counted while
  they are written (one extra increment per symbol, some 15% on those
  payloads). The counts go into the next codes, and they say whether the
  current codes still fit: no code can need fewer bits than the entropy of
  the symbols, and codes that need 3% more than that are a bad fit.
- Old payloads fade: the counts are halved each time codes are made.
- Every printable ASCII byte, every match length and every offset has a
  codeword even if it has not occurred yet, so a byte that appears for the
  first time rarely sends a payload down the slow path.

**When the codes do not suit a payload** (`two_pass`). The first payload, a
payload with a byte that has no codeword, one that the codes fit badly, and
every payload under 1 KiB (where the block header is a large part of the
output, and the fixed codes of the format may do better) are searched first,
with the matches recorded and the symbols counted, and then written with
whichever is smallest: the shared codes, codes of their own, the fixed codes,
or stored. After three bad fits in a row the shared codes are remade from the
recent payloads.

**Payloads over 16 KiB** (`large`, `chunk`) are done 16 KiB at a time, each
piece searching the piece before it as well (the table's positions are moved
down between pieces, 16 entries per instruction), and all pieces that can be
written in one pass form a single DEFLATE block with one header. gzlocal 0.4
hands such payloads to stock libdeflate.

**Making codes** (`huff.rs`, `codes.rs`) is the one slow thing left, 3 to 5
microseconds, and it runs once per 1024 payloads. It is still without
allocation: fixed arrays on the stack, one sort of `u32` keys, the Huffman
tree built in place in the sorted array, and the tables of the fixed codes
made by the compiler.

**Memory layout.** Everything a compressor keeps is one allocation. The
fields every call reads come first, then the tables of the shared codes; the
buffers that only the slow path uses are behind them.

### What was tried and did not help

On the Neoverse N2 runner, against the encoder as it is:

@@TRIED@@

## Output size

@@SIZES@@

## How it was checked

The encoder reads and writes through raw pointers. Every such access has a
debug assertion on its bounds, and the `checked` profile compiles them into
an optimized build.

@@CHECKED@@

## To reproduce

```
cargo test                                         # debug build, all assertions
cargo test --profile checked                       # optimized, all assertions
cargo run --profile checked --example stress -- 1 100000 dump.bin
python3 tools/check_dump.py dump.bin --gzip 2000   # zlib and gzip read it back
cargo run --release --example payloads -- requests.jsonl
cargo run --release --example tokio_bench -- requests.jsonl lines 16000 2 67108864 local
```

`tokio_bench <file> <payload_bytes|0|lines> <requests> <workers>
<other_work_bytes> <local|fresh|blocking>`: with `lines` every line of the
file is a payload; `other_work_bytes` is the memory a worker walks between
two calls.

## Limits

- Not timed on Neoverse N1. The runner is N2; N1 has the same instruction
  set and a narrower core.
- For payloads of mixed kinds on one compressor, and for very repetitive
  payloads (most of the input covered by long repetitions), the output is
  further from libdeflate's than the figures above; see Output size.
- Level 1 only. There is no setting that trades time for size.
- Needs Rust 1.83 or later.
