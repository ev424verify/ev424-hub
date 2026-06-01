#!/usr/bin/env bash
set -euo pipefail

ROOT="public_data"
: "${PATTERN:=}"

mapfile -t FILES < <(find "$ROOT" -type f \( -name "*.json" -o -name "*.sha256" \) | LC_ALL=C sort)

for f in "${FILES[@]}"; do
  if [[ "$f" == *.json ]]; then
    jq -e . "$f" >/dev/null
  elif [[ "$f" == *.sha256 ]]; then
    # sha256 경로 스타일 혼재 대응 (근거: toc.json.sha256는 public_data/..., entries/*.sha256는 entries/...):
    #  A) " public_data/..." 포함 -> repo root 기준 검증
    #  B) " entries/..." 포함 -> public_data 기준 검증 (sha256 파일 경로를 public_data 상대경로로)
    #  C) 그 외 -> sha256 파일 위치 기준 검증
    if grep -qE "[[:space:]]public_data/" "$f"; then
      sha256sum -c "$f" >/dev/null
    elif grep -qE "[[:space:]]entries/" "$f"; then
      (cd "$ROOT" && sha256sum -c "${f#${ROOT}/}" >/dev/null)
    else
      (cd "$(dirname "$f")" && sha256sum -c "$(basename "$f")" >/dev/null)
    fi
  fi
done

if [[ -n "$PATTERN" ]]; then
  if grep -RInE "$PATTERN" "$ROOT" >/dev/null; then
    echo "FAIL-STOP: contamination pattern hit in $ROOT"
    grep -RInE "$PATTERN" "$ROOT" | head -n 20
    exit 1
  fi
fi

echo "PASS: preflight gate clean"
