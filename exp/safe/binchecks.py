#!/usr/bin/env python3
"""Finds the checks in the compiled code of a crate as cargo built it: the
conditional jumps that lead to a call of a panic function, per function.
Reads the object files inside the .rlib, where a call still names its target.
usage: binchecks.py <path to lib*.rlib> [name filter]"""
import re, subprocess, sys, tempfile, os, glob
from collections import Counter
rlib = sys.argv[1]
flt = sys.argv[2] if len(sys.argv) > 2 else ''
tmp = tempfile.mkdtemp()
subprocess.run(['ar', 'x', os.path.abspath(rlib)], cwd=tmp, check=True)
objs = sorted(glob.glob(os.path.join(tmp, '*.o')))
print(f'{os.path.basename(rlib)}: {len(objs)} object file(s)')
PANIC = re.compile(r'panic|slice_index_fail|_fail\b|unwrap_failed|expect_failed')
JCC = re.compile(r'^(j[a-z]+|b\.[a-z]+|cbz|cbnz|tbz|tbnz)\s+(?:[^,]*,\s*)*([0-9a-f]+)\b')
END = re.compile(r'^(jmp|ret|ud2|brk|udf|b|br)\b')
for obj in objs:
    out = subprocess.run(['objdump', '-d', '-r', '--no-show-raw-insn', '-C', obj], capture_output=True, text=True).stdout
    funcs, cur = {}, None
    for l in out.split('\n'):
        m = re.match(r'[0-9a-f]+ <(.*)>:$', l)
        if m:
            cur = m.group(1); funcs[cur] = []
            continue
        m = re.match(r'\s+([0-9a-f]+):\s+(R_\S+)\s+(.*)', l)
        if m and cur is not None and funcs[cur]:
            a, t, r = funcs[cur][-1]
            funcs[cur][-1] = (a, t, r + ' ' + m.group(3))
            continue
        m = re.match(r'\s+([0-9a-f]+):\s+(\S.*)', l)
        if m and cur is not None:
            funcs[cur].append((int(m.group(1), 16), m.group(2).strip(), ''))
    for name, ins in funcs.items():
        if flt not in name: continue
        if not re.search(r'::(scan|emit_seqs|compress|block|large|chunk|two_pass)\b', name): continue
        idx = {a: i for i, (a, t, r) in enumerate(ins)}
        def leads_to_panic(a):
            i = idx.get(a)
            if i is None: return False
            for k in range(i, min(i + 12, len(ins))):
                t, r = ins[k][1], ins[k][2]
                if re.match(r'(call|bl)\b', t):
                    return bool(PANIC.search(r) or PANIC.search(t))
                if END.match(t) or JCC.match(t): return False
            return False
        n_calls = sum(1 for a, t, r in ins if re.match(r'(call|bl)\b', t) and (PANIC.search(r) or PANIC.search(t)))
        checks = []
        for i, (a, t, r) in enumerate(ins):
            mm = JCC.match(t)
            if mm and leads_to_panic(int(mm.group(2), 16)):
                checks.append((re.sub(r'\s+', ' ', ins[i - 1][1])[:46] if i else '', mm.group(1)))
        print(f'  {name[:74]}: {len(ins)} instructions, {n_calls} panic calls, {len(checks)} checks')
        for (c, j), k in Counter(checks).most_common():
            print(f'        {k} x  {c:48} {j}')
