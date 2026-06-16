#!/usr/bin/env bash
set -euo pipefail

REPO="${1:-.}"
cd "$REPO"

DIR="public_data/revalidation"

if [ ! -d "$DIR" ]; then
  echo "FAIL=REVALIDATION_DIR_MISSING"
  exit 1
fi

/usr/bin/python3 - <<'PY'
import hashlib, re, subprocess
from pathlib import Path

base = Path("public_data/revalidation")
json_files = sorted(base.glob("EV424-ENTRY-*.json"))

bad = 0
checked = 0
native_bad = 0

for p in json_files:
    side = p.with_suffix(p.suffix + ".sha256")
    if not side.exists():
        print(f"FAIL=SIDECAR_MISSING JSON={p}")
        bad += 1
        continue

    native = subprocess.run(
        ["/usr/bin/env", "-C", str(side.parent), "/usr/bin/sha256sum", "-c", side.name],
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
    )
    if native.returncode != 0:
        print(native.stdout, end="")
        native_bad += 1

    actual = hashlib.sha256(p.read_bytes()).hexdigest()
    txt = side.read_text(encoding="utf-8", errors="replace").strip()
    mm = re.search(r"\b[0-9a-fA-F]{64}\b", txt)
    recorded = mm.group(0).lower() if mm else "NO_SHA64"
    ref = txt.split()[1] if len(txt.split()) >= 2 else ""

    if actual != recorded or ref != p.name:
        print(f"FAIL=REVALIDATION_SIDECAR_REF_BINDING_MISMATCH JSON={p}")
        print(f"  ACTUAL_SHA256={actual}")
        print(f"  SIDECAR_SHA256={recorded}")
        print(f"  SIDECAR_REF={ref}")
        print(f"  EXPECTED_REF={p.name}")
        bad += 1

    checked += 1

print(f"REVALIDATION_JSON_CHECKED={checked}")
print(f"NATIVE_SHA256SUM_FAIL_COUNT={native_bad}")
print(f"REF_BINDING_MISMATCH_COUNT={bad}")

if native_bad or bad:
    raise SystemExit("FAIL=REVALIDATION_SIDECAR_REF_CHECK")

print("PASS=REVALIDATION_SIDECAR_REF_CHECK_OK")
PY
