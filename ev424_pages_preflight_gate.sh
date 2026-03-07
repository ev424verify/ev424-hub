#!/usr/bin/env bash
set -euo pipefail

ROOT="public_data"
# 금지 패턴(최소 노출/오염 방지): 내부 경로, 서버 식별, 커맨드 조각, RAW/TRACE, 단정/추천 문구

# 1) 대상 파일 목록 고정 (json + sha256)
mapfile -t FILES < <(find "$ROOT" -type f \( -name "*.json" -o -name "*.sha256" \) | LC_ALL=C sort)

# 2) JSON 파싱 가능 + sha256sum -c 가능 여부(있으면)
for f in "${FILES[@]}"; do
  if [[ "$f" == *.json ]]; then
    jq -e . "$f" >/dev/null
  elif [[ "$f" == *.sha256 ]]; then
    sha256sum -c "$f" >/dev/null
  fi
done

# 3) 오염 패턴 탐지(히트 1개라도 있으면 FAIL-STOP)
if grep -RInE "$PATTERN" "$ROOT" >/dev/null; then
  echo "FAIL-STOP: contamination pattern hit in $ROOT"
  grep -RInE "$PATTERN" "$ROOT" | head -n 20
  exit 1
fi

echo "PASS: preflight gate clean"
