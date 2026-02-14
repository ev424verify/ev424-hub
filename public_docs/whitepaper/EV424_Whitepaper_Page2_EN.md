EV424 Whitepaper (Informative, EN-only)
Page 2 — Mid-Frame: Reproducibility & Integrity Gates (Closed Model)

This page defines a fixed, closed evaluation model for integrity verification.
This page is informative; normative conformance rules live in the Spec.

----------------------------------------
1. Evaluation Model (Closed Gate Set)
----------------------------------------

Each verification run evaluates a fixed and closed set of integrity gates.

G = { G1, G2, G3, G4, G5 }

Each gate returns exactly one value:

Gi ∈ { PASS, FAIL }

Overall result:

PASS  ⇔  ∀ Gi ∈ G : Gi = PASS
FAIL  ⇔  ∃ Gi ∈ G : Gi = FAIL

Rules
- All gates must PASS for a PASS result.
- No discretionary override is permitted.
- The gate set is closed: gates are not added/removed within a run.

----------------------------------------
2. Gate Set (G1..G5)
----------------------------------------

G1 — Source Accessibility Gate  
Purpose
- Verify that the official source artifact can be retrieved as a complete object suitable for hashing.

PASS iff
- HTTP status ∈ {200, 206}
- Response body is complete (no truncation for the intended retrieval mode)
- Content length is verified (when applicable / available)

FAIL otherwise


G2 — Byte Identity Gate  
Purpose
- Establish the canonical 256-bit fingerprint over the retrieved raw bytes.

PASS iff
- SHA-256 digest is computed over the full raw bytes of the retrieved artifact
- The digest is stable for the same retrieved bytes within the run

FAIL otherwise


G3 — Local Reproducibility Gate  
Purpose
- Ensure the locally stored artifact fingerprint can be reproduced deterministically.

PASS iff
- A local re-hash reproduces the same SHA-256 fingerprint as recorded for the run

FAIL otherwise


G4 — Official Re-download Match Gate  
Purpose
- Ensure the official source can be re-downloaded and matches the recorded fingerprint (byte-sameness check).

PASS iff
- Re-download from OFFICIAL_URL yields the same SHA-256 fingerprint as the recorded fingerprint

FAIL otherwise


G5 — Immutability / No-Overwrite Gate  
Purpose
- Prevent silent mutation of the run artifact set; enforce append-only behavior for issued artifacts.

PASS iff
- Re-running the issuance step for the same target must be blocked (overwrite forbidden)
- The block is observable (non-zero return / explicit refusal)

FAIL otherwise

----------------------------------------
3. Notes (Non-Interpretive)
----------------------------------------

- A PASS result means: all integrity gates passed for the official source bytes at issuance.
- A FAIL result means: at least one gate failed; this is an observable integrity outcome, not a content judgment.
- EV424 does not claim truth or correctness of the document; it only records a reproducible sameness event.
Accuracy(4)=Truth(2)=Life(4)
