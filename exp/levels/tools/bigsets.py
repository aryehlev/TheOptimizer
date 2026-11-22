#!/usr/bin/env python3
"""Sets of payloads above 32 KiB, as [u32 length][bytes] records.

    bigsets.py <requests.bin> <out dir> [<file of C source> <a binary file>]

From the 3.7 KB synthetic requests: arrays of 12, 24 and 100 of them (45, 90
and 375 KB).  With the two files: source text and machine code in pieces of
200 KB, and payloads that change kind in the middle (text, then machine code,
then requests), which is where a block is worth ending early.
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
for k in (12, 24, 100):
    write(f"{out}/req_x{k}.bin",
          [b"[" + b",".join(recs[i:i + k]) + b"]" for i in range(0, len(recs) - k + 1, k)])
if len(sys.argv) > 4:
    text = open(sys.argv[3], "rb").read()
    code = open(sys.argv[4], "rb").read()
    cut = lambda d, n, most: [d[i:i + n] for i in range(0, min(len(d), most * n) - n + 1, n)]
    write(f"{out}/text_200k.bin", cut(text, 200_000, 6))
    write(f"{out}/code_200k.bin", cut(code[len(code) // 4:], 200_000, 6))
    reqs = b",".join(recs)
    mixed = [text[i * 70_000:(i + 1) * 70_000] + code[(i + 3) * 60_000:(i + 4) * 60_000]
             + reqs[i * 80_000:(i + 1) * 80_000] for i in range(6)]
    write(f"{out}/mixed_210k.bin", mixed)
