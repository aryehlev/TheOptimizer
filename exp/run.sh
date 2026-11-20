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
  gcc ${OPT:--O2} -DNDEBUG -std=gnu11 -I"$tree" "$@" -o bin/$name sbench.c "$tree"/lib/*.c "$tree"/lib/$ARCH/*.c
}
S="-DHAVE_SESSION -DHAVE_SEARCH_API"
build stock ../gzlocal/vendor/stock
build v1 ../gzlocal/vendor/patched -DHAVE_SESSION
build r10 sess10 $S
build r10_bf sess10 $S -DSESS_BRANCHLESS_FENCE
build r10_f1 sess10 $S -DSESS_INSERT_FIRST=1
build r10_e128 sess10 $S -DSESS_SPARSE_AFTER=128
build r10_bf_e64 sess10 $S -DSESS_BRANCHLESS_FENCE -DSESS_SPARSE_AFTER=64
build r11 sess11 $S
# the compiler's code for the one-pass functions, to read
mkdir -p ../out
for t in sess10 sess11; do
  gcc -O2 -DNDEBUG -std=gnu11 -I$t -S -o - $t/lib/deflate_compress.c | awk '/^deflate_direct:/{p=1} p{print} p&&/size[ \t]+deflate_direct,/{exit}' | grep -v '^[ \t]*\.cfi' > ../out/direct_$t.s
done
python3 ../gzlocal/bench/rtbgen.py /tmp/exp_rtb 400 6 > /dev/null
F=/tmp/exp_rtb_single.bin
# name:binary:session:one_candidate:table_order
V="stock:stock:0:0:15 v1_two_candidates:v1:2:0:15 restructured:r10:2:1:15 one_branch_test:r10_bf:2:1:15 insert_first_1:r10_f1:2:1:15 every_other_after_128:r10_e128:2:1:15 one_branch_test_every_other_after_64:r10_bf_e64:2:1:15 next_word_ahead:r11:2:1:15"
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
