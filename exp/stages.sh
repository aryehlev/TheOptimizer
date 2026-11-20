#!/bin/sh
# Experiment: which of the patches costs time when no session is used?  Stock
# libdeflate and the tree after each patch, level 1, sessions off, the full
# 128 KiB table for every input and cleared for every input in all of them;
# same payloads, interleaved, pinned to one CPU.
set -e
cd "$(dirname "$0")"
ARCH=$( [ "$(uname -m)" = aarch64 ] && echo arm || echo x86 )
mkdir -p bin
rm -rf /tmp/stg && mkdir /tmp/stg
V="stock"
gcc -O2 -DNDEBUG -std=gnu11 -I../gzlocal/vendor/stock -o bin/stg_stock sbench.c ../gzlocal/vendor/stock/lib/*.c ../gzlocal/vendor/stock/lib/$ARCH/*.c
for n in 3 4 5 6 7 8 9 10; do
  cp -r ../gzlocal/vendor/stock /tmp/stg/s$n
  cp -r stages/s$n/. /tmp/stg/s$n/
  gcc -O2 -DNDEBUG -std=gnu11 -DHT_CLEAR_EVERY_CALL_MAX_ORDER=15 -DHT_T11=0 -DHT_T12=0 -DHT_T13=0 -DHT_T14=0 -I/tmp/stg/s$n -o bin/stg_s$n sbench.c /tmp/stg/s$n/lib/*.c /tmp/stg/s$n/lib/$ARCH/*.c
  V="$V s$n"
done
python3 ../gzlocal/bench/rtbgen.py /tmp/exp_rtb 400 6 > /dev/null
F=/tmp/exp_rtb_single.bin
rm -f /tmp/stg_*.txt
CPU=$(( $(nproc) - 1 ))
for round in 1 2 3 4 5 6 7 8 9 10 11; do
  for v in $V; do taskset -c $CPU bin/stg_$v 1 0 0 $F >> /tmp/stg_$v.txt; done
done
base_t=$(sort -n /tmp/stg_stock.txt | head -1 | awk '{print $1}'); base_b=$(head -1 /tmp/stg_stock.txt | awk '{print $2}')
echo "machine: $(uname -m), $(lscpu 2>/dev/null | sed -n 's/^Model name: *//p' | head -1)"
echo "s3 no-clear + sized table + clear small tables, s4 +sort used symbols, s5 +codewords for used symbols, s6 +precode items, s7 +sessions, s8 +literal run in a register, s9 +token skipping, s10 +one pass (the shipped tree)"
for v in $V; do
  sort -n /tmp/stg_$v.txt | awk -v n=$v -v bt=$base_t -v bb=$base_b '{a[NR]=$1; b=$2} END {printf "  %-6s %7.2f us  %5.1f%% of stock   %s\n", n, a[1], a[1]*100/bt, (b == bb ? "same bytes total" : "DIFFERENT SIZE")}'
done
