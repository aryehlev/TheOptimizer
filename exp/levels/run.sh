#!/bin/sh
# fastgzip with levels 1 to 9 (fastgzip/), on this machine: that every level
# is correct, and what each takes and gives next to the same level of
# unmodified libdeflate.
#
#   fastgzip/   level 0 is the encoder as published; levels 1 to 9 search a
#               payload the way libdeflate does at that level
#   before/     the same as it was measured before payloads above 32 KiB got
#               searches of their own
#   cmp/        the comparison: every level on every set, both encoders, the
#               best of ROUNDS passes; it also checks that every output
#               decodes, that the fast and the plain form of each search
#               write the same bytes, and that level 0 writes what the
#               published encoder writes
#   ab/         fastgzip/, before/ and libdeflate, their passes interleaved
#   prof/       where the time goes: one encoder at one level, sampled
#
#   PAYLOADS, ROUNDS, BIG_ROUNDS  less work, for trying the script out
#   EXP=1       only the timings against the encoder as it was, without the
#               tests (for trying a change out)
set -e
PAYLOADS=${PAYLOADS:-20000}   # per stress run
ROUNDS=${ROUNDS:-40}          # passes over each set
BIG_ROUNDS=${BIG_ROUNDS:-12}  # and over each set of payloads above 32 KiB
cd "$(dirname "$0")"
HERE=$(pwd)
ROOT=$(cd ../.. && pwd)
SRC=${REAL_SRC:-/tmp/realsrc}
W=/tmp/levelswork
rm -rf $W && mkdir -p $W $SRC
echo "machine: $(uname -m), $(nproc) CPUs, $(lscpu 2>/dev/null | sed -n 's/^Model name: *//p' | head -1)"
lscpu 2>/dev/null | grep -E "L1d|L2|L3" | sed 's/^/  /'
echo "$(rustc --version)"

# Correct?
if [ -z "$EXP" ]; then
cd $HERE/fastgzip
count() { grep 'test result' | awk '{p+=$4; f+=$6} END {print p " passed, " f " failed"}'; }
echo
echo "tests, debug build:    $(cargo test 2>&1 | count)"
echo "tests, checked build:  $(cargo test --profile checked 2>&1 | count)"
cargo build --profile checked --example stress > /dev/null 2>&1
for level in 0 1 2 3 4; do
  LEVEL=$level ./target/checked/examples/stress 1$level $PAYLOADS $W/dump$level.bin > $W/stress$level.txt 2>&1 &
done
wait
for level in 5 6 7 8 9; do
  LEVEL=$level ./target/checked/examples/stress 1$level $PAYLOADS $W/dump$level.bin > $W/stress$level.txt 2>&1 &
done
wait
cat $W/stress?.txt | sed 's/^/stress, checked build: /'
for level in 1 5 9; do
  python3 -I tools/check_dump.py $W/dump$level.bin --gzip 500 | sed "s/^.*dump$level.bin: /other decoders, level $level: /"
done
rm -f $W/dump?.bin
fi

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

# Payloads above 32 KiB: arrays of 12, 24 and 100 of the requests (45, 90
# and 375 KB); source text (libdeflate's and this repository's) and machine
# code (the Python interpreter of this machine) in pieces of 200 KB; and
# payloads that are text, then machine code, then requests.
mkdir -p $W/big
{ find "$ROOT/gzlocal/vendor/stock" -name '*.[ch]' | sort | xargs cat
  find "$ROOT/exp" "$ROOT/gzlocal/src" -name '*.rs' -not -path '*/target/*' | sort | xargs cat; } > $W/big/text.src
python3 -I "$HERE/tools/bigsets.py" $W/rtb_single.bin $W/big $W/big/text.src "$(readlink -f "$(command -v python3)")"
rm $W/big/text.src

CPU=$(( $(nproc) - 1 ))
if [ -n "$EXP" ]; then
  # Only the levels as they are now and as they were, each as a share of
  # libdeflate's time (now/before), passes interleaved; twice.
  S="$W/capture.bin $W/rtb_single.bin $W/rtb_5k.bin $W/rtb_x3.bin $W/rtb_x6.bin"
  B="$W/big/req_x12.bin $W/big/req_x24.bin $W/big/req_x100.bin $W/big/text_200k.bin $W/big/code_200k.bin $W/big/mixed_210k.bin"
  cd $HERE/ab
  cargo build --release > /dev/null 2>&1
  for pass in 1 2; do
    echo
    echo "now/before as shares of libdeflate's time, and the size next to libdeflate's (run $pass):"
    LEVELS=1,2,5 taskset -c $CPU ./target/release/ab $ROUNDS $W/rtb_single.bin $W/rtb_x6.bin
    LEVELS=1,2,3,4,5,7 taskset -c $CPU ./target/release/ab $BIG_ROUNDS $B
  done
  exit 0
fi

# Every level on every set, on one thread with nothing else between the
# calls.  Twice, to show what a difference between two runs of the same code
# looks like.
cd $HERE/cmp
cargo build --release > /dev/null 2>&1
SETS="$W/rtb_cut500.bin $W/mixed_exchange.bin $W/capture.bin $W/rtb_single.bin $W/rtb_5k.bin $W/rtb_x3.bin $W/rtb_x6.bin"
BIG="$W/big/req_x12.bin $W/big/req_x24.bin $W/big/req_x100.bin $W/big/text_200k.bin $W/big/code_200k.bin $W/big/mixed_210k.bin"
for pass in 1 2; do
  echo
  echo "every level, the best of $ROUNDS passes (run $pass):"
  taskset -c $CPU ./target/release/cmp $ROUNDS $SETS
  echo
  echo "payloads above 32 KiB, every level, the best of $BIG_ROUNDS passes (run $pass):"
  taskset -c $CPU ./target/release/cmp $BIG_ROUNDS $BIG
done

# The levels as they are now and as they were, each as a share of
# libdeflate's time at the same level (now/before), passes interleaved.
cd $HERE/ab
cargo build --release > /dev/null 2>&1
echo
echo "now/before, as shares of libdeflate's time, the best of $ROUNDS passes:"
taskset -c $CPU ./target/release/ab $ROUNDS $SETS
echo
echo "payloads above 32 KiB, now/before, the best of $BIG_ROUNDS passes:"
taskset -c $CPU ./target/release/ab $BIG_ROUNDS $BIG

# Where the time goes above 32 KiB: both encoders, by function, at a level
# of each kind of search.
cd $HERE/prof
cargo build --release > /dev/null 2>&1
echo
echo "where the time goes (share of samples by function):"
for set in req_x24 text_200k; do
  for level in 1 2 5 9; do
    for enc in ld fg; do
      taskset -c $CPU ./target/release/prof $enc $level 3 $W/big/$set.bin $W/prof.out 2>&1 | sed "s/^/$set: /"
      python3 -I "$HERE/tools/where.py" target/release/prof $W/prof.out 0 | sed -n '2,7p'
    done
  done
done
