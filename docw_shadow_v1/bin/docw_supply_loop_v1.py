#!/usr/bin/env python3
import json
from pathlib import Path
from collections import Counter, defaultdict

ROOT = Path("/home/ec2-user/ev424_hub_ops")
ROT = ROOT / "state/source_rotation_9x5.tsv"
INV = ROOT / "state/docw_supply_inventory_v1.jsonl"
TARGET_MIN_UNUSED = 3

def active_families():
    out = []
    for line in ROT.read_text(encoding="utf-8", errors="replace").splitlines()[1:]:
        if not line.strip():
            continue
        parts = line.split("\t")
        if len(parts) >= 8 and parts[-1].strip() == "Y":
            fam = parts[6].strip()
            bucket = parts[1].strip()
            seed = parts[4].strip()
            if fam and fam not in [x["family"] for x in out]:
                out.append({"family": fam, "bucket": bucket, "seed_name": seed})
    return out

def inventory_counts():
    by = defaultdict(Counter)
    if INV.exists():
        for line in INV.read_text(encoding="utf-8", errors="replace").splitlines():
            if line.strip():
                r = json.loads(line)
                by[r.get("family", "UNKNOWN")][r.get("status", "UNKNOWN")] += 1
    return by

def main():
    fams = active_families()
    by = inventory_counts()
    plan = []
    for x in fams:
        fam = x["family"]
        unused = by[fam].get("UNUSED", 0)
        used = by[fam].get("USED", 0)
        need = max(0, TARGET_MIN_UNUSED - unused)
        status = "ACTIVE" if unused >= 3 else ("LOW_SUPPLY" if unused >= 1 else "EXHAUSTED")
        if need:
            plan.append((status, need, fam, unused, used, x["bucket"], x["seed_name"]))

    rank = {"EXHAUSTED": 0, "LOW_SUPPLY": 1, "ACTIVE": 2}
    plan.sort(key=lambda r: (rank.get(r[0], 9), -r[1], r[2]))

    print("DOCW_SUPPLY_LOOP_V1_PLAN")
    print("mode=READ_ONLY")
    print("target_min_unused_per_family=%d" % TARGET_MIN_UNUSED)
    print("active_source_families_n=%d" % len(fams))
    print("families_need_replenish_n=%d" % len(plan))
    print()
    for status, need, fam, unused, used, bucket, seed in plan:
        print("TARGET_FAMILY=%s\tSTATUS=%s\tUNUSED=%d\tUSED=%d\tNEED_TO_MIN=%d\tBUCKET=%s\tSEED=%s" % (
            fam, status, unused, used, need, bucket, seed
        ))

if __name__ == "__main__":
    main()
