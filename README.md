# gzlocal on arm64: a benchmark run

This branch exists to run `gzlocal/bench/arm.sh`, the tests and a stress batch
on GitHub's hosted arm64 runner (and on the x86-64 one for comparison). The
workflow writes what it measured to `results/`. The repository was empty when
the branch was pushed; delete the branch or the files whenever you like.

`gzlocal` is gzip for small payloads with one libdeflate compressor per thread;
see `gzlocal/README.md`. `gzlocal/vendor` holds libdeflate (MIT, see
`gzlocal/vendor/COPYING.libdeflate`), stock and patched.
