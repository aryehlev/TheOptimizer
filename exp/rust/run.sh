#!/bin/sh
# The pure-Rust encoder (gzhot/) on this machine: its tests, a stress run with
# every assertion on, Miri, and its time and output size against the C
# encoders (stock libdeflate and gzlocal's gzip_fast_with).
#
#   OUT=<dir>       where the listing of the encoder's machine code goes
#   REAL_SRC=<dir>  where the repositories with sample requests are checked out
set -e
cd "$(dirname "$0")"
HERE=$(pwd)
ROOT=$(cd ../.. && pwd)
OUT=${OUT:-$ROOT/out}
SRC=${REAL_SRC:-/tmp/realsrc}
W=/tmp/rustwork
rm -rf $W && mkdir -p $W $SRC $OUT
echo "machine: $(uname -m), $(nproc) CPUs, $(lscpu 2>/dev/null | sed -n 's/^Model name: *//p' | head -1)"
echo "$(rustc --version)"

cd $ROOT/gzhot
count() { grep 'test result' | awk '{p+=$4; f+=$6} END {print p " passed, " f " failed"}'; }
echo "tests, debug build:    $(cargo test 2>&1 | count)"
echo "tests, checked build:  $(cargo test --profile checked 2>&1 | count)"
cargo build --profile checked --example stress > /dev/null 2>&1
for seed in 1 2 3 4; do
  ./target/checked/examples/stress $seed 50000 $W/dump$seed.bin > $W/stress$seed.txt 2>&1 &
done
wait
cat $W/stress?.txt | sed 's/^/stress, checked build: /'
python3 -I tools/check_dump.py $W/dump1.bin --gzip 1500 | sed 's/^.*dump1.bin: /other decoders: /'
rm -f $W/dump?.bin
if rustup toolchain install nightly --profile minimal --component miri > $W/miri_install.txt 2>&1; then
  echo "Miri ($(rustc +nightly --version)): $(cargo +nightly miri test 2>&1 | tee $W/miri.txt | count)"
  grep -E "Undefined Behavior|error:" $W/miri.txt | head -5 || true
else
  echo "Miri: could not be installed here"
fi

# Payloads: the synthetic bid requests, and the published sample requests.
python3 "$ROOT/gzlocal/bench/rtbgen.py" $W/rtb 400 6 > /dev/null
fetch() {
  if [ ! -d "$SRC/$1" ]; then
    git init -q "$SRC/$1"
    git -C "$SRC/$1" fetch -q --depth 1 "https://github.com/$2" "$3"
    git -C "$SRC/$1" checkout -q FETCH_HEAD
  fi
  python3 -I "$ROOT/exp/real/find_bidrequests.py" "$SRC/$1" "$W/$1.jsonl" > /dev/null
}
fetch RTB4FREE_bidder RTB4FREE/bidder 5cadf9f43fd4fadcd67900a6b41c8bc210131a1f
fetch rtbkit_rtbkit rtbkit/rtbkit 502d06acc3f8d90438946b6ae742190f2f4b4fbb
fetch Vungle_vungo Vungle/vungo bcc58646a2d9c195880779334994133c8e28175d
fetch bsm_openrtb bsm/openrtb e622479794dacd246351de4aa163a550fedd2d46
fetch mxmCherry_openrtb mxmCherry/openrtb d4f4e46b7ea89cea8471220220ea5161e6d5ecfd
fetch prebid_openrtb prebid/openrtb 0d01af1cd27503d7edd0584fadb7e740ab83cc9c
fetch openrtb_examples openrtb/examples fadea3b44e0dea41f4b66961721a65efa179c425
fetch InteractiveAdvertisingBureau_openrtb2.x InteractiveAdvertisingBureau/openrtb2.x 21109db5519c20422d413f3a45732fe9916a93e4
fetch InteractiveAdvertisingBureau_openrtb InteractiveAdvertisingBureau/openrtb f3fb64bb9e5fb0ae65bbf71feff6b7596e1e7d1a
fetch openrtb_openrtb2x openrtb/openrtb2x 57a9ee1c26d959160b1d16b220a516304ca660f6
python3 -I "$ROOT/exp/real/make_sets.py" $W > /dev/null

# One thread, nothing else between the calls: the best of 40 passes over
# each set, the encoders taking turns.
echo
echo "one thread, the best of 40 passes:"
cd $HERE/rsbench
cargo build --release > /dev/null 2>&1
CPU=$(( $(nproc) - 1 ))
taskset -c $CPU ./target/release/rsbench 40 $W/rtb_single.bin $W/capture.bin $W/mixed_exchange.bin

# In tokio, as bench/arm.sh of gzlocal does it: 2 workers, the lowest median
# of 5 runs, at three amounts of other work per request.
cd $ROOT/gzlocal
cargo build --release --examples > /dev/null 2>&1
cargo build --release --examples --features stock --target-dir target-stock > /dev/null 2>&1
cd $ROOT/gzhot
cargo build --release --examples > /dev/null 2>&1
STOCK=$ROOT/gzlocal/target-stock/release/examples/tokio_bench
C=$ROOT/gzlocal/target/release/examples/tokio_bench
R=$ROOT/gzhot/target/release/examples/tokio_bench
row() {
  name=$1; shift
  echo "$name $("$@" | sed -n 's/.*median \([0-9.]*\) us.*out \([0-9.]*\)% of in.*/\1 \2/p')" >> $W/runs
}
tokio() { # file, cut
  for other in 0 4194304 67108864; do
    n=16000
    if [ $other = 67108864 ]; then n=1600; fi
    : > $W/runs
    for run in 1 2 3 4 5; do
      row stock_libdeflate $STOCK $1 $2 $n 2 $other inline
      row C_gzip_fast_with $C $1 $2 $n 2 $other fast
      row Rust_gzhot $R $1 $2 $n 2 $other local
    done
    echo "  other work per request: walks $((other / 1024)) KiB"
    base=$(grep "^stock_libdeflate " $W/runs | sort -k2 -n | head -1 | awk '{print $2}')
    for v in stock_libdeflate C_gzip_fast_with Rust_gzhot; do
      grep "^$v " $W/runs | sort -k2 -n | head -1 | awk -v b=$base '{printf "    %-18s %6.2f us  %5.1f%% of stock   output %s%% of input\n", $1, $2, $2*100/b, $3}'
    done
  done
}
echo
echo "in tokio, 2 workers, 3.7 KB synthetic bid requests:"
tokio $W/rtb_single.bin 0
echo
echo "in tokio, 2 workers, the capture of 1,000 requests of one exchange (1.8 KB):"
tokio $W/capture.jsonl lines

# The machine code of the encoder, for reading.
objdump -d --no-show-raw-insn -C $R | awk '/^[0-9a-f]+ <gzhot::enc::scan::<12, true, false>>:/{p=1} p&&/^$/{exit} p' > $OUT/scan_12_emit.s
echo
echo "the one-pass encoder for 1 to 4 KiB: $(wc -l < $OUT/scan_12_emit.s) instructions (scan_12_emit.s)"
