#!/bin/sh
# Measure on the machine that matters (for example one of your arm64 nodes).
# Needs cargo and python3.  Takes a few minutes.  Prints microseconds per gzip
# call for 3.7 KB synthetic bid requests in tokio with 2 workers: the lowest
# median of 5 runs for stock libdeflate, gzip_with, gzip_codes_with, and
# gzip_codes_with with the 32 KiB hash table, at three amounts of other work
# per request.
set -e
cd "$(dirname "$0")/.."
python3 bench/rtbgen.py /tmp/gzlocal_rtb 400 6 > /dev/null
cargo build --release --examples > /dev/null 2>&1
cargo build --release --examples --features stock --target-dir target-stock > /dev/null 2>&1
echo "tests: $(cargo test --release 2>&1 | grep 'test result' | head -1)"
echo "machine: $(uname -m), $(grep -c ^processor /proc/cpuinfo 2>/dev/null) CPUs, $(lscpu 2>/dev/null | sed -n 's/^Model name: *//p' | head -1)"
F=/tmp/gzlocal_rtb_single.bin
one() { "$@" | sed -n 's/.*median \([0-9.]*\) us.*out \([0-9.]*\)% of in.*/\1 \2/p'; }
for other in 0 262144 4194304; do
  : > /tmp/gzlocal_runs
  for run in 1 2 3 4 5; do
    echo "stock $(one target-stock/release/examples/tokio_bench $F 0 16000 2 $other inline)" >> /tmp/gzlocal_runs
    echo "gzip_with $(one target/release/examples/tokio_bench $F 0 16000 2 $other inline)" >> /tmp/gzlocal_runs
    echo "gzip_codes_with $(one target/release/examples/tokio_bench $F 0 16000 2 $other codes 1 15)" >> /tmp/gzlocal_runs
    echo "gzip_codes_with,table_order_13 $(one target/release/examples/tokio_bench $F 0 16000 2 $other codes 1 13)" >> /tmp/gzlocal_runs
  done
  echo "other work per request: $((other / 1024)) KiB"
  for v in stock gzip_with gzip_codes_with gzip_codes_with,table_order_13; do
    grep "^$v " /tmp/gzlocal_runs | sort -k2 -n | head -1 | awk '{printf "  %-32s %6.2f us   output %s%% of input\n", $1, $2, $3}'
  done
done
