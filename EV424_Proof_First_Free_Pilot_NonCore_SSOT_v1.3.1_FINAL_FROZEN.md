EV424 Proof-First Free Pilot (Non-core) — SSOT v1.3 (FROZEN)
Purpose

Money: 0 / Persuasion: 0

Goal: 1 external VERDICT (PASS or FAIL)

Reply with one word only: PASS or FAIL. Then this pilot ends.

Scope is limited to PASS/FAIL only.

This pilot is provided AS IS with no warranties.

Do not send confidential or personal data (PII).

How to start

Send 1 public link (or 1 file) + a 1-line verification goal

I will reply with 2 artifacts: SEALED_DIR.tar.gz and manifest.sha256

Capacity

0–1 request/day

1 active at a time

No queue

Operating Window (KST)

10:00–22:00

Requests outside the window -> Pre-check starts next window

Delivery deadline: within 1 hour from Pre-check PASS

Verification (Fixed 1)

Run: sha256sum -c manifest.sha256

Pre-check STOP (Start is forbidden if any applies)

Size > 100MB

Account creation / onboarding / KYC / tool installation required

Link requires login / approval / intranet-only access

Link not publicly accessible (404 / forbidden / expired)

Scope expansion (extra work / analysis / outputs)

Third-party scans / dashboards / signing docs / extra gates

Code / environment / container / scripts requested

Duplicate verification / re-run request for the same input

STOP notice (fixed 1 line)
"This request is STOPPED at Pre-check due to spec violation."

PASS/FAIL rule (fixed 1 sentence)

If sha256sum -c manifest.sha256 exits with code 0 (all files OK), it is observed as PASS; otherwise it is observed as FAIL.

Termination (Forced)

Receive PASS/FAIL -> END

No reply within 24h -> record NO_REPLY -> END

Any scope expansion request -> STOP -> END

24h close notice (fixed 1 line)
"No reply within 24 hours. This pilot is now closed."

FAIL (Observed reason, 1 line only)

"FAIL: integrity gate did not pass (non-zero exit code)."

After FAIL (Fixed 1 line)

"This free pilot ends at PASS/FAIL. Root-cause analysis is out of scope."

PII Minimal Collection (Fixed 1 line)

"Only one email address is used for contact and deleted immediately after VERDICT."

Metrics (Scientific notation, e-format)

We publish verification metrics as measurable values (e.g., match_error = 1.2e-14, gate_error_rate = 0.0e+00).

Accuracy(4)=Truth(2)=Life(4)
