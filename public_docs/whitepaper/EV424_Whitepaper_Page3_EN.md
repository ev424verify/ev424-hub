EV424 Whitepaper (Informative, EN-only)
Page 3 — Small-Frame: Deterministic Gates (G1..G5)

This page describes the closed integrity gate set used for PASS/FAIL in an EV424 verification run.
This page is informative; normative conformance rules live in the Spec.

----------------------------------------
1. Evaluation Model (Closed Gate Set)
----------------------------------------

Each verification run evaluates a fixed and closed set of integrity gates:

G = { G1, G2, G3, G4, G5 }

Each gate outputs exactly one of:
Gi ∈ { PASS, FAIL }

Result rule:

PASS  ⇔  ∀ Gi ∈ G : Gi = PASS
FAIL  ⇔  ∃ Gi ∈ G : Gi = FAIL

No discretionary override is permitted.
No partial PASS exists.

Notes
- EV424 does not judge truth, safety, legality, or meaning of contents.
- PASS/FAIL refers only to cryptographic and reproducible sameness checks over bytes.

----------------------------------------
2. Gate Definitions (G1..G5)
----------------------------------------

G1 — Source Accessibility Gate

Purpose
Verify that the official source artifact is retrievable in a complete and reproducible manner.

PASS iff
- The official URL retrieval is successful and complete (no missing body).
- HTTP status indicates a successful retrieval (e.g., 200; optionally 206 only if completeness is still verified).
- Content type is consistent with the expected artifact format (e.g., application/pdf for PDF targets).
- Content length / completeness is verifiable (explicit length or equivalent completeness proof).

FAIL otherwise.

Observables (non-exhaustive)
- http_status
- content_type
- content_length (if provided)
- retrieval_complete (boolean)

----------------------------------------

G2 — Byte Identity Gate

Purpose
Bind the artifact to an immutable 256-bit fingerprint computed over the retrieved raw bytes.

PASS iff
- The SHA-256 digest is computed over the full raw bytes of the retrieved artifact.
- The digest is recorded as the artifact fingerprint for this run.

FAIL otherwise.

Observables (non-exhaustive)
- sha256_fingerprint (64-hex)
- fingerprint_source = "raw_bytes"

----------------------------------------

G3 — Local Reproduction Gate

Purpose
Ensure the fingerprint can be re-produced locally from the stored artifact bytes without ambiguity.

PASS iff
- Recomputing SHA-256 over the stored local artifact bytes reproduces the same fingerprint as G2.

FAIL otherwise.

Observables (non-exhaustive)
- local_sha256_repro_match (boolean)

----------------------------------------

G4 — Independent Re-download Match Gate

Purpose
Confirm the official source can be independently re-downloaded and matches the local artifact at byte level.

PASS iff
- A fresh re-download from the same official URL produces the exact same SHA-256 fingerprint as G2/G3.

FAIL otherwise.

Observables (non-exhaustive)
- redownload_sha256 (64-hex)
- redownload_match (boolean)

----------------------------------------

G5 — Immutability / Non-Overwrite Gate

Purpose
Prevent silent mutation of recorded evidence artifacts by enforcing append-only behavior.

PASS iff
- A repeated attempt to create the same artifact under the same identity tuple is rejected (overwrite forbidden),
  and the system returns a non-zero result (indicating it did not overwrite).

FAIL otherwise.

Observables (non-exhaustive)
- overwrite_blocked (boolean)
- overwrite_attempt_rc (non-zero required for PASS)

----------------------------------------
3. Interpretation Boundaries (Non-Negotiable)
----------------------------------------

- PASS is not a truth claim. It only attests byte-level sameness and reproducibility at issuance and re-check time.
- FAIL is not a claim about content; it only indicates at least one required integrity/reproducibility gate did not pass.
- EV424 is non-custodial and does not host/mirror original official documents.
- Public outputs must not include private infrastructure identifiers, internal paths, or raw logs.
Accuracy(4)=Truth(2)=Life(4)
