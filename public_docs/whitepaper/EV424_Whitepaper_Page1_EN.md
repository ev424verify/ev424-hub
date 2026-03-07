EV424 Whitepaper (Informative, EN-only)
Page 1 — Large-Frame: Scope, Identity, and Boundary

This page declares the large-frame scope of EV424: what EV424 is, what it is not, and what may be treated as public evidence.
This page is informative; normative conformance rules live in the Spec.

----------------------------------------
1. Identity (Scope-only)
----------------------------------------

Official Identity Statements (EN, Official)

1) EV424 treats unverifiable information as not eligible for truth claims.
2) EV424 must be independently re-verifiable without a trusted intermediary.
3) EV424 relies on cryptographic verification events, not trust.

Clarification
- These identity statements declare scope only.
- They are not gates, not pass criteria, and must not be cited as evidence.

----------------------------------------
2. What EV424 Does / Does Not Do
----------------------------------------

EV424 DOES
- Prove byte-level sameness using SHA-256 over raw bytes (Same Bytes → Same SHA-256).
- Issue a deterministic, reproducible integrity receipt that enables independent re-verification.
- Operate non-custodially: EV424 does not take ownership of originals.

EV424 DOES NOT
- Judge truth, safety, legality, compliance, or the meaning of contents.
- Perform subjective interpretation or content analysis.
- Host, mirror, or redistribute original official documents.

----------------------------------------
3. Public Evidence Policy (Reproducible Only)
----------------------------------------

Public evidence is strictly limited to the minimum set required for independent re-verification:

- OFFICIAL_URL
  The official source location used for retrieval at issuance.

- FINGERPRINT_SHA256
  The 256-bit digest computed over the full raw bytes of the retrieved artifact.

- RE-VERIFICATION METHOD
  A reproducible method a third party can run (e.g., SHA-256 verification steps) to confirm sameness.

- FINAL RECEIPT TEXT (Integrity-only)
  A receipt that records identity, checks, and the deterministic representative fingerprint for the run.

Exclusions
- No other statements, environments, logs, displays, screenshots, narratives, or interpretations constitute evidence.

----------------------------------------
4. Determinism (Same Input → Same Output)
----------------------------------------

Definition (informative)
- Same input means: same official source bytes for the same OFFICIAL_URL (and the same retrieval target).
- Same output means: the same SHA-256 fingerprint and the same PASS/FAIL gate result under the closed gate model.

Principle
- EV424 treats reproducibility as a requirement: verification must be independently re-checkable without trusted access.

----------------------------------------
5. Publication Rule (Safety Rail)
----------------------------------------

- PASS receipts may be published as public evidence artifacts.
- FAIL receipts are not published as public evidence.
- A minimal one-line dispute/withdrawal notice may be published if required (not a receipt; no URLs, no hashes, no observables).

----------------------------------------
6. Link to Spec
----------------------------------------

Normative conformance rules live in the Spec.
Accuracy(4)=Truth(2)=Life(4)
