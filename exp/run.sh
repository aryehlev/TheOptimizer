#!/bin/sh
# Experiments: builds the single-thread harness against several variants of the
# level 1 encoder and times them on the same payloads, interleaved, pinned to
# one CPU.  Prints, per variant: lowest and median microseconds per call over
# the rounds, output bytes, output against stock, time against stock.
set -e
cd "$(dirname "$0")"
ARCH=$( [ "$(uname -m)" = aarch64 ] && echo arm || echo x86 )
mkdir -p bin
build() {
  name=$1; tree=$2; shift 2
  gcc -O2 -DNDEBUG -std=gnu11 -I"$tree" "$@" -o bin/$name sbench.c "$tree"/lib/*.c "$tree"/lib/$ARCH/*.c
}
S="-DHAVE_SESSION -DHAVE_SEARCH_API"
H5="$S -DSESS_HASH_BYTES=5"
build stock ../gzlocal/vendor/stock
build v1 ../gzlocal/vendor/patched -DHAVE_SESSION
B="$H5 -DSESS_INSERT_FIRST=2"
build f2 sess9 $B
build f2_t32 sess9 $B -DSESS_TOKEN_CHECK=32
build f2_t64 sess9 $B -DSESS_TOKEN_CHECK=64
build f2_t0 sess9 $B -DSESS_TOKEN_CHECK=0
build f3_t32 sess9 $H5 -DSESS_INSERT_FIRST=3 -DSESS_TOKEN_CHECK=32
build f2_t32_nc sess9 $B -DSESS_TOKEN_CHECK=32 -DSESS_SINGLE_NOCLEAR
build f2_t32_np sess9 $B -DSESS_TOKEN_CHECK=32 -DSESS_NO_PREFETCH
build f2_t32_nc_np sess9 $B -DSESS_TOKEN_CHECK=32 -DSESS_SINGLE_NOCLEAR -DSESS_NO_PREFETCH
python3 ../gzlocal/bench/rtbgen.py /tmp/exp_rtb 400 6 > /dev/null
F=/tmp/exp_rtb_single.bin
# name:binary:session:one_candidate:table_order
V="stock:stock:0:0:15 v1_two_candidates:v1:2:0:15 first2_token16:f2:2:1:15 first2_token32:f2_t32:2:1:15 first2_token64:f2_t64:2:1:15 first2_no_token_skip:f2_t0:2:1:15 first3_token32:f3_t32:2:1:15 first2_token32_noclear:f2_t32_nc:2:1:15 first2_token32_noprefetch:f2_t32_np:2:1:15 first2_token32_noclear_noprefetch:f2_t32_nc_np:2:1:15"
rm -f /tmp/exp_*.txt
CPU=$(( $(nproc) - 1 ))
for round in 1 2 3 4 5 6 7 8 9 10 11; do
  for v in $V; do
    name=$(echo $v | cut -d: -f1); bin=$(echo $v | cut -d: -f2); sess=$(echo $v | cut -d: -f3); one=$(echo $v | cut -d: -f4); order=$(echo $v | cut -d: -f5)
    SB_SEEDS=$one SB_ORDER=$order taskset -c $CPU bin/$bin 1 $sess 0 $F >> /tmp/exp_$name.txt
  done
done
base_t=$(sort -n /tmp/exp_stock.txt | head -1 | awk '{print $1}'); base_b=$(head -1 /tmp/exp_stock.txt | awk '{print $2}')
echo "machine: $(uname -m), $(lscpu 2>/dev/null | sed -n 's/^Model name: *//p' | head -1); payloads: $F"
printf "%-36s %8s %8s %9s %8s %7s\n" variant min_us med_us bytes size time
for v in $V; do
  name=${v%%:*}
  sort -n /tmp/exp_$name.txt | awk -v n=$name -v bt=$base_t -v bb=$base_b '{a[NR]=$1; b=$2} END {printf "%-36s %8.2f %8.2f %9d %+7.2f%% %6.1f%%\n", n, a[1], a[int((NR+1)/2)], b, (b-bb)*100/bb, a[1]*100/bt}'
done
