# EV424 Evidence Definition

Licensed under the Apache License 2.0. See `LICENSE`.

EV424 includes an implemented API-facing and agent-assisted operational layer. Internal implementation details remain private.

**Don't Trust, Verify.**

EV424 is a SHA-256-based, non-custodial integrity receipt framework.

It verifies whether bytes retrieved from an official source URL are byte-for-byte identical, without storing, hosting, or mirroring the original files.

If it cannot be reproduced, it is not evidence.

## What to do in 30 seconds

Open the stable reference and check whether the receipt SHA-256 remains the same over time.

Stable reference (always available):

- https://ev424verify.com/?q=EV424-ENTRY-000019

Example verified entry:

- https://ev424verify.com/?q=EV424-ENTRY-000061

## Core boundary

Not affiliated. Link-only. No mirroring or hosting of original documents - only integrity receipts and reproducibility artifacts.

EV424 does **not**:

- judge truth, safety, or legality
- analyze content
- host, mirror, or redistribute original files

## Reproducible Integrity Receipts

**Same bytes -> same SHA-256.**

EV424 issues a reproducible integrity receipt so that anyone can independently re-verify whether the same official source URL resolves to the same bytes under the same verification flow.

## Milestones

- **EV424-ENTRY-000040 (GW250114):** first end-to-end verification case completed with link-only verification, reproducible receipt generation, and locally reproduced artifacts sealed by SHA-256.
- **EV424-ENTRY-000045 (European Commission, White paper for European defence - Readiness 2030):** the same EV424 5-step receipt flow also completed successfully on a query-based official PDF download URL, without requiring a special-case path.
- **EV424-ENTRY-000057 (CISA Roadmap for Artificial Intelligence 2023-2024):** the same reproducibility-first rail also closed through receipt issuance, public entry completion, deployment, and public verification continuity without mirroring the original document.

## Local reproducibility (Preflight Spec)

This repository includes an implemented API-facing and agent-assisted operational layer, and this document defines the local reproducibility and preflight contract for verifying that flow.

Don't trust claims. Trust the exit code, SHA-256, and the normalized JSON.

See:

## Security / Tests (baseline)

This repository follows a minimal security baseline (CI build checks + dependency alerts).

Report security issues privately: `ev424.verify@gmail.com`

## Skipped Entry IDs (Transparency Note)

Some Entry IDs may appear missing due to deterministic generation rules.

- **EV424-ENTRY-000014:** Slot reserved but not materialized (no entry artifact generated)
- **EV424-ENTRY-000015:** Demo reference only (no actual entry file existed)

Entry ID continuity is not a validity requirement.

Validity is established by SHA-256 verification and reproducible receipts.

## License and Project Boundary

Repository-owned code and repository-owned content are licensed under the Apache License 2.0 unless otherwise noted. See `LICENSE`.

Additional repository notices are provided in `NOTICE`.

EV424-specific operational, legal, and third-party document boundaries are described in `LEGAL_NOTICE.md`.

Accuracy(4)=Truth(2)=Life(4)
