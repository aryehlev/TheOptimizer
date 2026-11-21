#!/bin/sh
# Experiment: what the thread-local compressor is worth.  Regular libdeflate
# with a new compressor for every payload, the way it is usually called,
# against the same with one compressor per thread, and against gzip_fast_with.
# tokio, 2 workers, 3.7 KB synthetic bid requests, microseconds per call,
# lowest median of 3 runs.
set -e
cd "$(dirname "$0")/../../gzlocal"
python3 bench/rtbgen.py /tmp/fresh_rtb 400 6 > /dev/null
cargo build --release --examples > /dev/null 2>&1
cargo build --release --examples --features stock --target-dir target-stock > /dev/null 2>&1
F=/tmp/fresh_rtb_single.bin
echo "machine: $(uname -m), $(lscpu 2>/dev/null | sed -n 's/^Model name: *//p' | head -1)"
for other in 0 4194304 67108864; do
  n=16000
  if [ $other = 67108864 ]; then n=1600; fi
  echo "other work per request: walks $((other / 1024)) KiB"
  for v in "regular_libdeflate,new_compressor_per_call target-stock fresh" "regular_libdeflate,one_compressor_per_thread target-stock inline" "patched,new_compressor_per_call target fresh" "patched,gzip_codes_with target codes" "patched,gzip_fast_with target fast"; do
    set -- $v
    best=$(for run in 1 2 3; do $2/release/examples/tokio_bench $F 0 $n 2 $other $3 | sed -n 's/.*median \([0-9.]*\) us.*out \([0-9.]*\)% of in.*/\1 \2/p'; done | sort -n | head -1)
    echo "  $1 $best" | awk '{printf "  %-46s %6.2f us   output %s%% of input\n", $1, $2, $3}'
  done
done
