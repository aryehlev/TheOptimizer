"""summarize.py <persample output> <samples_1k.index.json> [<persample output of the synthetic requests>]"""
import json
import sys


def line(name, rows):
    if not rows:
        return
    n = sum(r[0] for r in rows)
    st = sum(r[1] for r in rows)
    co = sum(r[2] for r in rows)
    fa = sum(r[3] for r in rows)
    print("  %-46s %4d requests, %5d B on average: stock %4.1f%% of input; codes %+5.2f%%, fast %+5.2f%%" % (
        name, len(rows), n // len(rows), st * 100 / n, (co - st) * 100 / st, (fa - st) * 100 / st))


real = [tuple(map(int, l.split())) for l in open(sys.argv[1])]
idx = json.load(open(sys.argv[2]))
print("each request with codes made from that same request (what the search alone costs):")
if len(sys.argv) > 3:
    line("synthetic bid requests (bench/rtbgen.py)", [tuple(map(int, l.split())) for l in open(sys.argv[3])])
line("all sample requests of 1 KiB or more", real)
line("  exchange samples in RTB4FREE", [r for (s, p, n), r in zip(idx, real) if s == "RTB4FREE_bidder"])
line("  Prebid Server test fixtures", [r for (s, p, n), r in zip(idx, real) if s.startswith("prebid_prebid-server")])
line("  spec examples, library test data", [r for (s, p, n), r in zip(idx, real) if s != "RTB4FREE_bidder" and not s.startswith("prebid_prebid-server")])
line("  of 2 KiB or more", [r for r in real if r[0] >= 2048])
