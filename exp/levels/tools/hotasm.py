#!/usr/bin/env python3
"""The instructions a function executed most, from a callgrind profile taken
with --dump-instr=yes of a program linked at fixed addresses.

    hotasm.py <callgrind.out> <binary> <symbol substring> [min share %]

For every function whose name contains the substring: its disassembly with,
on each instruction, how many times it ran; runs of instructions below the
share (of the function's total) are folded into '...'.
"""
import collections, re, subprocess, sys

prof, binary, want = sys.argv[1:4]
floor = float(sys.argv[4]) if len(sys.argv) > 4 else 0.3

counts = collections.Counter()
addr = 0
with open(prof) as f:
    body = False
    for line in f:
        if line.startswith("events:"):
            body = True
            continue
        if not body:
            continue
        if line.startswith("calls="):
            next(f, None)  # the line after it is the call's inclusive cost
            continue
        m = re.match(r"^(0x[0-9a-f]+|[+-]\d+|\*) (\S+) (\d+)", line)
        if not m:
            continue
        a = m.group(1)
        if a.startswith("0x"):
            addr = int(a, 16)
        elif a != "*":
            addr += int(a)
        counts[addr] += int(m.group(3))

dis = subprocess.run(["objdump", "-d", "--no-show-raw-insn", binary], capture_output=True, text=True).stdout
funcs, cur = [], None
for line in dis.splitlines():
    m = re.match(r"^([0-9a-f]+) <(.*)>:$", line)
    if m:
        cur = (m.group(2), []) if want in m.group(2) else None
        if cur:
            funcs.append(cur)
        continue
    if cur:
        m = re.match(r"^\s*([0-9a-f]+):\s+(.*)$", line)
        if m:
            a = int(m.group(1), 16)
            cur[1].append((a, counts.get(a, 0), m.group(2)))
for name, rows in funcs:
    total = sum(c for _, c, _ in rows)
    if not total:
        continue
    print(f"{name}: {total:,} instructions run")
    gap = False
    for a, c, text in rows:
        if 100.0 * c / total >= floor:
            print(f"{c:12,} {a:8x}  {text[:70]}")
            gap = False
        elif not gap:
            print("             ...")
            gap = True
