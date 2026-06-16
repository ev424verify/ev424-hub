#!/usr/bin/env bash
set -euo pipefail
ROOT="${1:-/home/desktop/experiment_A/ev424_pages_site}"
REV_DIR="$ROOT/public_data/revalidation"
/usr/bin/python3 - "$REV_DIR" <<'PY'
import json, pathlib, re, sys
from datetime import datetime, timedelta, timezone
KST=timezone(timedelta(hours=9))
now=datetime.now(KST)
rev_dir=pathlib.Path(sys.argv[1])
hex64=re.compile(r"^[0-9a-fA-F]{64}$")
rows=[]
counts={"total":0,"eligible_open":0,"empty_due":0,"nonempty_due":0,"not_due":0,"terminated_fail":0,"bad_or_ineligible":0}
def parse_dt(s):
    if not isinstance(s,str) or not s.strip(): return None
    x=s.strip()
    if x.endswith("Z"): x=x[:-1]+"+00:00"
    for fn in (datetime.fromisoformat, lambda y: datetime.strptime(y,"%Y-%m-%dT%H:%M:%S%z")):
        try: return fn(x)
        except Exception: pass
    return None
for p in sorted(rev_dir.glob("*.json")):
    counts["total"]+=1
    try:
        d=json.loads(p.read_text(encoding="utf-8"))
        eid=str(d.get("entry_id") or p.stem)
        ev=d.get("events")
        last=ev[-1] if isinstance(ev,list) and ev else {}
        if str(d.get("revalidation_skip_after_fail_record","")).upper() in ("YES","TRUE","1") or str(last.get("final_status","")).upper()=="FAIL" or bool(str(last.get("skip_label","")).strip()):
            counts["terminated_fail"]+=1; continue
        issued=parse_dt(d.get("issued_date"))
        url=d.get("source_url")
        fp=str(d.get("fingerprint_sha256") or "")
        if not url or not hex64.match(fp) or issued is None:
            counts["bad_or_ineligible"]+=1; continue
        counts["eligible_open"]+=1
        due_at=issued.astimezone(KST)+timedelta(days=7)
        if due_at > now:
            counts["not_due"]+=1; continue
        if isinstance(ev,list) and len(ev)==0:
            counts["empty_due"]+=1
            rows.append((due_at.isoformat(timespec="seconds"),eid,p.name,fp,url))
        else:
            counts["nonempty_due"]+=1
    except Exception:
        counts["bad_or_ineligible"]+=1
print("EV424_7D_DUE_SCAN_READONLY_V1")
print("NOW_KST="+now.isoformat(timespec="seconds"))
for k in ("total","eligible_open","empty_due","nonempty_due","not_due","terminated_fail","bad_or_ineligible"):
    print(k.upper()+"="+str(counts[k]))
for due_at,eid,name,fp,url in rows:
    print("EMPTY_DUE entry_id=%s file=%s due_at_kst=%s expected_sha256=%s source_url=%s" % (eid,name,due_at,fp,url))
print("READONLY_DONE=YES")
PY
