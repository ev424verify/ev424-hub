# EV424 — Reproducible Integrity Receipts

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue)](LICENSE)

**Same bytes → same SHA-256. Reproducible.**  
**Don’t trust it. Verify it yourself.**

No upload. No storage. No mirroring.  
Only the official public source, the receipt, and reproducible byte identity.

EV424 is a **SHA-256-based, non-custodial integrity receipt structure** for official public-source byte identity.

Direct, publicly checkable, independently re-verifiable, and already operating as a live verification surface.

---

## Verify in 30 seconds

1. Open a public reference entry.
2. Inspect the receipt.
3. Re-verify the official public source.
4. Check whether the SHA-256 matches again.

**Stable reference entry**  
https://ev424verify.com/?q=EV424-ENTRY-000019

**Recent public entry**  
https://ev424verify.com/?q=EV424-ENTRY-000070

A claim is not evidence.  
**Evidence is a reproducible verification result.**

---

## What EV424 proves

### 1. Non-custody

EV424 does not store the original file.  
It does not host the original file.  
It does not mirror the original file.

Therefore, on the EV424 side, the following are structurally zero:

- leakage of uploaded originals
- hacking of original-file storage
- leakage of mirrored original copies

This is not a policy preference.  
It is a structural consequence of non-custody.

### 2. Integrity

EV424 verifies whether bytes retrieved again from an official public source remain byte-for-byte identical.

Objects that pass verification are fixed by SHA-256.

Therefore, passing a changed object off as if it were the originally verified identical object is structurally zero.

### 3. Reproducibility

The same verification result must be reproducible again from the same official public source.

That means the result is not trapped inside operator explanation.  
It can be checked again by an independent third party.

If it cannot be reproduced, it is not evidence.

---

## Why EV424 is materially different

| Structure | Centers on | Proves directly |
|---|---|---|
| EV424 | Official public source | Same-source byte identity |
| Manual SHA-256 check | Local file | One-off file hash check |
| Upload-based proof service | Intermediary platform | Proof after upload |
| Archive / mirror model | Stored copy | Copy retention |
| Signature-centered model | Signer / certificate | Signature validity |
| Chain-anchored model | Chain record | Inclusion / anchoring |

EV424 centers on the **official public source itself**, not on upload, storage, or mirrored custody.

It asks one direct question:

**When the official public source is retrieved again, is it still the same bytes?**

That is the difference.

---

## Why this matters in practice

Many systems are strong at proving:

- who built something
- what was signed
- what storage or archive retained
- what chain or platform recorded it

EV424 closes a different and immediately practical question:

**Can the official public source itself be retrieved again and verified again as the same bytes?**

That matters when people need to know:

- whether the public file still resolves
- whether it is still the same object
- whether the result can be reproduced independently
- whether verification depends on trusting an intermediary

---

## Direct advantages in practice

- **Faster to access** — check directly by public URL, ENTRY_ID, or SHA-256
- **Simpler to understand** — one direct verification question
- **Easier to re-verify** — an independent third party can run the same flow again
- **Safer as a non-custodial structure** — no original-file upload, no original-file storage, no mirroring
- **Lower friction** — no keys, no blockchain, no fees, no upload workflow

---

## Public milestones

- **EV424-ENTRY-000040 (GW250114)** — first complete end-to-end link-only reproducible verification case
- **EV424-ENTRY-000045** — the same 5-step verification flow was successfully reproduced and verified on a dynamic query-based official PDF URL
- **EV424-ENTRY-000057** — public entry, deployment, and verification continuity were established without mirroring the original document
- **EV424-ENTRY-000070** — latest public baseline continuity reference point

---

## Current public status

- Public verification surface: **Live**
- Stable reference entries: **Publicly inspectable**
- Reproducible receipt flow: **Publicly checkable**
- Public continuity: **Extends through EV424-ENTRY-000070**

EV424 is not just a concept.  
It already operates as a live public verification surface that can be checked directly.

---

## Core boundary

EV424 does **not**:

- judge truth, safety, or legality
- interpret semantic meaning
- host original files
- mirror original files
- redistribute original files

EV424 **does** verify:

- whether the same official public source verifies again as the same bytes
- whether that byte-identity result is reproducible again
- SHA-256-based integrity continuity
- independent third-party re-verification
- reproducible receipts tied to official public-source retrieval

EV424 is not a semantic judgment engine.  
It is an integrity and reproducibility structure.

---

## Local reproducibility (Preflight Spec)

This repository contains EV424’s public verification contract.

Do not trust claims.  
Trust the exit code, SHA-256, and normalized JSON.

---

## Public project boundary

Licensed under the **Apache License 2.0**. See `LICENSE`.

Repository-owned code and content are licensed under the Apache License 2.0 unless otherwise noted.

Additional notices are provided in `NOTICE`.

EV424-specific operational, legal, and third-party document boundaries are described in `LEGAL_NOTICE.md`.

EV424 already includes a private API-facing and agent-assisted operational layer for non-public operation and expansion. Internal implementation details remain private.

---

## Security

- CI build checks: **Included**
- Dependency alerts: **Included**

For private security reporting:

**ev424.verify@gmail.com**

---

## Skipped Entry IDs (Transparency Note)

Some Entry IDs may appear missing.  
That is due to deterministic generation rules.

- **EV424-ENTRY-000014** — slot reserved, but no actual entry was materialized
- **EV424-ENTRY-000015** — demo reference only, with no actual entry artifact

Entry ID continuity is not itself a validity requirement.

Validity is established by:

- SHA-256 verification
- reproducible receipts
- verification continuity

---

**Accuracy(4)=Truth(2)=Life(4)**
