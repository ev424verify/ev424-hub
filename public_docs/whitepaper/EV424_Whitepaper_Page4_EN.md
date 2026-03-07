TRACK B — WHITEPAPER (Informative, EN-only)

4. Operational & Governance Layer


4.1 System Boundary

EV424 operates exclusively as a deterministic verification engine.
It does not perform interpretation, evaluation, policy enforcement,
or discretionary judgement.

All outputs are limited to reproducible evidence artifacts.

This operational boundary is anchored to the system identity
defined in Page1 and is invariant across versions.


4.2 Role Separation

The system enforces strict separation between:

- Evidence generation
- Verification
- Publication
- External interpretation

No single component, operator, or process may control
multiple roles simultaneously.

Cross-role override is prohibited.


4.3 Publication Workflow

All public artifacts must satisfy the following conditions
prior to publication:

- Deterministic generation
- Hash sealing
- Chain verification
- Public index registration

Artifacts failing any condition are excluded from publication.

Unsealed or partially sealed artifacts are prohibited.


4.4 Change Control

Any modification to the following components:

- Toolchain
- Format specification
- Validation rules
- Governance procedures

requires:

- Explicit version increment
- Regeneration of all dependent hashes
- Public traceability records

All changes must preserve backward verifiability.

Previously sealed artifacts remain valid, accessible,
and independently verifiable.

Rollback and deprecation policies are publicly traceable.

Retroactive modification is forbidden.


4.5 Dispute Handling

In the event of disputes:

- Only sealed artifacts are admissible
- All claims must reference verifiable hashes
- Off-chain evidence is excluded

Resolution is limited to technical verification.

No discretionary arbitration is performed.


4.6 Archival Policy

All validated artifacts are archived under:

- Immutable storage
- Redundant replication
- Public verification access

Archival integrity is maintained indefinitely.

Deletion, replacement, or silent migration is prohibited.


4.7 Liability and Non-Scope

EV424 does not provide:

- Legal judgement
- Regulatory compliance determinations
- Safety certifications
- Policy recommendations
- Risk endorsements

All responsibility for interpretation and application
rests with external parties.


4.8 Governance Invariants

The following invariants are maintained at all times:

- Determinism
- Reproducibility
- Traceability
- Immutability
- Non-discretion

Failure of any gate defined in Page3 automatically invalidates
the corresponding artifact without discretionary override.

Violation of any invariant nullifies system output validity.
