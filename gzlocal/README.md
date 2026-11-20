# gzlocal

gzip for small payloads on a multi-threaded runtime: one libdeflate compressor
and one output buffer per thread, level 1, no allocation per call. The patched
libdeflate is vendored and built by `build.rs`. The output is ordinary gzip.

```rust
// on the worker thread, inside the task
gzlocal::gzip_fast_with(&payload, |gz| out.extend_from_slice(gz));     // payloads of one kind: a third of stock's time
gzlocal::gzip_codes_with(&payload, |gz| out.extend_from_slice(gz));    // the same, smaller output, 70% of stock's time
gzlocal::gzip_with(&payload, |gz| out.extend_from_slice(gz));          // the bytes stock libdeflate gives
gzlocal::gzip_session_with(&payload, |gz| out.extend_from_slice(gz));  // one request sent to several recipients
```

Never move the call to `spawn_blocking`: the hand-off costs several times the
compression itself.

## Which one

Synthetic bid requests of 3.7 KB, tokio, a Neoverse N2 (GitHub's arm64 runner),
microseconds per call:

| | nothing else on the thread | 64 MiB of other work per request | output |
|---|---|---|---|
| stock libdeflate, level 1 | 17.3 | 20.1 | 58.1% of the input |
| `gzip_with` | 17.4 | 20.3 | the same bytes |
| `gzip_codes_with` | 12.3 | 14.6 | 1.1% larger |
| `gzip_fast_with` | 5.6 | 7.3 | 2.2% larger |

The sizes are for those requests. Both sessions cost more on payloads that
compress further, the fast one most (see "Output size" below), so measure your
own before choosing: `sh bench/arm.sh payloads.jsonl`, one payload per line,
prints the time and the output size of each.

## What each one does

**`gzip_with`**: stock libdeflate's output, byte for byte, at its speed.

**`gzip_codes_with`** (`Session::Codes`). libdeflate parses a payload into
literals and matches, counts them, builds Huffman codes for the counts and then
walks the list a second time to write it. A server sends the same kind of
payload again and again, so this compressor keeps the codes from one payload to
the next, remaking them now and then from the payloads it has seen. Because the
codes then exist before a payload arrives, the payload is written in one pass:
every literal and match goes out the moment it is decided. One payload in eight
has its symbols counted while it is written; the counts go into the next codes
and show whether the current ones still fit. If they fit a payload badly
(another kind of payload on the same compressor), that payload is written again
with codes of its own, as stock would give it. The search for repetitions is
libdeflate's, in a 32 KiB table.

**`gzip_fast_with`** (`Session::CodesFast`) is the same with a search made for
this job:

- one earlier position is kept per hash value instead of two, and five bytes
  are hashed instead of four, so a repetition of only four bytes is no longer
  looked for;
- inside a match only the first two positions and the last are entered into
  the table;
- the table has one entry per byte of the payload, rounded up: 8 KiB for
  payloads up to 4 KiB, 16 KiB up to 8 KiB, 32 KiB above. It is zeroed at the
  start of every call. That sweep is what brings it into the cache, in one
  go, and a zero already means "the first byte of the payload", so no entry
  ever has to be tested for being empty: a step has one branch, taken only
  when a match is found;
- four literals go into the bit buffer per flush.

Nothing is kept between calls except the codes and the counts they are made
from: no payload, no values, no cache.

**`gzip_session_with`** (`Session::CodesAndPrefix`) is for one request sent to
several recipients: a payload that begins with the same bytes as the previous
one is continued from that one's output, so only what differs is compressed.
It keeps the previous payload and its output, and writes in two passes. Put
what differs per recipient last. It is unchanged since 0.3 and was not measured
again.

Keep one session compressor per kind of payload: for a second kind, a
`Gzip::with_session(..)` in a `thread_local!` of your own. `Gzip::own_codes()`
counts the payloads that did not use the shared codes.

Limits: level 1; payloads up to 16 KiB share codes, from 1 KiB up they are
written in one pass; up to 8 KiB can be continued. A larger payload is
compressed as stock would compress it.

## Measurements

Synthetic OpenRTB-style bid requests from `bench/rtbgen.py` (3.7 KB on average,
each a different auction), level 1, `bench/arm.sh`: tokio with 2 workers,
microseconds per gzip call, lowest median of 5 runs. Both machines are GitHub's
hosted runners, measured in the same workflow run, 4 vCPUs each.

Neoverse N2, 1 MiB of second-level cache per core, 128 MiB shared:

| Other work per request | stock | `gzip_with` | `gzip_codes_with` | `gzip_fast_with` |
|---|---|---|---|---|
| none | 17.3 | 17.4 | 12.3 | 5.6 |
| walks 4 MiB | 18.3 | 18.5 | 13.3 | 6.3 |
| walks 64 MiB | 20.1 | 20.3 | 14.6 | 7.3 |

EPYC 7763, 512 KiB per core, 32 MiB shared:

| Other work per request | stock | `gzip_with` | `gzip_codes_with` | `gzip_fast_with` |
|---|---|---|---|---|
| none | 21.5 | 21.1 | 15.2 | 7.2 |
| walks 4 MiB | 22.5 | 22.0 | 16.1 | 7.6 |
| walks 64 MiB | 31.4 | 31.7 | 20.7 | 9.9 |

So `gzip_fast_with` takes 32 to 36% of stock's time on the N2 and 32 to 34% on
the EPYC. On a Xeon 6975P-C, in the run before this one, it took 29 to 30%. A
Neoverse N1 has not been timed: run `bench/arm.sh` on one.

### Cold caches, and what 0.3 got wrong

A server thread does other work between two gzip calls, and that work pushes
the compressor's tables out of the core's caches. Walking 4 MiB empties the
core's own caches; walking 64 MiB reaches into the cache the cores share.

Stock libdeflate clears its 128 KiB table at the start of every call. That
looks like waste, and 0.3 removed it: it kept the table between calls and
fenced off the old entries. Timed with warm caches, as 0.3 was, that is
faster. But the clearing walks the table front to back, which is the fastest
way to fetch it; without it the table comes in one cache miss at a time, in the
order the search happens to touch it. With 0.3's table (still available:
`set_table_order(15)`), same run as above:

| Other work per request | N2 stock | N2 `gzip_codes_with`, 0.3's table | EPYC stock | EPYC `gzip_codes_with`, 0.3's table |
|---|---|---|---|---|
| none | 17.3 | 11.5 | 21.5 | 12.8 |
| walks 4 MiB | 18.3 | 14.0 | 22.5 | 14.4 |
| walks 64 MiB | 20.1 | 21.0 | 31.4 | 49.6 |

After 64 MiB of other work the gain is gone on the N2, whose shared cache is
larger than the walk, and on the EPYC, whose shared cache is smaller, 0.3's
table makes a call more than half again as slow as stock's. 0.3's `gzip_with`
kept its table the same way; after 64 MiB of other work it took 25.9 against
stock's 20.4 on the N2 and, on an EPYC 9V74 with the same 32 MiB, 66.6 against
34.2. If you run 0.3 on a busy server, that is the case to check for.

0.4 goes back to clearing: without a session exactly as stock does, with
`Session::Codes` on a 32 KiB table, and with `Session::CodesFast` on the 8 to
32 KiB table described above.

### Output size

Against stock libdeflate at level 1:

| Payloads | stock, % of input | `gzip_codes_with` | `gzip_fast_with` |
|---|---|---|---|
| synthetic bid requests, 3.7 KB | 58.1 | +1.1% | +2.2% |
| Twitter API JSON cut into 5 KB pieces | 33.7 | +2.7% | +6.2% |
| Twitter API JSON cut into 8 KB pieces | 27.7 | +2.3% | +6.8% |
| a catalogue (citm_catalog.json) cut into 8 KB pieces | 6.6 | +9.2% | +14.5% |
| random base64 text, 3.7 KB | 76.3 | +0.4% | +0.4% |

Pieces of one file resemble each other less than requests of one kind do, which
is part of what the lower rows show. The rest is the search: the more of a
payload is repetition, the more a cheaper search gives up. Requests that are
mostly values (ids, URLs, user agents) are at the top of this table.

With a fixed table, `gzip_fast_with` gives +2.3%, +2.0% and +1.9% on the bid
requests for 8, 16 and 32 KiB (`set_fast_table_order(11)`, `12`, `13`). The
three are within 3% of each other in time with warm caches. After 64 MiB of
other work the 32 KiB table is 12% slower than the 8 KiB one on the N2 and 18%
slower on the EPYC.

### Other gzip encoders on the same payloads

One thread, compressors reused, best of 5 runs, on an x86-64 VM that is noisy:

| Encoder | microseconds | output, % of input |
|---|---|---|
| zlib-rs (flate2) level 1 | 20.7 | 73.1 |
| zlib-rs (flate2) level 2 | 41.1 | 58.6 |
| miniz_oxide level 1 | 29.4 | 60.7 |
| libdeflate level 1 (`gzip_with`) | 19.7 | 58.1 |
| `Session::Codes` | 14.3 | 58.7 |
| `Session::CodesFast` | 6.1 | 59.4 |

Intel's ISA-L (igzip), built around AVX2 and AVX-512, through its Python
binding on the same machine and payloads on another day: level 1 about 17 for
58.7%, level 0 about 8 for 72%.

### What did not work, or was taken out

Each was built and timed on the N2 and on an x86-64 runner, one thread, pinned.

- Keeping the table between calls (0.3): see above.
- For the fast search, the 128 KiB table with a test for stale entries: 6.7
  microseconds warm against 5.9, 10.8 against 6.7 after 64 MiB of other work.
- Looking at every other position after 64, 32 or 16 positions without a match:
  3%, 8% and 13% faster for 0.2%, 0.9% and 1.6% more output.
- Entering every position of a match into the table: 0.5% less output on the
  bid requests, 10% slower. Entering only the first: 1.5% faster, 0.1% more.
- Skipping long identifier-like runs (which `Session::Codes` does): no gain
  once a lookup is this cheap.
- Hashing six bytes: 2% more output. A prefetch of the next table entry:
  slower. Counting the symbols of one payload in 16 instead of one in 8: 1.5%
  faster, and slower to notice that the payloads have changed.
- Reading the next position's bytes one step ahead, which saves instructions
  per step: no faster on either machine.
- From 0.3: values compressed once and copied into later payloads (needs a
  cache of values); codes trained once and then fixed (the output grew 5% on
  payloads that drifted, with nothing to notice it); searching only where JSON
  tokens start.

## To reproduce

```sh
sh bench/arm.sh                  # the tables above, on any machine with cargo and python3
sh bench/arm.sh payloads.jsonl   # the same on your own payloads, one per line

python3 bench/rtbgen.py /tmp/rtb 400 6
cargo build --release --examples
target/release/examples/tokio_bench /tmp/rtb_single.bin 0 16000 2 4194304 fast
cargo build --release --examples --features stock --target-dir target-stock
target-stock/release/examples/tokio_bench /tmp/rtb_single.bin 0 16000 2 4194304 inline
```

## What changed since 0.3

- `Session::CodesFast`, `gzip_fast_with`, `set_fast_table_order`,
  `fast_own_codes`.
- `Session::Codes` no longer writes one payload in eight in two passes, and its
  table is 32 KiB and cleared per call unless `set_table_order(15)` asks for
  0.3's. Its output differs from 0.3's by 0.1%.
- Without a session the tables are cleared for every payload again. The output
  is the same as before, stock's.

## Features

- default: the patched libdeflate (`vendor/patched`)
- `stock`: unmodified libdeflate master, for comparison
- `sized`: 0.1's default

`GZLOCAL_FRAME_POINTERS=1` at build time keeps frame pointers in the C code,
for profilers that walk the stack by frame pointer.

## Checked

For the library as vendored here:

- Without a session: byte-identical to stock on 37 sets of payloads from 300 B
  to 300 KB, on x86-64 and on (emulated) arm64.
- With a session, on x86-64 under ASan and UBSan with libdeflate's assertions
  on, every output decompressed and compared: 440,000 payloads (random sizes;
  repeated, cut, extended and altered payloads; tokens; noise; both searches;
  every table size and the default; output buffers that are large, exact and
  too small). 8,000 of the outputs also went through zlib-ng's inflate and
  3,000 through GNU gzip.
- arm64, the C code under QEMU's user-mode emulation of a Neoverse N1 with
  assertions on: the same 440,000 payloads, and the 8,000 sampled outputs are
  the same bytes as on x86-64.
- arm64, on the Neoverse N2 runner: the Rust tests, and 200,000 payloads of the
  same stress under ASan and UBSan with assertions on.
