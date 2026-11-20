#!/bin/sh
# The single-thread harness: the level 1 encoders of gzlocal/vendor on the same
# payloads, interleaved, pinned to one CPU.  Prints, per encoder: lowest and
# median microseconds per call over the rounds, output bytes, output against
# stock, time against stock.
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
V="stock:stock:0:0:- sessions_off:patched:0:0:- codes:patched:2:0:- codes_128K_as_in_0.3:patched:2:0:15 fast:patched:2:1:- fast_16K:patched:2:1:12 fast_32K:patched:2:1:13"
rm -f /tmp/exp_*.txt
CPU=$(( $(nproc) - 1 ))
for round in 1 2 3 4 5 6 7 8 9 10 11; do
  for v in $V; do
    name=$(echo $v | cut -d: -f1); bin=$(echo $v | cut -d: -f2); sess=$(echo $v | cut -d: -f3); one=$(echo $v | cut -d: -f4); order=$(echo $v | cut -d: -f5)
    if [ "$order" = "-" ]; then SB_SEEDS=$one taskset -c $CPU bin/$bin 1 $sess 0 $F >> /tmp/exp_$name.txt
    else SB_SEEDS=$one SB_ORDER=$order taskset -c $CPU bin/$bin 1 $sess 0 $F >> /tmp/exp_$name.txt; fi
  done
done
base_t=$(sort -n /tmp/exp_stock.txt | head -1 | awk '{print $1}'); base_b=$(head -1 /tmp/exp_stock.txt | awk '{print $2}')
echo "machine: $(uname -m), $(lscpu 2>/dev/null | sed -n 's/^Model name: *//p' | head -1); payloads: $F"
printf "%-38s %8s %8s %9s %8s %7s\n" encoder min_us med_us bytes size time
for v in $V; do
  name=${v%%:*}
  sort -n /tmp/exp_$name.txt | awk -v n=$name -v bt=$base_t -v bb=$base_b '{a[NR]=$1; b=$2} END {printf "%-38s %8.2f %8.2f %9d %+7.2f%% %6.1f%%\n", n, a[1], a[int((NR+1)/2)], b, (b-bb)*100/bb, a[1]*100/bt}'
done
