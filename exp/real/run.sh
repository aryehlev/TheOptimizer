#!/bin/sh
# Experiment: the encoders on sample bid requests that others have published.
#
# Nobody publishes production bid requests (they carry user data).  What is
# public: sample requests in exchange documentation, in the OpenRTB
# specification and in the test data of open-source bidders and ad servers,
# and one capture of 1,000 requests of one exchange in RTB4FREE's repository
# (each is a short OpenRTB object plus the original protobuf as base64).
# The repositories are downloaded here, at fixed commits; nothing of them is
# kept in this branch.
#
#   REAL_SRC=<dir>  where the repositories are (or will be) checked out
set -e
cd "$(dirname "$0")"
HERE=$(pwd)
ROOT=$(cd ../.. && pwd)
SRC=${REAL_SRC:-/tmp/realsrc}
W=/tmp/realwork
rm -rf $W && mkdir -p $W $SRC
fetch() {
  if [ ! -d "$SRC/$1" ]; then
    git init -q "$SRC/$1"
    git -C "$SRC/$1" fetch -q --depth 1 "https://github.com/$2" "$3"
    git -C "$SRC/$1" checkout -q FETCH_HEAD
  fi
  python3 -I "$HERE/find_bidrequests.py" "$SRC/$1" "$W/$1.jsonl" > /dev/null
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
fetch prebid_prebid-server-java prebid/prebid-server-java 9ac33456c4d57336fdb2514fa15b792fdfb3d20d
fetch prebid_prebid-server prebid/prebid-server 0f7916bfd975b82a185e9677d8196d94b2ea4dcc

echo "machine: $(uname -m), $(lscpu 2>/dev/null | sed -n 's/^Model name: *//p' | head -1)"
python3 -I "$HERE/make_sets.py" $W
python3 "$ROOT/gzlocal/bench/rtbgen.py" $W/rtb 400 6 > /dev/null

ARCH=$( [ "$(uname -m)" = aarch64 ] && echo arm || echo x86 )
P=$ROOT/gzlocal/vendor/patched
S=$ROOT/gzlocal/vendor/stock
mkdir -p $W/bin
gcc -O2 -DNDEBUG -std=gnu11 -I$S -o $W/bin/stock ../sbench.c $S/lib/*.c $S/lib/$ARCH/*.c
gcc -O2 -DNDEBUG -std=gnu11 -I$P -DHAVE_SESSION -DHAVE_SEARCH_API -o $W/bin/patched ../sbench.c $P/lib/*.c $P/lib/$ARCH/*.c
gcc -O2 -DNDEBUG -std=gnu11 -I$P -o $W/bin/persample persample.c $P/lib/*.c $P/lib/$ARCH/*.c

echo
$W/bin/persample $W/samples_1k.bin > $W/persample_real.txt
$W/bin/persample $W/rtb_single.bin > $W/persample_syn.txt
python3 -I "$HERE/summarize.py" $W/persample_real.txt $W/samples_1k.index.json $W/persample_syn.txt

# One compressor per set, the requests in the order of the file, pinned to one
# CPU.  Each run times a single pass, so that the branch predictor has seen a
# set once at most; the figure is the median of the runs.
CPU=$(( $(nproc) - 1 ))
one() { # set, thrash bytes, runs
  for v in stock codes fast; do : > $W/t_$v.txt; done
  i=0
  while [ $i -lt $3 ]; do
    SB_PASSES=1 taskset -c $CPU $W/bin/stock 1 0 $2 $W/$1.bin >> $W/t_stock.txt
    SB_PASSES=1 SB_SEEDS=0 taskset -c $CPU $W/bin/patched 1 2 $2 $W/$1.bin >> $W/t_codes.txt
    SB_PASSES=1 SB_SEEDS=1 taskset -c $CPU $W/bin/patched 1 2 $2 $W/$1.bin >> $W/t_fast.txt
    i=$((i+1))
  done
  bt=$(sort -n $W/t_stock.txt | awk '{a[NR]=$1} END {print a[int((NR+1)/2)]}')
  bb=$(head -1 $W/t_stock.txt | awk '{print $2}')
  for v in stock codes fast; do
    sort -n $W/t_$v.txt | awk -v n=$v -v bt=$bt -v bb=$bb '{a[NR]=$1; b=$2} END {m=a[int((NR+1)/2)]; printf "    %-6s %7.2f us  %5.1f%% of stock   output %+.2f%%\n", n, m, m*100/bt, (b-bb)*100/bb}'
  done
}
for set in capture mixed_exchange mixed_all rtb_single; do
  case $set in
    capture) echo; echo "the capture: 1,000 requests of one kind, one session";;
    mixed_exchange) echo; echo "exchange samples, spec examples and library test data, shuffled: many kinds of request on one session";;
    mixed_all) echo; echo "the same with the Prebid Server test fixtures";;
    rtb_single) echo; echo "for comparison, the synthetic bid requests";;
  esac
  echo "  nothing else between the calls"
  one $set 0 11
  echo "  64 MiB of other memory walked before each call"
  one $set 67108864 3
done

echo
echo "in tokio, the capture (bench/arm.sh):"
RUNS=3 sh "$ROOT/gzlocal/bench/arm.sh" $W/capture.jsonl | grep -v "^tests:\|^machine:"
