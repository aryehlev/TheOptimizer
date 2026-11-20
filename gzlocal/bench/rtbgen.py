#!/usr/bin/env python3
"""rtbgen.py <out_prefix> [auctions=400] [dsps=6] [seed=1]

Synthetic OpenRTB 2.6-style bid requests, for benchmarks only: the field names
and shapes are the spec's, the values are random.  Writes record files
([u32 length][bytes] repeated):

  <prefix>_single.bin       one request per auction
  <prefix>_fan_natural.bin  every auction sent to <dsps> bidders, fields in the
                            usual order (id, imp, site/app, device, user, ...)
  <prefix>_fan_shared.bin   the same requests with what is common to all bidders
                            first and what differs per bidder (buyeruid, floors,
                            deals, ext) last
"""
import json, random, struct, sys, uuid, base64

prefix = sys.argv[1]
A = int(sys.argv[2]) if len(sys.argv) > 2 else 400
D = int(sys.argv[3]) if len(sys.argv) > 3 else 6
R = random.Random(int(sys.argv[4]) if len(sys.argv) > 4 else 1)

def hexid(n): return "".join(R.choice("0123456789abcdef") for _ in range(n))
def b64(n): return base64.urlsafe_b64encode(bytes(R.getrandbits(8) for _ in range(n))).decode().rstrip("=")
def uid(): return str(uuid.UUID(int=R.getrandbits(128)))
words = ("news sport weather finance travel recipes health tech auto style home garden games music movies local "
         "world politics business science markets video live results guide review best top daily weekly").split()
def slug(k): return "-".join(R.choice(words) for _ in range(k))
domains = [f"{slug(1)}{R.choice(['daily','hub','times','post','today','zone','now'])}.{R.choice(['com','net','org','co.uk','de','fr'])}" for _ in range(60)]
uas = [
 "Mozilla/5.0 (iPhone; CPU iPhone OS {a}_{b} like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/{a}.{b} Mobile/15E148 Safari/604.1",
 "Mozilla/5.0 (Linux; Android {c}; {m}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/{v}.0.{w}.{x} Mobile Safari/537.36",
 "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/{v}.0.{w}.{x} Safari/537.36 Edg/{v}.0.{w}.{x}",
 "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/{v}.0.{w}.{x} Safari/537.36",
 "Mozilla/5.0 (X11; Linux x86_64; rv:{v}.0) Gecko/20100101 Firefox/{v}.0",
]
models = ["SM-S918B", "SM-A546E", "Pixel 8 Pro", "Pixel 7a", "M2101K6G", "CPH2451", "moto g84 5G", "SM-G991U", "22101316G", "V2247"]
cities = [("US","CA","Los Angeles","90012"),("US","NY","New York","10007"),("GB","ENG","London","EC1A"),("DE","BE","Berlin","10115"),
          ("FR","IDF","Paris","75001"),("US","TX","Austin","73301"),("IL","TA","Tel Aviv","61000"),("ES","MD","Madrid","28001")]
eid_sources = ["liveramp.com","id5-sync.com","pubcid.org","adserver.org","uidapi.com","criteo.com","sharedid.org","intentiq.com","audigent.com","bidswitch.net"]
sizes = [(300,250),(728,90),(320,50),(300,600),(970,250),(160,600),(336,280),(320,100)]
ssps = ["rubiconproject.com","pubmatic.com","openx.com","appnexus.com","indexexchange.com","sovrn.com","triplelift.com"]

def auction():
    is_app = R.random() < 0.35
    dom = R.choice(domains)
    ua = R.choice(uas).format(a=R.randint(15,18), b=R.randint(0,6), c=R.randint(11,15), m=R.choice(models),
                              v=R.randint(118,131), w=R.randint(5000,6800), x=R.randint(50,220))
    cc, reg, city, zipc = R.choice(cities)
    pub = {"id": str(R.randint(1000, 99999)), "name": dom.split(".")[0].title() + " Media", "domain": dom}
    place = ({"id": str(R.randint(100000, 999999)), "name": slug(2).title(), "bundle": "com." + slug(1) + "." + slug(1),
              "storeurl": "https://play.google.com/store/apps/details?id=com." + slug(1) + "." + slug(1), "ver": f"{R.randint(1,9)}.{R.randint(0,30)}.{R.randint(0,9)}",
              "cat": [f"IAB{R.randint(1,24)}", f"IAB{R.randint(1,24)}-{R.randint(1,12)}"], "publisher": pub}
             if is_app else
             {"id": str(R.randint(100000, 999999)), "name": dom, "domain": dom,
              "page": f"https://www.{dom}/{slug(1)}/{slug(R.randint(3,7))}-{R.randint(10000,99999)}.html?utm_source={slug(1)}&utm_medium=social&utm_campaign={slug(2)}&ref={hexid(12)}",
              "ref": f"https://www.{R.choice(['google.com','facebook.com','bing.com','t.co'])}/", "cat": [f"IAB{R.randint(1,24)}", f"IAB{R.randint(1,24)}-{R.randint(1,12)}"],
              "mobile": R.randint(0,1), "publisher": pub,
              "content": {"language": R.choice(["en","de","fr","es","he"]), "title": slug(R.randint(4,9)).replace("-", " ").capitalize(), "keywords": ",".join(R.sample(words, 5))}})
    device = {"ua": ua, "ip": ".".join(str(R.randint(1,254)) for _ in range(4)),
              "geo": {"lat": round(R.uniform(-60,60),4), "lon": round(R.uniform(-150,150),4), "country": cc, "region": reg, "city": city, "zip": zipc, "type": 2, "utcoffset": R.choice([-480,-300,0,60,120])},
              "dnt": 0, "lmt": 0, "devicetype": R.choice([1,2,4,5]), "make": R.choice(["Apple","Samsung","Google","Xiaomi","OPPO"]), "model": R.choice(models),
              "os": R.choice(["iOS","Android","Windows","macOS"]), "osv": f"{R.randint(10,17)}.{R.randint(0,6)}", "h": R.choice([844,915,1080,2400]), "w": R.choice([390,412,1920,1080]),
              "pxratio": R.choice([1,2,2.625,3]), "language": R.choice(["en","de","fr","es","he"]), "carrier": R.choice(["Verizon","T-Mobile","Vodafone","Orange","Partner"]),
              "connectiontype": R.choice([2,5,6,7]), "ifa": uid(),
              "sua": {"browsers": [{"brand": "Chromium", "version": [str(R.randint(118,131)), "0", str(R.randint(5000,6800)), str(R.randint(50,220))]},
                                   {"brand": "Not_A Brand", "version": ["24", "0", "0", "0"]}], "platform": {"brand": "Android", "version": [str(R.randint(11,15))]}, "mobile": 1, "source": 2}}
    user = {"id": hexid(32), "eids": [{"source": s, "uids": [{"id": b64(R.choice([16,24,32,48])), "atype": R.choice([1,3]), "ext": {"rtiPartner": "TDID"} if s == "adserver.org" else {"stype": "ppuid"}}]}
                                   for s in R.sample(eid_sources, R.randint(3,7))],
            "ext": {"consent": b64(R.randint(220, 420))}}
    regs = {"coppa": 0, "gdpr": R.randint(0,1), "us_privacy": R.choice(["1YNN","1YYN","1---"]), "gpp": "DBABMA~" + b64(R.randint(20,60)), "gpp_sid": [R.choice([2,6,7,8])], "ext": {"dsa": {"dsarequired": 1, "pubrender": 0, "datatopub": 1}}}
    source = {"tid": uid(), "fd": 1, "ext": {"schain": {"ver": "1.0", "complete": 1,
              "nodes": [{"asi": R.choice(ssps), "sid": str(R.randint(1000,999999)), "hp": 1, "rid": hexid(16)} for _ in range(R.randint(1,3))]}}}
    imps = []
    for i in range(R.choice([1,1,1,2,3])):
        w, h = R.choice(sizes)
        imp = {"id": str(i + 1), "tagid": f"/{R.randint(10000000,99999999)}/{dom.split('.')[0]}/{slug(2)}", "secure": 1, "instl": 0, "exp": 300}
        if R.random() < 0.75:
            imp["banner"] = {"w": w, "h": h, "format": [{"w": a, "h": b} for a, b in R.sample(sizes, R.randint(1,4))], "pos": R.choice([1,3,4]), "api": [3,5,6,7], "topframe": 1}
        else:
            imp["video"] = {"mimes": ["video/mp4","video/webm","application/javascript"], "minduration": 5, "maxduration": R.choice([15,30,60]), "protocols": [2,3,5,6,7,8],
                            "w": 640, "h": 360, "startdelay": 0, "linearity": 1, "skip": 1, "playbackmethod": [6], "api": [2,7], "placement": 1, "plcmt": 1}
        imp["ext"] = {"gpid": f"/{R.randint(10000000,99999999)}/{dom.split('.')[0]}/{slug(2)}#{slug(1)}", "tid": uid(), "data": {"pbadslot": slug(2), "adserver": {"name": "gam", "adslot": "/" + slug(3).replace("-", "/")}}}
        imps.append(imp)
    return {"id": uid(), "at": 1, "tmax": R.choice([120,150,200,250]), "cur": ["USD"], "place": ("app" if is_app else "site", place), "device": device, "user": user,
            "regs": regs, "source": source, "imps": imps, "bcat": ["IAB25","IAB26","IAB7-39"], "badv": [R.choice(domains) for _ in range(R.randint(0,4))]}

def per_dsp(a, d):
    """What differs from bidder to bidder in one auction."""
    floors = [round(R.uniform(0.05, 4.0), 2) for _ in a["imps"]]
    deals = [[{"id": "deal-" + hexid(10), "bidfloor": round(R.uniform(1, 9), 2), "bidfloorcur": "USD", "at": 1, "wseat": [str(R.randint(100, 999))]} for _ in range(R.randint(1,2))]
             if R.random() < 0.3 else None for _ in a["imps"]]
    return {"buyeruid": b64(R.choice([16, 24, 32])), "floors": floors, "deals": deals, "seat": d, "bidder": f"dsp{d}", "auction_seq": R.randint(1, 10**9)}

def natural(a, p):
    imps = []
    for imp, fl, dl in zip(a["imps"], p["floors"], p["deals"]):
        m = {"id": imp["id"], "tagid": imp["tagid"], "bidfloor": fl, "bidfloorcur": "USD"}
        m.update({k: v for k, v in imp.items() if k not in m})
        if dl: m["pmp"] = {"private_auction": 0, "deals": dl}
        imps.append(m)
    user = {"id": a["user"]["id"], "buyeruid": p["buyeruid"], "eids": a["user"]["eids"], "ext": a["user"]["ext"]}
    return {"id": a["id"], "imp": imps, a["place"][0]: a["place"][1], "device": a["device"], "user": user, "at": a["at"], "tmax": a["tmax"], "cur": a["cur"],
            "bcat": a["bcat"], "badv": a["badv"], "source": a["source"], "regs": a["regs"], "ext": {"seat": p["seat"], "bidder": p["bidder"], "seq": p["auction_seq"]}}

def shared_first(a, p):
    imps = []
    for imp, fl, dl in zip(a["imps"], p["floors"], p["deals"]):
        m = dict(imp); m["bidfloor"] = fl; m["bidfloorcur"] = "USD"
        if dl: m["pmp"] = {"private_auction": 0, "deals": dl}
        imps.append(m)
    user = {"id": a["user"]["id"], "eids": a["user"]["eids"], "ext": a["user"]["ext"], "buyeruid": p["buyeruid"]}
    return {"id": a["id"], "at": a["at"], "tmax": a["tmax"], "cur": a["cur"], "bcat": a["bcat"], "badv": a["badv"], a["place"][0]: a["place"][1], "device": a["device"],
            "source": a["source"], "regs": a["regs"], "user": user, "imp": imps, "ext": {"seat": p["seat"], "bidder": p["bidder"], "seq": p["auction_seq"]}}

def dump(o): return json.dumps(o, separators=(",", ":"), ensure_ascii=False).encode()
out = {k: open(f"{prefix}_{k}.bin", "wb") for k in ("single", "fan_natural", "fan_shared")}
def put(f, b): f.write(struct.pack("<I", len(b))); f.write(b)
tot = n = 0
for _ in range(A):
    a = auction(); ps = [per_dsp(a, d) for d in range(1, D + 1)]
    b = dump(natural(a, ps[0])); put(out["single"], b); tot += len(b); n += 1
    for p in ps:
        put(out["fan_natural"], dump(natural(a, p))); put(out["fan_shared"], dump(shared_first(a, p)))
print(f"{A} auctions x {D} bidders; request size mean {tot/n:.0f} bytes")
