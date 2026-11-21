#!/bin/sh
# The encoder with no unsafe code (fastgzip-safe/) against the one it was made
# from (fastgzip/), on this machine: that it is correct, that it writes the
# same bytes, which checks are left in its machine code, and what it costs.
#
#   fastgzip/          the encoder as published
#   fastgzip-u2/       the same with the safe version's way of ending a long
#                      match, to tell that change from the cost of the checks
#   fastgzip-safe/     #![forbid(unsafe_code)]: input and output in arrays of
#                      a fixed length, so that no access in a loop is checked.
#                      Its feature `prefetch` adds the one thing that takes an
#                      unsafe block: asking for the encoder's machine code
#                      ahead of its use, on arm64.
#   fastgzip-safe-s1/  the first attempt: output through a slice, one check
#                      per 8-byte store
#
#   OUT=<dir>       where the listings of machine code go
#   REAL_SRC=<dir>  where the repositories with sample requests are checked out
#   PAYLOADS, ROUNDS, RUNS  less work, for trying the script out
set -e
PAYLOADS=${PAYLOADS:-50000}   # per stress run and per identity run
ROUNDS=${ROUNDS:-40}          # passes over each set, one thread
RUNS=${RUNS:-5}               # runs per cell of the tokio tables
cd "$(dirname "$0")"
HERE=$(pwd)
ROOT=$(cd ../.. && pwd)
OUT=${OUT:-$ROOT/out}
SRC=${REAL_SRC:-/tmp/realsrc}
W=/tmp/safework
rm -rf $W && mkdir -p $W $SRC $OUT
echo "machine: $(uname -m), $(nproc) CPUs, $(lscpu 2>/dev/null | sed -n 's/^Model name: *//p' | head -1)"
lscpu 2>/dev/null | grep -E "L1d|L2|L3" | sed 's/^/  /'
echo "$(rustc --version)"

# Correct?
cd $HERE/fastgzip-safe
count() { grep 'test result' | awk '{p+=$4; f+=$6} END {print p " passed, " f " failed"}'; }
echo
echo "fastgzip-safe builds with unsafe code forbidden: $(cargo build --release 2>&1 | tail -1 | sed 's/^ *//')"
echo "  $(grep -n 'forbid(unsafe_code)' src/lib.rs)"
echo "  with the feature prefetch: $(grep -c 'unsafe {' src/lib.rs) unsafe block, $(grep -c 'asm!' src/lib.rs) instruction in it"
echo "tests, debug build:    $(cargo test 2>&1 | count)"
echo "tests, checked build:  $(cargo test --profile checked 2>&1 | count)"
cargo build --profile checked --example stress > /dev/null 2>&1
for seed in 1 2 3 4; do
  ./target/checked/examples/stress $seed $PAYLOADS $W/dump$seed.bin > $W/stress$seed.txt 2>&1 &
done
wait
cat $W/stress?.txt | sed 's/^/stress, checked build: /'
python3 -I tools/check_dump.py $W/dump1.bin --gzip 1500 | sed 's/^.*dump1.bin: /other decoders: /'
rm -f $W/dump?.bin

# Payloads: the synthetic requests, and the published sample requests.
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
# Other sizes of the same kind: the first 5000 bytes of two requests in an
# array, three and six requests in an array (11 and 22 KB), and the last 500
# bytes of each request.
python3 - $W <<'PY'
import struct, sys
w = sys.argv[1]
d = open(w + "/rtb_single.bin", "rb").read()
recs, off = [], 0
while off + 4 <= len(d):
    n = struct.unpack_from("<I", d, off)[0]
    recs.append(d[off + 4:off + 4 + n])
    off += 4 + n
def arrays(name, k, cut=None):
    with open(w + "/" + name, "wb") as f:
        for i in range(0, len(recs) - k + 1, k):
            b = b"[" + b",".join(recs[i:i + k]) + b"]"
            if cut:
                b = b[:cut]
            f.write(struct.pack("<I", len(b)) + b)
arrays("rtb_5k.bin", 2, 5000)
arrays("rtb_x3.bin", 3)
arrays("rtb_x6.bin", 6)
with open(w + "/rtb_cut500.bin", "wb") as f:
    for r in recs:
        f.write(struct.pack("<I", 500) + r[-500:])
PY

# The same bytes?
echo
cd $HERE/ident
cargo build --release > /dev/null 2>&1
echo "the safe encoder's output against the original's, byte for byte:"
./target/release/ident gen 1 $PAYLOADS | sed 's/^/  /'
./target/release/ident gen 2 $PAYLOADS | sed 's/^/  /'
./target/release/ident file $W/rtb_single.bin $W/rtb_5k.bin $W/capture.bin $W/mixed_exchange.bin $W/rtb_x3.bin $W/rtb_x6.bin $W/rtb_cut500.bin \
  | sed 's/^identical: .*\/\([a-z_0-9]*\.bin\), \([0-9]* payloads\).*/  identical: \1, \2/'

# Which checks are left: the conditional jumps to a panic in the encoder as
# cargo built it for the comparison below.
echo
cd $HERE/rsbench
cargo build --release > /dev/null 2>&1
echo "checks left in the one-pass encoder (4 to 8 KiB), per version:"
for c in fastgzip_safe fastgzip_safe_s1; do
  lib=$(find target -name "lib$c-*.rlib" | head -1)
  if [ -n "$lib" ]; then
    python3 -I $HERE/binchecks.py "$lib" "scan::<13, true, false>" | sed 's/^/  /'
  else
    echo "  $c: no .rlib found under target/"
  fi
done
for c in fastgzip fastgzip_safe; do
  objdump -d --no-show-raw-insn -C target/release/rsbench | awk -v f="$c::enc::scan::<13, true, false>" '$0 ~ "^[0-9a-f]+ <" f ">:" {p=1} p&&/^$/{exit} p' > $OUT/${c}_scan_13_emit.s
  echo "  $c: $(grep -c '^ ' $OUT/${c}_scan_13_emit.s) instructions (${c}_scan_13_emit.s)"
done

# One thread, nothing else between the calls: the best of $ROUNDS passes over
# each set, the encoders taking turns.  Twice, to show what a difference
# between two runs of the same code looks like.
CPU=$(( $(nproc) - 1 ))
SETS="$W/rtb_single.bin $W/rtb_5k.bin $W/capture.bin $W/mixed_exchange.bin $W/rtb_x3.bin $W/rtb_x6.bin $W/rtb_cut500.bin"
for pass in 1 2; do
  echo
  echo "one thread, the best of $ROUNDS passes (run $pass):"
  WHICH=lrs taskset -c $CPU ./target/release/rsbench $ROUNDS $SETS
done

# In tokio: 2 workers, the lowest median of $RUNS runs, at three amounts of other
# work per request.  The original is there twice, as a measure of the noise.
for c in fastgzip fastgzip-safe; do
  (cd $HERE/$c && cargo build --release --examples > /dev/null 2>&1)
done
(cd $HERE/fastgzip-safe && cargo build --release --examples --features prefetch --target-dir target-prefetch > /dev/null 2>&1)
REF=$HERE/fastgzip/target/release/examples/tokio_bench
SAFE=$HERE/fastgzip-safe/target/release/examples/tokio_bench
PRE=$HERE/fastgzip-safe/target-prefetch/release/examples/tokio_bench
row() {
  name=$1; shift
  echo "$name $("$@" | sed -n 's/.*median \([0-9.]*\) us.*out \([0-9.]*\)% of in.*/\1 \2/p')" >> $W/runs
}
tokio() { # file, cut
  for other in 0 4194304 67108864; do
    n=16000
    if [ $other = 67108864 ]; then n=1600; fi
    : > $W/runs
    for run in $(seq $RUNS); do
      row fastgzip $REF $1 $2 $n 2 $other local
      row no_unsafe $SAFE $1 $2 $n 2 $other local
      row no_unsafe_but_prefetch $PRE $1 $2 $n 2 $other local
      row fastgzip_again $REF $1 $2 $n 2 $other local
    done
    echo "  other work per request: walks $((other / 1024)) KiB"
    base=$(grep "^fastgzip " $W/runs | sort -k2 -n | head -1 | awk '{print $2}')
    for v in fastgzip fastgzip_again no_unsafe no_unsafe_but_prefetch; do
      grep "^$v " $W/runs | sort -k2 -n | head -1 | awk -v b=$base '{printf "    %-23s %6.2f us  %5.1f%%   output %s%% of input\n", $1, $2, $2*100/b, $3}'
    done
  done
}
echo
echo "in tokio, 2 workers, 3.7 KB synthetic requests:"
tokio $W/rtb_single.bin 0
echo
echo "in tokio, 2 workers, 5.0 KB (two synthetic requests, cut):"
tokio $W/rtb_5k.bin 0
echo
echo "in tokio, 2 workers, the capture of 1,000 requests of one exchange (1.8 KB):"
tokio $W/capture.jsonl lines
echo
echo "in tokio, 2 workers, 22 KB payloads (six synthetic requests in an array):"
tokio $W/rtb_x6.bin 0
