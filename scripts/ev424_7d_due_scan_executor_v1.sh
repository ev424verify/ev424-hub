#!/usr/bin/env bash
set -euo pipefail
MODE="${1:-READONLY}"
ROOT="${2:-/home/desktop/experiment_A/ev424_pages_site}"
REV_DIR="$ROOT/public_data/revalidation"
TMP_ROOT="$(/usr/bin/mktemp -d /tmp/ev424_7d_due_scan_executor_v1.XXXXXX)"
trap 'rm -rf "$TMP_ROOT"' EXIT

/usr/bin/python3 - "$ROOT" "$REV_DIR" "$MODE" "$TMP_ROOT" <<'PY'
import json, pathlib, re, sys, subprocess, hashlib
from datetime import datetime, timedelta, timezone

KST=timezone(timedelta(hours=9))
root=pathlib.Path(sys.argv[1])
rev_dir=pathlib.Path(sys.argv[2])
mode=sys.argv[3]
tmp_root=pathlib.Path(sys.argv[4])
now=datetime.now(KST)
hex64=re.compile(r"^[0-9a-fA-F]{64}$")
executor="7D_DUE_SCAN_EXECUTOR_V1"
policy="EV424_POLICY_7D_REVALIDATION_PASS_FAIL_ONLY_V2"

def parse_dt(s):
    if not isinstance(s,str) or not s.strip(): return None
    x=s.strip()
    if x.endswith("Z"): x=x[:-1]+"+00:00"
    for fn in (datetime.fromisoformat, lambda y: datetime.strptime(y,"%Y-%m-%dT%H:%M:%S%z")):
        try: return fn(x)
        except Exception: pass
    return None

def sha256_file(p):
    h=hashlib.sha256()
    with open(p,"rb") as f:
        for b in iter(lambda:f.read(1024*1024), b""):
            h.update(b)
    return h.hexdigest()

def write_sidecar_and_verify(p):
    h=sha256_file(p)
    rel=p.relative_to(root)
    side=pathlib.Path(str(p)+".sha256")
    side.write_text(h+"  "+str(rel)+"\n", encoding="utf-8")
    r=subprocess.run(["/usr/bin/sha256sum","-c",str(rel)+".sha256"], cwd=str(root), text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    print(r.stdout.strip())
    if r.returncode != 0:
        raise SystemExit(r.returncode)

rows=[]
counts={"total":0,"eligible_open":0,"empty_due":0,"nonempty_due":0,"not_due":0,"terminated_fail":0,"bad_or_ineligible":0}
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
            rows.append((p,d,eid,p.name,due_at.isoformat(timespec="seconds"),fp,url))
        else:
            counts["nonempty_due"]+=1
    except Exception:
        counts["bad_or_ineligible"]+=1

print("EV424_7D_DUE_SCAN_EXECUTOR_V1")
print("MODE="+mode)
print("NOW_KST="+now.isoformat(timespec="seconds"))
for k in ("total","eligible_open","empty_due","nonempty_due","not_due","terminated_fail","bad_or_ineligible"):
    print(k.upper()+"="+str(counts[k]))

if mode == "READONLY":
    for p,d,eid,name,due_at,fp,url in rows:
        print("READONLY_EMPTY_DUE entry_id=%s file=%s due_at_kst=%s expected_sha256=%s source_url=%s" % (eid,name,due_at,fp,url))
    print("READONLY_DONE=YES")
    sys.exit(0)

if mode not in ("DRY_RUN","APPLY"):
    print("FAIL=UNKNOWN_MODE")
    sys.exit(3)

pass_count=0
fail_count=0
for p,d,eid,name,due_at,fp,url in rows:
    observed_at=datetime.now(KST).isoformat(timespec="seconds")
    prev_ledger_sha256=sha256_file(p)
    out=tmp_root/(eid+".download")
    meta=subprocess.run(
        ["/usr/bin/curl","-fL","--max-time","240","--retry","2","--retry-delay","2","-A","EV424-7D-DUE-SCAN/1.0","-w","EV424_HTTP_CODE=%{http_code}\nEV424_EFFECTIVE_URL=%{url_effective}\nEV424_CONTENT_TYPE=%{content_type}\nEV424_SIZE_DOWNLOAD=%{size_download}\n","-o",str(out),url],
        text=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE
    )
    info={}
    for line in meta.stdout.splitlines():
        if line.startswith("EV424_") and "=" in line:
            k,v=line.split("=",1)
            info[k]=v
    http_code=info.get("EV424_HTTP_CODE","000")
    effective_url=info.get("EV424_EFFECTIVE_URL",url)
    content_type=info.get("EV424_CONTENT_TYPE","")
    size_download=info.get("EV424_SIZE_DOWNLOAD","0")
    observed="NONE"
    native_check="CURL_FETCH_FAILED"
    final_status="FAIL"
    fail_reason="CURL_FETCH_FAILED"
    if meta.returncode == 0 and out.exists():
        observed=sha256_file(out)
        if observed.lower() == fp.lower():
            final_status="PASS"
            native_check=out.name+": OK"
            fail_reason=""
            pass_count += 1
        else:
            native_check="SHA256_MISMATCH"
            fail_reason="SHA256_MISMATCH"
            fail_count += 1
    else:
        if http_code and http_code != "000":
            fail_reason="SOURCE_FETCH_FAILED_HTTP_"+http_code
        fail_count += 1
    event={
        "event_type":"7D_REVALIDATION",
        "observed_at_kst":observed_at,
        "due_at_kst":due_at,
        "executor":executor,
        "source_url":url,
        "effective_url":effective_url,
        "expected_sha256":fp,
        "observed_sha256":observed,
        "native_check":native_check,
        "final_status":final_status,
        "http_code":http_code,
        "content_type":content_type,
        "size":str(size_download),
        "prev_ledger_sha256":prev_ledger_sha256,
        "scope":"integrity_and_reproducibility_only",
        "note":"7D scheduled re-validation executed by source re-download and SHA256 comparison."
    }
    if final_status == "FAIL":
        event["fail_reason"]=fail_reason
        event["fail_label"]="EV424_7D_REVALIDATION_FAIL_RECORDED"
        event["skip_label"]="EV424_7D_REVALIDATION_SKIP_AFTER_FAIL_RECORD"
        event["future_7d_revalidation_action"]="SKIP_UNLESS_NEW_SOURCE_OBJECT_OR_HUMAN_REOPEN_APPROVAL"
        event["ev424_fail_meaning"]="SOURCE_OBJECT_NOT_REPRODUCED_UNDER_7D_REVALIDATION_POLICY"
    print("%s_RESULT entry_id=%s final_status=%s native_check=%s due_at_kst=%s expected_sha256=%s observed_sha256=%s source_url=%s" % (mode,eid,final_status,native_check,due_at,fp,observed,url))
    if mode == "APPLY":
        if final_status == "FAIL" and fail_reason != "SHA256_MISMATCH":
            print("APPLY_NO_MUTATION entry_id=%s reason=%s" % (eid,fail_reason))
            continue
        d["revalidation_policy"]=policy
        if not isinstance(d.get("events"), list):
            d["events"]=[]
        d["events"].append(event)
        if final_status == "FAIL":
            d["ev424_fail_meaning"]=event["ev424_fail_meaning"]
            d["fail_record_label"]=event["fail_label"]
            d["fail_recorded_at_kst"]=observed_at
            d["future_7d_revalidation_action"]=event["future_7d_revalidation_action"]
            d["revalidation_skip_after_fail_record"]="YES"
            d["revalidation_skip_label"]=event["skip_label"]
            d["last_fail_reason"]=fail_reason
            d["last_expected_sha12"]=fp[:12]
            d["last_current_sha12"]=observed[:12] if observed != "NONE" else "NONE"
            d["last_public_surface"]="%s FAIL REASON=%s EXPECTED_SHA12=%s CURRENT_SHA12=%s LABEL=%s SKIP_LABEL=%s OBSERVED_AT=%s" % (eid,fail_reason,fp[:12],observed[:12] if observed != "NONE" else "NONE",event["fail_label"],event["skip_label"],observed_at)
        p.write_text(json.dumps(d, ensure_ascii=False, indent=2, sort_keys=True)+"\n", encoding="utf-8")
        write_sidecar_and_verify(p)
print(mode+"_PASS_COUNT="+str(pass_count))
print(mode+"_FAIL_COUNT="+str(fail_count))
print(mode+"_DONE=YES")
PY
