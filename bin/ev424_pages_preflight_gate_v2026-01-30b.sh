#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"
PD="public_data"
[ -d "$PD" ] || { echo "FAIL: public_data missing"; exit 2; }
mapfile -d "" FILES < <(find "$PD" -type f -name "*.json" -print0 | sort -z)
[ "${#FILES[@]}" -gt 0 ] || { echo "FAIL: no json under public_data"; exit 2; }
PATTERN="(/home/ec2-user|/tmp/|ip-[0-9]+-[0-9]+-[0-9]+-[0-9]+|[0-9]{1,3}(\.[0-9]{1,3}){3}|bash -lc|sha256sum -c|curl -fsS|PRIVATE KEY|RAW LOG|INTERNAL_PATH)"
HIT=0
for f in "${FILES[@]}"; do
  if grep -nE "$PATTERN" "$f" >/dev/null; then
    echo "FAIL: hit forbidden pattern in $f"
    HIT=1
  fi
done
if [ "$HIT" -ne 0 ]; then exit 3; fi
for z in toc.json index_2026-01.json; do
  if [ -f "$z" ] && [ ! -s "$z" ]; then echo "WARN: zero-byte $z exists at repo root (ignored)"; fi
done
echo "PASS: preflight gate clean"
