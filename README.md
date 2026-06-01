# EV424 — Reproducible Integrity Verification Infrastructure

> A claim is not evidence.
> Evidence is a reproducible verification result.

**Same bytes → same SHA-256. Reproducible.**
**No upload. No storage. No mirroring.**

EV424 is a non-custodial integrity verification infrastructure for official public-source digital artifacts.

It records whether an official digital artifact can be re-verified as the same bytes — without storing, mirroring, redistributing, or interpreting the original.

EV424 now maintains public evidence rails for both Document Passport and Video Passport v0.1, under the same constitutional boundary:

**Integrity. Reproducibility. Non-custody.**

[Live Verify](https://ev424verify.com) · [Public Evidence Index](https://ev424verify.com/public_data/) · [Video Verify](https://ev424verify.com/video/) · [Whitepaper](https://ev424verify.com/whitepaper.html) · [Legal Notice](LEGAL_NOTICE.md) · [Contact](mailto:ev424.verify@gmail.com)

---

## What EV424 Is

EV424 is an independent integrity-verification infrastructure.

It records whether an official digital artifact can be re-verified as the same bytes from its official public source.

EV424 does **not** store, mirror, redistribute, or interpret the original file.

---

## Why EV424 Exists

In the AI era, documents can be generated, summarized, cited, copied, and circulated faster than humans can manually inspect them.

Before asking whether a document is true, safe, legal, or meaningful, the first integrity question is:

> Is this the same file?

EV424 closes that first integrity layer.

---

## What SHA-256 Means Here

SHA-256 is a cryptographic hash algorithm from the SHA-2 family.

In EV424, SHA-256 acts as a digital fingerprint:

- the same bytes produce the same SHA-256 hash
- even a one-bit change produces a different hash
- the hash does not prove truth
- the hash makes byte-level change detectable and re-verifiable

EV424 uses SHA-256 to turn official-source bytes into reproducible integrity receipts.

---

## Core Principles

| Principle | Meaning |
|---|---|
| **Non-Custodial** | No upload, no original-file storage, no mirroring. |
| **Deterministic** | Same official bytes produce the same SHA-256 result. |
| **Integrity-Only** | EV424 verifies sameness, not truth, safety, legality, or meaning. |
| **Re-Verifiable** | A third party can independently check the same source and hash. |
| **No-Overwrite** | Closed evidence artifacts must not be silently mutated. |

---

## How Verification Works

```text
Official public source
        ↓
Retrieved raw bytes
        ↓
SHA-256 fingerprint
        ↓
G1-G5 integrity gates
        ↓
FINAL RECEIPT
        ↓
Independent re-verification
```

| Gate | Meaning |
|---|---|
| G1 | Source accessibility |
| G2 | Byte identity over raw bytes |
| G3 | Local reproduction |
| G4 | Official re-download match |
| G5 | No-overwrite / immutability |

A PASS result requires all required gates to pass. No discretionary override is part of the verification result.

---

## Verify in 30 Seconds

1. Open a public EV424 entry.
2. Inspect the FINAL RECEIPT.
3. Re-download the official public source.
4. Compute SHA-256.
5. Check whether the hash matches.

Stable reference entry:

- https://ev424verify.com/?q=EV424-ENTRY-000006

Recent public entry:

- https://ev424verify.com/?q=EV424-ENTRY-000179

---

## What PASS Means

PASS means:

- the defined integrity procedure passed
- the official source bytes were hashed
- the recorded fingerprint was reproduced
- the re-download match was checked
- the receipt was closed under the EV424 procedure

PASS does **not** mean:

- the content is true
- the content is safe
- the content is legal
- EV424 endorses the issuer
- EV424 verifies author identity
- EV424 proves earliest existence time
- EV424 provides legal, medical, financial, investment, safety, or policy advice

EV424 is not a semantic judgment engine.
It is an integrity and reproducibility structure.

---

## What EV424 Does / Does Not Do

| EV424 does | EV424 does not |
|---|---|
| Verify byte-level sameness | Judge truth or falsehood |
| Publish SHA-256 fingerprints | Host original PDFs |
| Publish FINAL RECEIPTS | Mirror or redistribute originals |
| Enable independent re-verification | Interpret meaning or intent |
| Maintain public evidence indexes | Provide legal, medical, financial, or policy advice |

---

## Public Evidence Examples

| Entry | Source | Meaning |
|---|---|---|
| [EV424-ENTRY-000006](https://ev424verify.com/?q=EV424-ENTRY-000006) | NIST.SP.800-228.pdf | Stable reference entry with revalidation continuity |
| [EV424-ENTRY-000179](https://ev424verify.com/?q=EV424-ENTRY-000179) | NIST.AI.100-2e2025.pdf | Recent public document passport example |
| [EV424-VIDEO-ENTRY-000002](https://ev424verify.com/video/?q=EV424-VIDEO-ENTRY-000002) | NIST video public projection | Video Passport v0.1 public evidence rail example |

---

## Why Re-Verifiable Evidence Matters Now

Digital trust is moving beyond “who said it,” “where it was stored,” or “what platform recorded it.”

In the AI era, documents, summaries, citations, reports, and copies can move faster than people can manually inspect them.

That creates a new baseline question:

> Can the official public source be independently re-verified as the same bytes?

EV424 focuses on this gap.

It does not replace signatures, storage systems, archives, blockchains, or AI provenance layers.

It closes a different layer: official-source byte identity, verified through SHA-256, FINAL RECEIPT, and independent re-verification.

---

## EV424 vs Existing Verification Models

| Verification model | Main trust center | Strong at | Remaining gap in the AI era | EV424 focus |
|---|---|---|---|---|
| E-signature | Signer / certificate | Approval, agreement workflow, signer validity | Does not directly answer whether an official public source still re-downloads as the same bytes | Official-source byte identity |
| Document storage / DMS | Repository / stored copy | Access control, retention, collaboration | Requires custody or platform trust | Non-custodial verification |
| Archive / mirror | Retained copy | Preservation of a copy | Copy retention is not the same as official-source re-verification | Link-only receipt, no mirroring |
| Blockchain anchoring | Chain record | Inclusion, anchoring, timestamp-like proof | Chain inclusion does not itself prove current official-source byte sameness | Re-download match from official source |
| Manual SHA-256 | Local file | Simple one-off fingerprint | No public receipt, index, continuity, or exact-search rail | Reproducible public receipt |
| AI provenance metadata | Origin / generation metadata | Creator or content-origin signal | Metadata can describe origin but may not close official file sameness | SHA-256 same-file evidence |
| EV424 | Official public source | Same-source byte identity, receipt, re-verification | Integrity-only by design; not a truth judgment engine | Independent non-custodial evidence rail |

EV424 asks one direct question:

> When the official public source is retrieved again, is it still the same bytes?

That question becomes more important as AI-generated summaries, citations, documents, and automated workflows scale across the digital environment.

---

## Video Passport v0.1

EV424 Video Passport extends the same verification philosophy from documents to official public video-source references.

A Video Passport does **not** host, copy, mirror, download, or redistribute the original video.

Instead, it publishes a non-custodial public projection that can include:

- provider
- official public source reference
- VIDEO_ENTRY_ID
- receipt / projection metadata
- reproducible integrity signals
- re-verification path

The purpose is not to judge whether a video is true, safe, legal, authentic, edited, or endorsed.

The purpose is to create a reproducible, non-custodial evidence rail so future observations can be compared against a closed public verification record.

Public example:

- https://ev424verify.com/video/?q=EV424-VIDEO-ENTRY-000002

---

## Public / Private Boundary

This repository is a public verification surface, not the full internal engine.

| Public surface | Private engine |
|---|---|
| Official URLs | Issuance engine |
| ENTRY_ID | Internal candidate and eligibility logic |
| SHA-256 fingerprints | Internal scripts and operational logs |
| FINAL RECEIPTS | Private SSOT |
| public_data index/catalog/toc | Optional sidecar proof layers |
| Policy / whitepaper pages | API / agent implementation |

EV424 publishes the minimum evidence needed for independent re-verification.

Internal implementation details remain private to protect the verification engine and prevent operational-surface contamination.

---

## Roadmap

| Stage | Direction |
|---|---|
| 2026 Foundation | Document Passport, Video Passport v0.1, public receipts, exact-search |
| 2027 Productization | API/SDK, enterprise verification workflow, multi-type re-verification |
| 2028 Infrastructure | Institutional integration, independent verification engine |
| Always | Non-custody, no-overwrite, reproducible evidence |

---

## Public Project Boundary

Licensed under the Apache License 2.0. See [LICENSE](LICENSE).

Repository-owned code and content are licensed under the Apache License 2.0 unless otherwise noted.

Additional notices are provided in [NOTICE](NOTICE).

EV424-specific operational, legal, and third-party document boundaries are described in [LEGAL_NOTICE.md](LEGAL_NOTICE.md).

---

## Security / Contact

For private security reporting or correction/removal requests:

- ev424.verify@gmail.com

Please include the relevant `ENTRY_ID` or 64-hex PASS hash when requesting correction or removal.

---

## Skipped Entry IDs

Some Entry IDs may appear missing due to deterministic generation rules.

- EV424-ENTRY-000014 — slot reserved, but no actual entry was materialized
- EV424-ENTRY-000015 — demo reference only, with no actual entry artifact

Entry ID continuity is not itself a validity requirement.

Validity is established by:

- SHA-256 verification
- reproducible receipts
- verification continuity

---

Accuracy(4)=Truth(2)=Life(4)
