# EV424 Evidence Definition

- Don’t Trust, Verify
- Not a single byte changes.
- If it cannot be reproduced, it is not evidence.

What to do (30s): Open the stable reference and verify the receipt SHA-256 over time.

## README

EV424verify.com is a SHA-256–based, non-custodial integrity receipt framework.

It verifies byte-level sameness of bytes retrieved from an official source URL without storing, hosting, or mirroring original files.

Not affiliated. Link-only. No mirroring/hosting of original documents — only integrity receipts and reproducibility artifacts.

## EV424 — Reproducible Integrity Receipts

**Same Bytes → Same SHA-256**

EV424 issues a reproducible integrity receipt so that anyone can independently re-verify whether the same official source URL resolves to the same bytes under the same verification flow.

## EV424 does NOT

- judge truth, safety, or legality
- analyze content
- host, mirror, or redistribute original files

## Milestones

- **EV424-ENTRY-000040 (GW250114):** first end-to-end case closed with link-only verification, reproducible receipt generation, and locally reproduced artifacts sealed by SHA-256.
- **EV424-ENTRY-000045 (European Commission, “White paper for European defence – Readiness 2030”):** the unchanged EV424 5-step receipt rail also closed on a query-based official PDF download URL, without adding a special-case path.

## Local reproducibility (Preflight Spec)

Note: This document defines the contract; implementation may be added in later commits.

Don’t trust claims. Trust the exit code, SHA-256, and the normalized JSON.

See: `docs/local_repro_preflight_spec_v2026-02-21_en.md`

## 30-second demo

Stable reference (always available):  
https://ev424verify.com/?q=EV424-ENTRY-000019

Latest verified entry (updated):  
https://ev424verify.com/?q=EV424-ENTRY-000045

## Security / Tests (baseline)

This repository follows a minimal security baseline (CI build checks + dependency alerts).

Report security issues privately: ev424.verify@gmail.com

## Skipped Entry IDs (Transparency Note)

Some Entry IDs may appear missing due to deterministic generation rules.

- **EV424-ENTRY-000014:** Slot reserved but not materialized (no entry artifact generated)
- **EV424-ENTRY-000015:** Demo reference only (no actual entry file existed)

Entry ID continuity is not a validity requirement.

Validity is established by SHA-256 verification and reproducible receipts.

**Accuracy(4)=Truth(2)=Life(4)**
