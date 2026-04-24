#!/usr/bin/env python3
import csv
from pathlib import Path
from collections import Counter, defaultdict

ROT = Path("/home/ec2-user/ev424_hub_ops/state/source_rotation_9x5.tsv")
REG = Path("/home/ec2-user/ev424_hub_ops/state/source_registry.tsv")
INV = Path("/home/ec2-user/ev424_hub_ops/state/docw_supply_inventory_v1.jsonl")
OUT = Path("/home/ec2-user/ev424_hub_ops/state/docw_supply_sustainability_latest.tsv")

def read_tsv(p):
    with p.open(encoding="utf-8") as f:
        return list(csv.DictReader(f, delimiter="\t"))

rotation = [r for r in read_tsv(ROT) if r.get("active_flag") == "Y"]
registry = read_tsv(REG)

inventory_unused = defaultdict(int)
if INV.exists():
    import json
    for line in INV.read_text(encoding="utf-8").splitlines():
        if not line.strip():
            continue
        row = json.loads(line)
        if row.get("status") == "UNUSED":
            inventory_unused[(row.get("family") or "").strip()] += 1

by_family = defaultdict(Counter)
urls_by_family_status = defaultdict(set)

for r in registry:
    fam = (r.get("family") or "").strip()
    st = (r.get("status") or "").strip()
    url = (r.get("url") or "").strip()
    if not fam:
        continue
    by_family[fam][st] += 1
    if url:
        urls_by_family_status[(fam, st)].add(url)

families = []
seen = set()
for r in rotation:
    fam = (r.get("source_family") or "").strip()
    if fam and fam not in seen:
        seen.add(fam)
        families.append({
            "family": fam,
            "bucket": (r.get("bucket_name") or "").strip(),
            "seed_name": (r.get("seed_name") or "").strip(),
        })

rows = []
for x in families:
    fam = x["family"]
    c = by_family[fam]
    registry_ready_n = c.get("READY", 0)
    inventory_unused_n = inventory_unused[fam]
    ready_n = registry_ready_n + inventory_unused_n
    used_n = c.get("USED", 0)
    failed_n = c.get("FAILED_CANDIDATE", 0) + c.get("FAILED", 0)
    unused_n = ready_n

    if unused_n >= 3:
        supply_status = "ACTIVE"
    elif unused_n >= 1:
        supply_status = "LOW_SUPPLY"
    elif failed_n > 0 and used_n > 0:
        supply_status = "EXHAUSTED_WITH_FAILURES"
    elif used_n > 0:
        supply_status = "EXHAUSTED"
    else:
        supply_status = "NO_REGISTRY_HISTORY"

    rows.append({
        "family": fam,
        "bucket": x["bucket"],
        "seed_name": x["seed_name"],
        "ready_n": str(ready_n),
        "used_n": str(used_n),
        "failed_n": str(failed_n),
        "inventory_unused_n": str(inventory_unused_n),
        "unique_ready_url_n": str(len(urls_by_family_status[(fam, "READY")])),
        "unique_used_url_n": str(len(urls_by_family_status[(fam, "USED")])),
        "supply_status": supply_status,
    })

fields = ["family","bucket","seed_name","ready_n","used_n","failed_n","inventory_unused_n","unique_ready_url_n","unique_used_url_n","supply_status"]
with OUT.open("w", encoding="utf-8", newline="") as f:
    w = csv.DictWriter(f, fieldnames=fields, delimiter="\t", lineterminator="\n")
    w.writeheader()
    w.writerows(rows)

print(f"DOCW_SUPPLY_CLASSIFY_V1_OK\tROWS_N={len(rows)}\tOUT={OUT}")
