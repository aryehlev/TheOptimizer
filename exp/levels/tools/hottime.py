#!/usr/bin/env python3
"""Where the samples of `prof` fall in one function, instruction by
instruction.

    hottime.py <binary> <samples.out> <symbol substring> [min share % of all samples]
"""
import collections, re, subprocess, sys

binary, path, want = sys.argv[1:4]
floor = float(sys.argv[4]) if len(sys.argv) > 4 else 0.4
pcs = collections.Counter(int(l, 16) for l in open(path) if l.strip())
total = sum(pcs.values())
dis = subprocess.run(["objdump", "-d", "--no-show-raw-insn", "-M", "intel", binary],
                     capture_output=True, text=True).stdout
on, rows = False, []
for line in dis.splitlines():
    m = re.match(r"^([0-9a-f]+) <(.*)>:$", line)
    if m:
        on = want in m.group(2)
        continue
    if on:
        m = re.match(r"^\s*([0-9a-f]+):\s+(.*)$", line)
        if m:
            a = int(m.group(1), 16)
            rows.append((a, pcs.get(a, 0), m.group(2)))
inside = sum(c for _, c, _ in rows)
print(f"{want}: {100 * inside / total:.1f}% of {total} samples")
# show every instruction of a run of instructions in which any is hot
hot = [i for i, (_, c, _) in enumerate(rows) if 100 * c / total >= floor]
show = set()
for i in hot:
    show.update(range(max(0, i - 6), min(len(rows), i + 3)))
last = -2
for i in sorted(show):
    if i != last + 1:
        print("        ...")
    a, c, text = rows[i]
    print(f"{100 * c / total:6.2f}% {a:8x}  {text[:80]}")
    last = i
