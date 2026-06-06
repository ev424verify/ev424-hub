EV424 Policy (Normative Policy Declaration, EN-only)
Page 3 — Governance · Continuity · Independence Charter with 7-Day Re-Verification Principle

This document is a policy declaration for EV424 operations, neutrality, continuity, independence, and change management.
It preserves the existing Page3 policy charter text and adds the 7-Day Re-Verification Principle.

==================================================
[BEGIN POLICY — PAGE 3 SUCCESSOR]
==================================================

■ EV424 — Governance · Continuity · Independence Charter

(Final reinforcement for operations · neutrality · continuity / “Charter-class” standard
document /
Internal SSOT · External submission · Web Page3 shared)
Version: v2026-02-01 (Final)
Status: STANDARDIZED / LOCKED (Policy Declaration)

0) Purpose

This document formally defines EV424’s operating principles, scope of responsibility,
neutrality, continuity, independence, and change management.

EV424 operates as an “Independent Ex-Post Verification infrastructure” that is not subordinate
to any specific individual, organization, or interest.

EV424 does not ask for trust; it provides only a verifiable structure (reproduction path +
cryptographic integrity).

This document is not Terms of Service nor legal advice; it is a Policy Declaration regarding
operating principles.

1) Definitions
1.1 Artifact

An Artifact refers to a fixed file (e.g., PDF) accessible via an official/public path, and the
associated verification outputs (Receipt/Index/Manifest, etc.).

1.2 Verification

Verification is a procedure in which the same output is reproducible under the same conditions,
and at minimum includes:

- Hash computation (e.g., SHA-256)
- Chain/Index recording (Integrity Records)
- Procedure-gate pass status (PASS/FAIL)

1.3 Evidence

“Evidence” published by EV424 does not mean the authenticity/meaning/value of the content (the
original).
It means the verification outputs themselves (hash · chain · index · receipt) (= integrity
records).
(It does not guarantee evidentiary effect as “evidence” in legal/investigative contexts.)

1.4 Same Input / Same Output

Same Input = (Canonical URL + Retrieved Bytes + Procedure Version)

Same Output = (same verification output structure + same hash/result)

If the original bytes change, the result may change; such change is a detection/recording
target of EV424.

1.5 Operator

An Operator performs deployment, maintenance, and operation of the system. Operators are
replaceable.
An Operator does not have the authority to manipulate the verification rules (Procedure) to
change a specific input’s result into a “desired conclusion.”
However, an Operator may enforce operational policies—such as registration/rejection,
prioritization, eligibility, and adopting a Canonical URL—according to this document and
published criteria.

2) System Role

EV424 does not create, edit, interpret, evaluate, grade, recommend, or fact-adjudicate
documents.

The functions EV424 performs are limited to:

- Determinism (reproducibility)
- Cryptographic integrity (e.g., SHA-256)
- Chain/Index integrity (continuity)
- Structure & consistency checks (contamination/mismatch detection)

EV424’s result (PASS/FAIL) does not indicate the truth/falsehood of the content;
it indicates only whether the verification procedure passed.

3) Verification Scope

EV424 targets only materials that satisfy all conditions below.

Public Access (public accessibility)

As a rule, resources that require login/session/personal accounts/paid
subscriptions/authorization delegation are excluded.

Re-downloadable (re-downloadability)

Third parties must be able to reasonably attempt re-download based on the defined Canonical
URL.

Stable Artifact (byte stability)

The provided bytes must be fixed (static) in nature; if frequent dynamic
transformation/repacking is expected, EV424 may exclude or hold the item.

Hashable (hashability)

Standard tools must be able to compute hashes.

Reproducible Verification (reproducible verification)

Third parties must be able to verify the integrity of verification outputs via a publicly
provided minimal reproduction procedure.

If the source becomes unable to satisfy these conditions due to blocking/outage/changes, EV424
may defer/reject/suspend verification.

4) Neutrality Policy

All verification is based on fixed rules (Procedure) + published outputs (hash/receipt/index).

An operator’s subjective interpretation, negotiation, or post-hoc adjustment cannot be
reflected in verification results (PASS/FAIL).
EV424 is designed and operated so that the same output is reproducible when the Same Input
definition (1.4) is satisfied.

5) Post-Verification Principle

EV424 does not intervene in the information production/distribution stage,
and operates only as an Independent Ex-Post Verifier.

As a rule, EV424 does not perform “promotion/review/fact-checking/evaluation/recommendation.”

6) Non-Mirroring & Copyright Safety

EV424 is not intended to store, mirror, redistribute, or host original files (e.g., PDFs).

What EV424 publishes is, in principle, limited to:

- Official/Canonical URL links
- Fingerprints such as SHA-256
- Verification outputs (Receipt/Index/Manifest)
- Minimal re-verification method (e.g., sha256sum -c level)

Verification outputs are designed and operated so that they do not include the original content
(page images/body text/OCR/tables-figures captures, etc.).

7) Transparency

Within feasible limits, EV424 discloses:

- Evidence Index
- Verification Result (PASS/FAIL)
- Manifest/Chain Structure (structural info)
- Procedure Version
- Minimal Re-Verification path

Disclosure follows the principle of minimal disclosure.
PII, unnecessary metadata, and internal operational information (internal paths/internal
logs/full operational commands) are not published.

8) Liability Disclaimer

EV424 does not provide legal, medical, or financial advice.

Responsibility for decisions made using EV424 results rests with the user.

EV424 does not guarantee specific outcomes (safety/accuracy/legality/effectiveness).

EV424’s PASS does NOT mean:

- Truthfulness/accuracy/legitimacy of the content
- Verification of author/publisher identity
- Proof of earliest existence time (time of existence)
- Guarantee of copyright/license compliance

PASS means only that the verification procedure passed, under the given procedure version and
the obtained bytes.

9) Eligibility Review
Eligibility review is performed according to published criteria; ad-hoc negotiation is not
provided.

Minimum requirements:

- Public access / re-downloadability
- Byte fixity (or reasonable stability)
- Hash computability
- Minimal re-verification path can be provided

If criteria are not met, or risk is identified (PII/possible rights infringement/contamination
propagation risk, etc.),
verification may be rejected or deferred.

10) Pro Bono Policy

Pro bono verification may be provided at discretion when at least two of the following are met:

- Direct relation to human life or major safety
- Public / non-profit purpose
- Official submission / public-interest use (institution submission / public reporting, etc.)
- No alternative verification means

Pro bono verification does not allow outsourcing of commercial costs.
Provision may be limited by operating capacity, priority, and eligibility.

11) Commercial Policy

Requests from commercial organizations may be handled as paid service depending on scale,
frequency, institution type,
and additional requirements (custom reporting/priority processing, etc.).

EV424 does not use deal-by-deal negotiation structures; it operates based on published Policy +
published Category.

Whether paid/priority processing is applied may affect scheduling/throughput only;
verification rules and results (PASS/FAIL) are produced by the same procedure.

12) Operational Stability

EV424 aims, as much as possible, for stateless, static, and non-DB-dependent architecture.

Operating capacity limits exist; if request volume exceeds capability, verification provision
may be limited.
To prevent abuse/mass requests/misuse of automation, rate limits, deferrals, or blocks may be
applied.

13) Data Protection

EV424 minimizes storage of PII and prohibits publishing it.

During service operation, minimal technical logs (e.g., IP/access metadata) may occur at
hosting/mail/network layers.
EV424 minimizes such logs and avoids collecting/publishing data unnecessary for verification.

Requests with PII/sensitive exposure risk may be rejected or handled as non-public.
14) Continuity & Independence

All core procedures are documented and must be maintained in a form that third parties can
perform independently
(static outputs + hash verification).

Operators may be replaced; EV424’s continuity is ensured not by trusting operators but by:

- Reproducible public index
- Procedure versions and chain/manifest rules
- Public change logs (version/date/summary)
- Minimal dependencies (minimizing vendor/account/DB lock-in)

15) Change Management

As a rule, major policy/procedure changes are announced in advance and then applied.

All changes leave public records (version/date/change summary).
Changes prioritize backward compatibility whenever possible.

However, if urgent risks are identified (PII/rights infringement/security risk/contamination
propagation, etc.),
immediate action may be taken first, followed by post-notice and transparent closure via change
logs.

Old-version receipts retain their meaning as results based on the procedure version at the time
of issuance.

16) Anti-Misuse

It is prohibited to claim EV424’s PASS as “truth/official certification/guarantee,”
or to use EV424’s name/mark to deceive others.

If EV424 discovers such misuse, it may issue guidance/correction requests and take necessary
operational measures within an appropriate scope.

17) Contact & Jurisdiction

Official contact information and intake of correction/deletion/rights/PII-related requests
follow the latest notice published on the official site.
(Example inquiry channel: ev424.verify@gmail.com)

This document does not assert any specific country/jurisdiction; if needed, it will be
established via separate notice.

18) 7-Day Re-Verification Principle

EV424 does not treat a single verification as the end of responsibility.

Public PASS records are subject to scheduled 7-day re-verification.

If re-verification produces a SHA-256 mismatch against the previously verified fingerprint, EV424 performs cause analysis according to the defined procedure.

If a FAIL condition is confirmed, EV424 publishes one scope-accurate FAIL line for the applicable category and terminates re-verification for that item.

The FAIL record is not modified, deleted, or corrected by erasure.

The existing public record remains publicly visible together with the FAIL record.

No further re-verification is performed for the terminated item.

FAIL does not judge the truth, legality, safety, value, or meaning of the content.

FAIL records that an EV424 integrity or reproducibility condition did not pass under the defined re-verification procedure.

19) Final Declaration

EV424 does not ask for trust.
EV424 provides only a verifiable structure.
EV424 does not intervene and exists only as an independent ex-post verifier.

Accuracy(4)=Truth(2)=Life(4)


==================================================
[END POLICY — PAGE 3 SUCCESSOR]
==================================================

Accuracy(4)=Truth(2)=Life(4)
