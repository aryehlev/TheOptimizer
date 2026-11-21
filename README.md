# gzlocal on arm64: a benchmark run

This branch exists to run `gzlocal/bench/arm.sh`, the tests, a stress batch and
a single-thread harness (`exp/run.sh`) on GitHub's hosted arm64 runner (and on
the x86-64 one for comparison). The workflow writes what it measured to
`results/`.

`exp/real/run.sh` runs the encoders on sample bid requests that exchanges and
open-source bidders have published. It downloads them when it runs; none are
kept here. The repository was empty when
the branch was pushed; delete the branch or the files whenever you like.

`gzlocal` is gzip for small payloads with one libdeflate compressor per thread;
see `gzlocal/README.md`. `gzlocal/vendor` holds libdeflate (MIT, see
`gzlocal/vendor/COPYING.libdeflate`), stock and patched.
