#!/bin/sh
# Experiment: how the fast encoder behaves when its tables are not in the
# caches.  Table sizes from 128 KiB down to 4 KiB, with the candidate test as
# two branches or as one, after walking 0, 4 MiB or 64 MiB of other memory
# before every call.  Median microseconds per call, lowest of the rounds.
set -e
cd "$(dirname "$0")"
ARCH=$( [ "$(uname -m)" = aarch64 ] && echo arm || echo x86 )
mkdir -p bin
build() {
  name=$1; tree=$2; shift 2
  gcc -O2 -DNDEBUG -std=gnu11 -I"$tree" "$@" -o bin/$name sbench.c "$tree"/lib/*.c "$tree"/lib/$ARCH/*.c
}
S="-DHAVE_SESSION -DHAVE_SEARCH_API"
build stock ../gzlocal/vendor/stock
build patched ../gzlocal/vendor/patched $S
for o in 10 11 12 13; do
  build two$o sess_exp $S -DSESS_SMALL_ORDER=$o
  build one$o sess_exp $S -DSESS_SMALL_ORDER=$o -DSESS_BRANCHLESS_FENCE
done
python3 ../gzlocal/bench/rtbgen.py /tmp/exp_rtb 400 6 > /dev/null
F=/tmp/exp_rtb_single.bin
# name:binary:session:one_candidate:table_order (13 selects the small table of the binary)
V="stock:stock:0:0:15 codes:patched:2:0:15 fast_128K_two_branches:patched:2:1:15 fast_128K_one_branch:one13:2:1:15 fast_32K_two_branches:two13:2:1:13 fast_32K_one_branch:one13:2:1:13 fast_16K_two_branches:two12:2:1:13 fast_16K_one_branch:one12:2:1:13 fast_8K_two_branches:two11:2:1:13 fast_8K_one_branch:one11:2:1:13 fast_4K_one_branch:one10:2:1:13"
CPU=$(( $(nproc) - 1 ))
echo "machine: $(uname -m), $(lscpu 2>/dev/null | sed -n 's/^Model name: *//p' | head -1)"
for tb in 0 4194304 67108864; do
  rm -f /tmp/cold_*.txt
  rounds="1 2 3 4 5"; passes=5
  if [ $tb = 67108864 ]; then rounds="1 2 3"; passes=1; fi
  if [ $tb = 0 ]; then passes=15; fi
  for round in $rounds; do
    for v in $V; do
      name=$(echo $v | cut -d: -f1); bin=$(echo $v | cut -d: -f2); sess=$(echo $v | cut -d: -f3); one=$(echo $v | cut -d: -f4); order=$(echo $v | cut -d: -f5)
      SB_PASSES=$passes SB_SEEDS=$one SB_ORDER=$order taskset -c $CPU bin/$bin 1 $sess $tb $F >> /tmp/cold_$name.txt
    done
  done
  base_t=$(sort -n /tmp/cold_stock.txt | head -1 | awk '{print $1}')
  echo "other memory walked before each call: $((tb / 1024)) KiB"
  for v in $V; do
    name=${v%%:*}
    sort -n /tmp/cold_$name.txt | awk -v n=$name -v bt=$base_t '{a[NR]=$1; b=$2; c=$3} END {printf "  %-26s %7.2f us  %5.1f%% of stock   %d B in %d calls\n", n, a[1], a[1]*100/bt, b, c}'
  done
done
