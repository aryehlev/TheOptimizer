"""find_bidrequests.py <directory to search> <output.jsonl>

Collects every JSON object under the directory that has the shape of an OpenRTB
bid request (an "id", an "imp" list of objects, and a site, app, device or
user), wherever it sits: a file of its own, a value inside a larger JSON
document (test fixtures keep the outgoing request under a key), a JSON string,
one line of a log, or a fenced block of a Markdown file.  Each is written once,
as compact JSON on one line, the way a server sends it.

Only parses; nothing found is executed.  Run with python3 -I.
"""
import json
import os
import re
import sys

MAX_FILE = 8 << 20
TEXT_EXT = {".json", ".md", ".txt", ".js", ".jsonl", ".log", ".yaml", ".yml", ".sample", ".golden", ".conf", ""}


def looks_like_bid_request(v):
    if not isinstance(v, dict):
        return False
    imp = v.get("imp")
    if not (isinstance(imp, list) and imp and all(isinstance(i, dict) for i in imp)):
        return False
    if "id" not in v:
        return False
    return any(isinstance(v.get(k), dict) for k in ("site", "app", "device", "user", "dooh"))


def walk(v, found, depth=0):
    if depth > 40:
        return
    if isinstance(v, dict):
        if looks_like_bid_request(v):
            found.append(v)
            return
        for x in v.values():
            walk(x, found, depth + 1)
    elif isinstance(v, list):
        for x in v:
            walk(x, found, depth + 1)
    elif isinstance(v, str) and len(v) > 40 and '"imp"' in v:
        s = v.strip()
        if s.startswith("{"):
            try:
                walk(json.loads(s), found, depth + 1)
            except ValueError:
                pass


def objects_in_text(text):
    """Every top-level {...} of the text that parses as JSON."""
    dec = json.JSONDecoder()
    i = 0
    n = len(text)
    while True:
        i = text.find("{", i)
        if i < 0 or i >= n:
            return
        try:
            v, end = dec.raw_decode(text, i)
        except ValueError:
            i += 1
            continue
        yield v
        i = end


def main():
    root, out_path = sys.argv[1], sys.argv[2]
    seen = set()
    out = []
    files = 0
    for dirpath, dirnames, filenames in os.walk(root):
        dirnames[:] = sorted(d for d in dirnames if d not in (".git", "node_modules"))
        for name in sorted(filenames):
            path = os.path.join(dirpath, name)
            ext = os.path.splitext(name)[1].lower()
            if ext not in TEXT_EXT or os.path.islink(path):
                continue
            try:
                if os.path.getsize(path) > MAX_FILE:
                    continue
                data = open(path, "rb").read()
            except OSError:
                continue
            if b'"imp"' not in data and b'\\"imp\\"' not in data:
                continue
            try:
                text = data.decode("utf-8")
            except UnicodeDecodeError:
                text = data.decode("latin-1")
            files += 1
            found = []
            try:
                walk(json.loads(text), found)
            except ValueError:
                for v in objects_in_text(text):
                    walk(v, found)
            for v in found:
                line = json.dumps(v, separators=(",", ":"), ensure_ascii=False)
                if "\n" in line or "\r" in line:
                    continue
                if line in seen:
                    continue
                seen.add(line)
                out.append((os.path.relpath(path, root), line))
    with open(out_path, "w", encoding="utf-8") as f:
        for _, line in out:
            f.write(line + "\n")
    with open(out_path + ".sources", "w", encoding="utf-8") as f:
        for path, line in out:
            f.write("%d\t%s\n" % (len(line.encode("utf-8")), path))
    sizes = sorted(len(l.encode("utf-8")) for _, l in out)
    if sizes:
        print("%-48s %5d requests from %4d files; bytes: median %5d, 90%% %5d, max %6d; at least 1 KiB: %d, 2 KiB: %d" % (
            os.path.basename(root.rstrip("/")), len(sizes), files, sizes[len(sizes) // 2],
            sizes[len(sizes) * 9 // 10], sizes[-1], sum(1 for s in sizes if s >= 1024), sum(1 for s in sizes if s >= 2048)))
    else:
        print("%-48s none (%d files mention imp)" % (os.path.basename(root.rstrip("/")), files))


main()
