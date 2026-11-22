#!/usr/bin/env python3
"""Sets of payloads of 9 to 30 KB, as [u32 length][bytes] records.

    midsets.py <requests.bin> <out dir> <file of source text> <a binary file>

Arrays of the 3.7 KB synthetic requests cut to 9, 16 and 30 KB, and source
text and machine code in pieces of 9, 12 and 24 KB.
"""
import struct, sys

def records(path):
    d = open(path, "rb").read()
    out, off = [], 0
    while off + 4 <= len(d):
        n = struct.unpack_from("<I", d, off)[0]
        out.append(d[off + 4:off + 4 + n])
        off += 4 + n
    return out

def write(path, payloads):
    with open(path, "wb") as f:
        for p in payloads:
            f.write(struct.pack("<I", len(p)) + p)

recs = records(sys.argv[1])
out = sys.argv[2]
for k, size, name in ((3, 9000, "9k"), (5, 16000, "16k"), (9, 30000, "30k")):
    write(f"{out}/json_{name}.bin",
          [(b"[" + b",".join(recs[i:i + k]) + b"]")[:size] for i in range(0, len(recs) - k + 1, k)])
text = open(sys.argv[3], "rb").read()
code = open(sys.argv[4], "rb").read()
code = code[len(code) // 4:]
cut = lambda d, n, most: [d[i:i + n] for i in range(0, min(len(d), most * n) - n + 1, n)]
for n, name in ((9000, "9k"), (12000, "12k"), (24000, "24k")):
    write(f"{out}/text_{name}.bin", cut(text, n, 40))
    write(f"{out}/code_{name}.bin", cut(code, n, 40))
