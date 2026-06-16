#!/usr/bin/env bash
set -euo pipefail

REPO="${1:-.}"
cd "$REPO"

TOC="public_data/toc.json"
TOC_SIDE="public_data/toc.json.sha256"

if [ ! -f "$TOC" ]; then
  echo "FAIL=TOC_MISSING"
  exit 1
fi

if [ ! -f "$TOC_SIDE" ]; then
  echo "FAIL=TOC_SIDECAR_MISSING"
  exit 1
fi

/usr/bin/env -C public_data /usr/bin/sha256sum -c toc.json.sha256 >/dev/null

/usr/bin/python3 - <<'PY'
import json, hashlib, re
from pathlib import Path

toc_path = Path("public_data/toc.json")
toc = json.loads(toc_path.read_text(encoding="utf-8"))

months = toc.get("months")
if not isinstance(months, list):
    raise SystemExit("FAIL=TOC_MONTHS_NOT_LIST")

bad = 0
checked = 0

for row in months:
    if not isinstance(row, dict):
        raise SystemExit("FAIL=TOC_MONTH_ROW_NOT_OBJECT")

    month = row.get("month")
    href = row.get("href")
    toc_sha = str(row.get("sha256", "")).lower()
    sha_file = row.get("sha256_file")

    if not isinstance(month, str) or not isinstance(href, str) or not isinstance(sha_file, str):
        raise SystemExit(f"FAIL=TOC_MONTH_ROW_BAD_FIELDS MONTH={month}")

    local = Path(href.lstrip("/")) if href.startswith("/public_data/") else Path("public_data") / href
    sidecar = Path(sha_file.lstrip("/")) if sha_file.startswith("/public_data/") else Path("public_data") / sha_file

    if not local.exists():
        raise SystemExit(f"FAIL=MONTH_INDEX_MISSING MONTH={month} LOCAL={local}")
    if not sidecar.exists():
        raise SystemExit(f"FAIL=MONTH_INDEX_SIDECAR_MISSING MONTH={month} SIDECAR={sidecar}")

    actual = hashlib.sha256(local.read_bytes()).hexdigest()
    txt = sidecar.read_text(encoding="utf-8", errors="replace")
    mm = re.search(r"\b[0-9a-fA-F]{64}\b", txt)
    sidecar_sha = mm.group(0).lower() if mm else "SIDECAR_NO_SHA64"

    if not (actual == toc_sha == sidecar_sha):
        print(f"FAIL=TOC_MONTH_SHA_BINDING_MISMATCH MONTH={month}")
        print(f"  LOCAL={local}")
        print(f"  SIDECAR={sidecar}")
        print(f"  ACTUAL_SHA256={actual}")
        print(f"  TOC_SHA256={toc_sha}")
        print(f"  SIDECAR_SHA256={sidecar_sha}")
        bad += 1

    checked += 1

print(f"CHECKED_MONTHS={checked}")
print(f"MISMATCH_COUNT={bad}")
if bad:
    raise SystemExit("FAIL=PUBLIC_DATA_TOC_MONTH_BINDING_CHECK")

print("PASS=PUBLIC_DATA_TOC_MONTH_BINDING_CHECK_OK")
PY
