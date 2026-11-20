#!/bin/sh
# Measure on the machine that matters (for example one of your arm64 nodes).
# Needs cargo and python3.  Takes several minutes.  Prints microseconds per
# gzip call for 3.7 KB synthetic bid requests in tokio with 2 workers: the
# lowest median of 5 runs (RUNS=n for another number) for stock libdeflate,
# gzip_with, gzip_codes_with (and the same with the 128 KiB table that 0.3
# used) and gzip_fast_with (and the same with a fixed 16 KiB table), at three
# amounts of other work per request.  Walking 4 MiB pushes the compressor's
# tables out of the core's own caches; walking 64 MiB pushes them out of a
# shared cache of up to that size too, which is what a busy server does.
#
#   bench/arm.sh [file of your own payloads, one per line]
set -e
OWN=
if [ -n "$1" ]; then OWN=$(cd "$(dirname "$1")" && pwd)/$(basename "$1"); fi
cd "$(dirname "$0")/.."
python3 bench/rtbgen.py /tmp/gzlocal_rtb 400 6 > /dev/null
cargo build --release --examples > /dev/null 2>&1
cargo build --release --examples --features stock --target-dir target-stock > /dev/null 2>&1
echo "tests: $(cargo test --release 2>&1 | grep 'test result' | head -1)"
echo "machine: $(uname -m), $(grep -c ^processor /proc/cpuinfo 2>/dev/null) CPUs, $(lscpu 2>/dev/null | sed -n 's/^Model name: *//p' | head -1)"
F=/tmp/gzlocal_rtb_single.bin
CUT=0
if [ -n "$OWN" ]; then F=$OWN; CUT=lines; fi
B=target/release/examples/tokio_bench
row() {
  name=$1; shift
  echo "$name $("$@" | sed -n 's/.*median \([0-9.]*\) us.*out \([0-9.]*\)% of in.*/\1 \2/p')" >> /tmp/gzlocal_runs
}
for other in 0 4194304 67108864; do
  n=16000
  if [ $other = 67108864 ]; then n=1600; fi
  : > /tmp/gzlocal_runs
  for run in $(seq 1 ${RUNS:-5}); do
    row stock target-stock/release/examples/tokio_bench $F $CUT $n 2 $other inline
    row gzip_with $B $F $CUT $n 2 $other inline
    row gzip_codes_with $B $F $CUT $n 2 $other codes
    row gzip_codes_with,table_order_15 $B $F $CUT $n 2 $other codes 1 15
    row gzip_fast_with $B $F $CUT $n 2 $other fast
    row gzip_fast_with,table_order_12 $B $F $CUT $n 2 $other fast 1 12
  done
  echo "other work per request: walks $((other / 1024)) KiB"
  for v in stock gzip_with gzip_codes_with gzip_codes_with,table_order_15 gzip_fast_with gzip_fast_with,table_order_12; do
    grep "^$v " /tmp/gzlocal_runs | sort -k2 -n | head -1 | awk '{printf "  %-32s %6.2f us   output %s%% of input\n", $1, $2, $3}'
  done
done
