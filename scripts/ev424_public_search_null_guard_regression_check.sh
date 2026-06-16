#!/usr/bin/env bash
set -euo pipefail

HTML="${1:-index.html}"

printf '%s\n' '[EV424_PUBLIC_SEARCH_NULL_GUARD_REGRESSION_CHECK]'

test -f "$HTML"

grep -q 'const safeReval = (reval && typeof reval === "object") ? reval : {};' "$HTML"
grep -q 'const last = (historyN && events\[historyN - 1\] && typeof events\[historyN - 1\] === "object") ? events\[historyN - 1\] : {};' "$HTML"
grep -q 'const failReason = last.fail_reason || safeReval.last_fail_reason || "";' "$HTML"

if grep -nE 'last\.(fail_reason|fail_label|skip_label|future_7d_revalidation_action|public_surface) \|\| reval\.' "$HTML"; then
  printf '%s\n' 'FAIL=DIRECT_LAST_OR_REVAL_NULL_RISK_REINTRODUCED'
  exit 1
fi

if grep -nE 'const last = historyN \? events\[historyN - 1\] : null;' "$HTML"; then
  printf '%s\n' 'FAIL=LAST_NULL_PATTERN_REINTRODUCED'
  exit 1
fi

printf '%s\n' 'PASS=PUBLIC_SEARCH_NULL_GUARD_REGRESSION_CHECK_OK'
