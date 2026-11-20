#!/bin/sh
# The single-thread harness with cold caches: before every call, 0, 4 MiB or
# 64 MiB of other memory is walked.  Median microseconds per call, lowest of
# the rounds.
set -e
cd "$(dirname "$0")"
ARCH=$( [ "$(uname -m)" = aarch64 ] && echo arm || echo x86 )
mkdir -p bin
build() {
  name=$1; tree=$2; shift 2
  gcc -O2 -DNDEBUG -std=gnu11 -I"$tree" "$@" -o bin/$name sbench.c "$tree"/lib/*.c "$tree"/lib/$ARCH/*.c
}
build stock ../gzlocal/vendor/stock
build patched ../gzlocal/vendor/patched -DHAVE_SESSION -DHAVE_SEARCH_API
python3 ../gzlocal/bench/rtbgen.py /tmp/exp_rtb 400 6 > /dev/null
F=/tmp/exp_rtb_single.bin
# name:binary:session:one_candidate:table_order (-: the default)
V="stock:stock:0:0:- sessions_off:patched:0:0:- codes:patched:2:0:- codes_128K_as_in_0.3:patched:2:0:15 fast:patched:2:1:- fast_8K:patched:2:1:11 fast_16K:patched:2:1:12 fast_32K:patched:2:1:13"
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
      if [ "$order" = "-" ]; then SB_PASSES=$passes SB_SEEDS=$one taskset -c $CPU bin/$bin 1 $sess $tb $F >> /tmp/cold_$name.txt
      else SB_PASSES=$passes SB_SEEDS=$one SB_ORDER=$order taskset -c $CPU bin/$bin 1 $sess $tb $F >> /tmp/cold_$name.txt; fi
    done
  done
  base_t=$(sort -n /tmp/cold_stock.txt | head -1 | awk '{print $1}'); base_b=$(head -1 /tmp/cold_stock.txt | awk '{print $2}')
  echo "other memory walked before each call: $((tb / 1024)) KiB"
  for v in $V; do
    name=${v%%:*}
    sort -n /tmp/cold_$name.txt | awk -v n=$name -v bt=$base_t -v bb=$base_b '{a[NR]=$1; b=$2} END {printf "  %-24s %7.2f us  %5.1f%% of stock   output %+.2f%%\n", n, a[1], a[1]*100/bt, (b-bb)*100/bb}'
  done
done
