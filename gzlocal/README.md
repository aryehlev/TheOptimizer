# gzlocal

gzip for small payloads on a multi-threaded runtime: one libdeflate compressor
and one output buffer per thread, level 1, no allocation per call. The patched
libdeflate is vendored and built by `build.rs`. The output is ordinary gzip.

```rust
// on the worker thread, inside the task
gzlocal::gzip_with(&payload, |gz| out.extend_from_slice(gz));          // the bytes stock libdeflate gives
gzlocal::gzip_codes_with(&payload, |gz| out.extend_from_slice(gz));    // payloads of one kind: shared codes, one pass
gzlocal::gzip_session_with(&payload, |gz| out.extend_from_slice(gz));  // one request sent to several recipients
```

Never move the call to `spawn_blocking`: the hand-off costs several times the
compression itself.

## What each one does

**`gzip_with`**: stock libdeflate's output, byte for byte.

**`gzip_codes_with`** (`Session::Codes`). libdeflate parses a payload into
literals and matches, counts them, builds Huffman codes for the counts and then
walks the list a second time to write it. A server sends the same kind of
payload again and again, so this compressor keeps the codes from one payload to
the next, remaking them now and then from the payloads it has seen. Because the
codes then exist before a payload arrives, the payload is written in one pass:
every literal and match goes out the moment it is decided. One payload in eight
still takes two passes; that is where the next codes come from and where the
fit of the current ones is checked. If the codes fit a payload badly (another
kind of payload on the same compressor), that payload gets codes of its own, as
stock would give it. Long runs of identifier or base64 characters that follow
16 unmatched bytes are written without being searched.

Nothing is kept between calls except the codes and the counts they are made
from: no payload, no values, no cache. The output is about 1% larger than
stock's and depends on the payloads that came before on that thread.

**`gzip_session_with`** (`Session::CodesAndPrefix`) is for one request sent to
several recipients: a payload that begins with the same bytes as the previous
one is continued from that one's output, so only what differs is compressed.
It keeps the previous payload and its output, and writes in two passes. Put
what differs per recipient last.

Keep one session compressor per kind of payload: for a second kind, a
`Gzip::with_session(Session::Codes)` in a `thread_local!` of your own.
`Gzip::own_codes()` counts the payloads that did not use the shared codes.

Limits: level 1; payloads up to 16 KiB share codes, from 1 KiB up they are
written in one pass; up to 8 KiB can be continued.

## Measurements

Synthetic OpenRTB-style bid requests from `bench/rtbgen.py` (3.7 KB on average,
each a different auction), level 1, an x86-64 VM with 2 vCPUs. The VM is noisy:
differences under 10% are not reliable.

tokio with 2 workers (`examples/tokio_bench.rs`), microseconds per gzip call,
lowest median of 9 runs:

| Other work per request | stock | `gzip_with` | `gzip_codes_with` | same, table order 13 |
|---|---|---|---|---|
| none | 17.3 | 17.2 | 10.6 | 11.8 |
| walks 256 KiB | 17.3 | 16.0 | 10.8 | 12.1 |
| walks 4 MiB | 23.5 | 26.0 | 19.9 | 17.5 |

Output: 58.1% of the input for stock and `gzip_with`, 58.7% for
`gzip_codes_with` (+1.0%).

### The hash table and the cache

The compressor searches with a 128 KiB hash table. While that table stays in
the CPU's caches between calls, nothing beats it. When the thread does enough
other work between two calls to push it out (the 4 MiB row), much of a call is
cache misses and the gain shrinks; a 32 KiB table then does better, and worse
when the caches are warm. `gzlocal::set_codes_table_order(13)` at startup (or
`Gzip::set_table_order`) selects it. Which case a server is in can only be
measured there.

### Other gzip encoders on the same payloads

One thread, compressors reused, best of 3 runs:

| Encoder | microseconds | output, % of input |
|---|---|---|
| zlib-rs (flate2) level 1 | 17.9 | 73.1 |
| zlib-rs (flate2) level 2 | 37.6 | 58.6 |
| miniz_oxide level 1 | 29.0 | 60.7 |
| libdeflate level 1 (`gzip_with`) | 17.1 | 58.1 |
| `Session::Codes` | 11.1 | 58.7 |

Intel's ISA-L (igzip), built around AVX2 and AVX-512, through its Python
binding on the same machine and payloads: level 1 about 17 for 58.7%, level 0
about 8 for 72%.

### ARM

No ARM machine was available, so there are no ARM timings: run `bench/arm.sh`
on one. What was checked is correctness, with the C code compiled for arm64
and run under QEMU's user-mode emulation of a Neoverse N1, libdeflate's
assertions on: the 440,000-payload stress suite below passed and gave the same
bytes as on x86-64 for the 8,000 sampled outputs; on 37 sets of payloads
`gzip_with`'s path gave stock libdeflate's bytes and the session path the same
bytes as on x86-64; 42,500 outputs made there went through zlib. The Rust
wrapper itself was not run on ARM (the toolchain target could not be
installed here); it contains no architecture-specific code.

### What did not work, or was taken out

- Values compressed once and copied into later payloads (0.3's first draft):
  about 8 microseconds, but it needs a cache of values. Removed.
- Codes trained once and then fixed: 10% faster than a session, but on
  payloads that drifted from the samples the output grew 5% with nothing to
  notice it. Removed; a session checks its codes as it goes.
- Searching only where JSON tokens start (built as a prototype, with the
  token starts found by SSE2 or NEON): 1.6 to 1.9% more output on these
  requests and slower than the one-pass encoder, 12.4 against 10.7
  microseconds. Once the second pass is gone, the lookups are no longer where
  the time goes, and skipping them means writing the literals between matches
  in runs, which costs more than the lookups saved. Not included.
- A branch-free check of both hash-table candidates: the same output, no gain.
- Sparse insertion, a fixed skip after matches, LZ4-style acceleration in
  literal runs, a branch-free match extension, a hash table sized to the input
  as the default (0.1): each lost more compression or time than it saved.

## To reproduce

```sh
sh bench/arm.sh        # everything below, on any machine with cargo and python3

python3 bench/rtbgen.py /tmp/rtb 400 6
cargo build --release --examples
target/release/examples/tokio_bench /tmp/rtb_single.bin 0 16000 2 4194304 codes 1 13
cargo build --release --examples --features stock --target-dir target-stock
target-stock/release/examples/tokio_bench /tmp/rtb_single.bin 0 16000 2 4194304 inline
```

## What changed since 0.2

- `Session::Codes` writes in one pass and skips long identifier-like runs;
  `gzip_codes_with` is its thread-local helper.
- The table order is new, and so is `own_codes`.

## Features

- default: the patched libdeflate (`vendor/patched`)
- `stock`: unmodified libdeflate master, for comparison
- `sized`: 0.1's default

`GZLOCAL_FRAME_POINTERS=1` at build time keeps frame pointers in the C code,
for profilers that walk the stack by frame pointer.

## Checked

- Without a session: byte-identical to stock on 37 sets of payloads from 300 B
  to 300 KB, on x86-64 and (emulated) arm64.
- With a session, under ASan and UBSan with libdeflate's assertions on, every
  output decompressed and compared: 440,000 payloads (random sizes, repeated,
  cut, extended and altered payloads, tokens, noise, every table order, output
  buffers that are large, exact and too small). 8,000 of the outputs also went
  through zlib.
