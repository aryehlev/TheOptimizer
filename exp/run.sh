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
build v2_h5 sess9 $H5
build v2_h5_i4 sess9 $H5 -DSESS_INSERT_FIRST=4
build v2_h5_i3 sess9 $H5 -DSESS_INSERT_FIRST=3
build v2_h5_i2 sess9 $H5 -DSESS_INSERT_FIRST=2
build v2_h5_i2_t8_16 sess9 $H5 -DSESS_INSERT_FIRST=2 -DSESS_TOKEN_CHECK=8 -DSESS_TOKEN_MIN=16
build v2_h5_i2_t8_24 sess9 $H5 -DSESS_INSERT_FIRST=2 -DSESS_TOKEN_CHECK=8 -DSESS_TOKEN_MIN=24
build v2_h5_i2_t8_32 sess9 $H5 -DSESS_INSERT_FIRST=2 -DSESS_TOKEN_CHECK=8 -DSESS_TOKEN_MIN=32
build v2_h5_i2_t32 sess9 $H5 -DSESS_INSERT_FIRST=2 -DSESS_TOKEN_CHECK=32 -DSESS_TOKEN_MIN=16
python3 ../gzlocal/bench/rtbgen.py /tmp/exp_rtb 400 6 > /dev/null
F=/tmp/exp_rtb_single.bin
# name:binary:session:one_candidate:table_order
V="stock:stock:0:0:15 v1_two_candidates:v1:2:0:15 one_hash5:v2_h5:2:1:15 one_hash5_small_table:v2_h5:2:1:13 one_hash5_first4:v2_h5_i4:2:1:15 one_hash5_first3:v2_h5_i3:2:1:15 one_hash5_first2:v2_h5_i2:2:1:15 one_hash5_first2_small_table:v2_h5_i2:2:1:13 first2_token_8_16:v2_h5_i2_t8_16:2:1:15 first2_token_8_24:v2_h5_i2_t8_24:2:1:15 first2_token_8_32:v2_h5_i2_t8_32:2:1:15 first2_token_32_16:v2_h5_i2_t32:2:1:15"
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
printf "%-30s %8s %8s %9s %8s %7s\n" variant min_us med_us bytes size time
for v in $V; do
  name=${v%%:*}
  sort -n /tmp/exp_$name.txt | awk -v n=$name -v bt=$base_t -v bb=$base_b '{a[NR]=$1; b=$2} END {printf "%-30s %8.2f %8.2f %9d %+7.2f%% %6.1f%%\n", n, a[1], a[int((NR+1)/2)], b, (b-bb)*100/bb, a[1]*100/bt}'
done
