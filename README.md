# EV424 — Reproducible Integrity Receipts

[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue)](LICENSE)

**Same bytes → same SHA-256. Reproducible.**

**Don’t trust it. Verify it yourself.**

No upload. No storage. No mirroring.  
Only the official public source, the receipt, and reproducible byte identity.

EV424 is a **SHA-256-based, non-custodial integrity receipt structure** for official public-source byte identity.

More direct, faster to access, easier to re-verify, safer without original-file custody, and independently verifiable by third parties.

---

## Verify in 30 seconds

| Step | Action |
|---|---|
| 1 | Open a stable reference entry |
| 2 | Inspect the public receipt |
| 3 | Re-verify the official public source |
| 4 | Check whether the SHA-256 matches again |

| Public reference | Link |
|---|---|
| Stable reference | https://ev424verify.com/?q=EV424-ENTRY-000019 |
| Example verified entry | https://ev424verify.com/?q=EV424-ENTRY-000061 |

A claim is not evidence.  
**Evidence is a reproducible verification result.**

---

## What EV424 proves

| Layer | What EV424 verifies | Why it matters |
|---|---|---|
| Non-custody | EV424 does not store, host, or mirror the original file | Removes original-file custody risk from the EV424 side |
| Integrity | The official public source must verify again as the same bytes and same SHA-256 | A changed object cannot pass as the originally verified identical object |
| Reproducibility | The same verification result must be reproduced again by an independent third party | The result is not trapped inside operator explanation |

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

If the same verification flow is run again against the same official public source, the same byte-identity result must be reproduced again.

That means the result is not trapped inside operator explanation.  
It can be checked and verified again by an independent third party.

If it cannot be reproduced, it is not evidence.

---

## Why EV424 is materially different

| Verification structure | Primary center | Requires original upload | Stores original file | Mirrors original file | Third-party re-verifiable | Directly closes official-source byte identity |
|---|---|---:|---:|---:|---:|---:|
| EV424 | Official public source | No | No | No | Yes | Yes |
| Manual SHA-256 check | Local operator file | Sometimes | Depends | No | Limited | Limited |
| Upload-based proof service | Intermediary platform | Yes | Yes / Depends | Depends | Depends | No |
| Archive / mirror model | Stored copy | No | Yes | Yes | Depends | No |
| Signature-centered model | Signer / certificate | No | No | No | Depends | Indirect |
| Chain-anchored model | Chain inclusion | No | No | No | Yes | Indirect |

EV424 closes a different question.

**When the official public source is retrieved again, does it verify again as the same bytes?**  
**And can an independent third party verify that result again?**

That is why EV424 is more direct.

It does not begin with:

- who built it
- how it was signed
- what chain it passed through
- what intermediary stored it

It begins with the official public source itself and asks one hard question:

**Does the same official public source verify again as the same bytes?**

If yes, the receipt stands.  
If no, it does not.  
If it cannot be reproduced, it is not evidence.

---

## The verification question EV424 closes

Many verification systems are strong at proving:

- who built something
- how it was built
- what was signed
- what supply-chain path it followed

EV424 closes a different question.

**When the official public source is retrieved again, does it verify again as the same bytes?**  
**And can an independent third party verify that result again?**

That is the question EV424 closes directly.

---

## Why EV424 is more direct

Many verification approaches prove surrounding context well:

- who built something
- how it was built
- what was signed
- what supply-chain path it followed

EV424 closes a different layer.

It verifies the official public source itself, directly, by byte identity.

Not:

- who says it is the same
- who stored a copy
- who signed a statement about it

But:

- whether the official public source can still be retrieved again
- whether it is still byte-for-byte identical
- whether an independent third party can reproduce and verify that same result again

That is a more direct verification rail for public-source byte identity.

---

## Why EV424 is faster

EV424 removes unnecessary steps.

There is no:

- original-file upload
- custody transfer
- mirror lookup
- archive dependency
- wallet
- chain fee
- key ceremony

The verification target is already public.

That means the check can begin directly from:

- the official source URL
- the public receipt
- the receipt SHA-256
- the ENTRY_ID

That makes access faster, re-checking simpler, and the verification flow shorter.

---

## Why EV424 is safer

EV424 is safer because it removes original-file custody from the EV424 side.

It does not store the original file.  
It does not host the original file.  
It does not mirror the original file.

Therefore, on the EV424 side, the following are structurally zero:

- leakage of uploaded originals
- hacking of original-file storage
- leakage of mirrored original copies

This is not a policy preference.  
It is a structural consequence of non-custody.

---

## Why a third party can verify it again

A result is stronger when it is not trapped inside operator explanation.

EV424 is built so that an independent third party can run the same verification flow again against the same official public source and reproduce and verify the same byte-identity result again.

That is why EV424 is not just a claim layer.

It is a reproducible receipt structure.

The evidence is not:

- the operator’s explanation
- the platform’s authority
- the wording of the claim

The evidence is:

- the official public source
- byte identity
- SHA-256
- the reproducible receipt
- the fact that the same result can be reproduced and verified again

---

## Why this structure is necessary

Existing systems are often strong at proving authorship, signatures, build lineage, storage continuity, or chain inclusion.

But those do not always close this question:

**Can the official public source itself still be retrieved again and verified again as the same bytes?**

That gap matters.

Because in practice, people often need to know:

- whether the public file still resolves
- whether it is still the same object
- whether the result can be reproduced independently
- whether verification depends on trusting an intermediary

EV424 exists because that question is real, and because it can be verified directly.

---

## Why EV424 can justify adoption

If the goal is:

- storing files
- mirroring documents
- proving signer identity
- proving build provenance
- maintaining archival custody

then EV424 is not a replacement for every existing system.

But if the goal is:

**to verify whether an official public source still verifies again as the same bytes, without original-file custody, and with third-party reproducibility,**

then EV424 is not a minor variation.

It is a materially different verification structure.

Not because it says more.  
Because it removes more.

It removes:

- upload dependency
- custody dependency
- mirror dependency
- explanation dependency

And it replaces them with:

- official-source retrieval
- SHA-256 byte identity
- reproducible receipts
- independent re-verification

That is why EV424 can justify adoption.  
It closes a verification question that many existing approaches do not close directly.

---

## EV424’s direct advantages

| Advantage | What it means |
|---|---|
| Faster to access | Directly check by public URL, ENTRY_ID, or SHA-256 |
| Simpler to understand | One hard question, not a layered trust explanation |
| Easier to re-verify | An independent third party can follow the same flow again |
| Safer as a non-custodial structure | No original-file upload, no original-file storage, no mirroring |
| Lower friction | No keys, no blockchain, no fees, no upload workflow |

---

## Where EV424 differs from existing approaches

| Approach | Strong at | What EV424 closes directly instead |
|---|---|---|
| Manual SHA-256 tools | One-off hash checking | Public reproducible receipt continuity |
| Upload-based proof services | Proof after custody transfer | Verification without original-file upload |
| Mirroring or archiving services | Copy retention | Official-source byte re-verification without mirroring |
| Signature-centered systems | Signer or certificate trust | Re-checking public-source byte identity directly |
| Chain-based models | Inclusion or anchoring | Re-verification without wallets, chain fees, or key ceremony |

EV424 is not just a hash checker, signing tool, upload-based proof service, or archive.

Compared with manual SHA-256 tools, typical hash tools are one-off checks.  
EV424 adds:

- public verification entries
- reproducible receipts
- re-runnable verification flow
- public third-party inspectability

That means it is not just a one-time hash value.  
It extends into public verification continuity.

Compared with upload-based proof services, upload-based systems require the file to pass through an intermediary.  
EV424 does not require original-file upload.  
It fetches directly from the official URL.

That keeps the center of authority with the official public source itself, not with an intermediary.

Compared with mirroring or archiving services, archival systems keep copies.  
EV424 does not mirror the original.

That means:

- no original-file storage burden
- no mirror-custody burden
- the official public source remains the single reference point

Compared with signature-centered systems, signature systems are powerful, but often depend on pre-signing, certificates, and key infrastructure.  
EV424 is not limited to already signed documents.  
If it is an official byte-stream URL, EV424 can approach it on the same verification rail.

Compared with chain-based models, EV424 does not fundamentally require:

- wallets
- chain fees
- blockchain anchoring
- key operations

That makes it more direct for the purpose of re-checking the official public source itself.

---

## Public milestones

| Entry | Milestone |
|---|---|
| EV424-ENTRY-000040 (GW250114) | First complete end-to-end link-only reproducible verification case |
| EV424-ENTRY-000045 | The same 5-step verification flow was successfully reproduced and verified on a dynamic query-based official PDF URL |
| EV424-ENTRY-000057 | Public entry, deployment, and verification continuity were established without mirroring the original document |
| EV424-ENTRY-000066 | Latest public baseline continuity reference point |

---

## Current public status

| Public status | State |
|---|---|
| Public verification surface | Live |
| Stable reference entries | Publicly inspectable |
| Reproducible receipt flow | Publicly checkable |
| Public continuity | Extends through EV424-ENTRY-000066 |

EV424 is not just an idea.  
It already has a public verification surface that can be checked directly.

---

## Core boundary

| EV424 does not | EV424 verifies |
|---|---|
| judge truth, safety, or legality | whether the same official public source verifies again as the same bytes |
| interpret semantic meaning | whether that byte-identity result is reproducible again |
| host original files | SHA-256-based integrity continuity |
| mirror original files | independent third-party re-verification |
| redistribute original files | reproducible receipts tied to official public-source retrieval |

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

EV424 includes a private API-facing and agent-assisted operational layer. Internal implementation details remain private.

---

## Security / Tests

| Category | Status |
|---|---|
| CI build checks | Included |
| Dependency alerts | Included |

For private security reporting:

**ev424.verify@gmail.com**

---

## Skipped Entry IDs (Transparency Note)

Some Entry IDs may appear missing.  
That is due to deterministic generation rules.

| Entry ID | Reason |
|---|---|
| EV424-ENTRY-000014 | Slot reserved, but no actual entry was materialized |
| EV424-ENTRY-000015 | Demo reference only, with no actual entry artifact |

Entry ID continuity is not itself a validity requirement.

Validity is established by:

- SHA-256 verification
- reproducible receipts
- verification continuity

---

**Accuracy(4)=Truth(2)=Life(4)**
