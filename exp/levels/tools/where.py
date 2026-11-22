#!/usr/bin/env python3
"""Turns the addresses `prof` sampled into where the time went.

    where.py <binary> <samples.out> [lines]

Prints the share of samples by function, and for the code that has line
numbers the share by the innermost source line (file:line of the inlined
function the address belongs to) with the function it was inlined into.
"""
import collections, subprocess, sys

binary, path = sys.argv[1:3]
top = int(sys.argv[3]) if len(sys.argv) > 3 else 25
count = collections.Counter(l.strip() for l in open(path) if l.strip())
total = sum(count.values())
# addr2line -a -i: for each address its own line, then (function, file:line)
# pairs, innermost first.
out = subprocess.run(["addr2line", "-e", binary, "-a", "-f", "-i", "-C"] + ["0x" + a for a in count],
                     capture_output=True, text=True).stdout.splitlines()
frames, cur = {}, None
i = 0
while i < len(out):
    line = out[i]
    if line.startswith("0x") and " " not in line:
        cur = frames.setdefault(int(line, 16), [])
        i += 1
    else:
        cur.append((line, out[i + 1] if i + 1 < len(out) else "?"))
        i += 2

short = lambda f: f.split("::<")[0].split("(")[0][-46:]
by_fn, by_line = collections.Counter(), collections.Counter()
for addr, c in count.items():
    fr = frames.get(int(addr, 16))
    if not fr:
        by_fn["?"] += c
        continue
    outer = short(fr[-1][0])
    by_fn[outer] += c
    at = "/".join(fr[0][1].split(" ")[0].split("/")[-2:])
    by_line[(outer, at)] += c
print(f"{total} samples")
for fn, c in by_fn.most_common(12):
    print(f"  {100 * c / total:5.1f}%  {fn}")
if top:
    print("by line:")
    for (fn, at), c in by_line.most_common(top):
        print(f"  {100 * c / total:5.1f}%  {at:38} in {fn}")
