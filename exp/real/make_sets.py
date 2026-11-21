"""make_sets.py <directory with the *.jsonl and *.jsonl.sources of find_bidrequests.py>

Builds the payload sets of the experiment from what was found:

  samples_1k.bin      every distinct sample request of 1 KiB or more, outside
                      the capture below
  mixed_all.bin       the same, shuffled: many kinds of request on one compressor
  mixed_exchange.bin  those that are not Prebid Server test fixtures, shuffled
  capture.bin/.jsonl  the 1,000 requests of one kind in RTB4FREE's
                      SampleBids/adxrequests, as they are in that file

Records are [u32 length][bytes].  Run with python3 -I.
"""
import json
import random
import struct
import sys

ORDER = ["RTB4FREE_bidder", "rtbkit_rtbkit", "Vungle_vungo", "bsm_openrtb", "mxmCherry_openrtb", "prebid_openrtb",
         "openrtb_examples", "InteractiveAdvertisingBureau_openrtb2.x", "InteractiveAdvertisingBureau_openrtb",
         "openrtb_openrtb2x", "prebid_prebid-server-java", "prebid_prebid-server"]
CAPTURE = "SampleBids/adxrequests"


def write(path, payloads):
    with open(path, "wb") as f:
        for b in payloads:
            f.write(struct.pack("<I", len(b)) + b)


def main():
    d = sys.argv[1]
    seen = set()
    samples = []   # (source, path, bytes)
    capture = []
    for s in ORDER:
        try:
            src = [l.rstrip("\n").split("\t") for l in open("%s/%s.jsonl.sources" % (d, s), encoding="utf-8")]
            lines = open("%s/%s.jsonl" % (d, s), encoding="utf-8").read().split("\n")
        except OSError:
            continue
        for (size, path), line in zip(src, lines):
            b = line.encode("utf-8")
            if path == CAPTURE:
                capture.append(b)
                continue
            if line in seen:
                continue
            seen.add(line)
            samples.append((s, path, b))
    big = [x for x in samples if len(x[2]) >= 1024]
    write(d + "/samples_1k.bin", [b for _, _, b in big])
    json.dump([[s, p, len(b)] for s, p, b in big], open(d + "/samples_1k.index.json", "w"))
    rnd = random.Random(7)
    mixed = [b for _, _, b in big]
    rnd.shuffle(mixed)
    write(d + "/mixed_all.bin", mixed)
    ex = [b for s, _, b in big if not s.startswith("prebid_prebid-server")]
    rnd.shuffle(ex)
    write(d + "/mixed_exchange.bin", ex)
    write(d + "/capture.bin", capture)
    open(d + "/capture.jsonl", "wb").write(b"\n".join(capture) + b"\n")
    print("sample requests found: %d distinct; of 1 KiB or more: %d (of 2 KiB or more: %d, of 3 KiB or more: %d)" % (
        len(samples), len(big), sum(1 for x in big if len(x[2]) >= 2048), sum(1 for x in big if len(x[2]) >= 3072)))
    print("  of those of 1 KiB or more, not Prebid Server test fixtures: %d" % len(ex))
    if capture:
        print("capture of one exchange's requests: %d, %d B on average" % (len(capture), sum(map(len, capture)) // len(capture)))


main()
