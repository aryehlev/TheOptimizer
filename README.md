# gzlocal on arm64: a benchmark run

This branch exists to run `gzlocal/bench/arm.sh`, the tests, a stress batch and
a single-thread harness (`exp/run.sh`) on GitHub's hosted arm64 runner (and on
the x86-64 one for comparison). The workflow writes what it measured to
`results/`. The repository was empty when the branch was pushed; delete the
branch or the files whenever you like.

`exp/real/run.sh` runs the encoders on sample bid requests that exchanges and
open-source bidders have published. It downloads them when it runs; none are
kept here. Its output is in `results/real-*/real.txt`.

`fastgzip/` is the fast encoder written again in Rust, without libdeflate; see
`fastgzip/README.md`. `exp/rust/run.sh` runs its tests, a stress batch with every
assertion on, Miri, and its timings against the C encoders; the output is in
`results/rust-*/rust.txt`.

`gzlocal` is gzip for small payloads with one libdeflate compressor per thread;
see `gzlocal/README.md`. `gzlocal/vendor` holds libdeflate (MIT, see
`gzlocal/vendor/COPYING.libdeflate`), stock and patched.
