# Local Repro Preflight Spec (Exit Code + SHA-256 + Normalized JSON)
**Version:** v2026-02-21 (KST)  
**Scope:** Public (EN-only)

## 0) Purpose
“Don’t trust me” is enforced as machine-verifiable output:
- **Exit code**
- **SHA-256**
- **Normalized JSON**

Independent engineers can reproduce locally and publish results (issues/comments/CI artifacts) to accumulate public trust.

---

## 1) Trust Chain (End-to-End)
1) `git clone`  
2) **Gate-0: Script Integrity** (verify script SHA-256)  
3) Select mode: **OFFLINE (default)** / **NETWORK (opt-in)**  
4) Run `preflight`  
5) Produce standard artifacts:  
   - `exit code`
   - `out/preflight_result.json`
   - `out/preflight_result.json.sha256`
6) (Optional) CI matrix runs the same command and uploads artifacts  
7) (Optional) Issue template collects the fixed fields

---

## 2) Claims / Coverage / Not Covered (Hard Fence)
### 2.1 Claims (Fixed Labels)
- **CLAIM.EVIDENCE**: Evidence = identical bytes  
- **CLAIM.REPRODUCIBLE**: independent machines, same input → same output (**exit code + SHA-256 + normalized JSON**)

### 2.2 Coverage (Fixed Labels)
- **COVERAGE.PREFLIGHT.OFFLINE**: declared local manifests only (network = 0)  
- **COVERAGE.PREFLIGHT.NETWORK**: optional remote checks only (opt-in)

### 2.3 NOT_COVERED (No Over-Claim)
- **NOT_COVERED.CONTENT_TRUTH**
- **NOT_COVERED.SOURCE_AUTHORITY**
- **NOT_COVERED.AVAILABILITY**
- **NOT_COVERED.USER_ENV_SECURITY**
- **NOT_COVERED.NON_DECLARED_FILES**

**Rule:** Even if PASS, any wording that “guarantees / implies / extends” beyond NOT_COVERED is forbidden.

---

## 3) Status Machine (Exit Code Contract)
### 3.1 Status + Exit Code (Fixed 4 States)
- **STATUS.PASS → exit 0**: all required checks OK  
- **STATUS.FAIL → exit 1**: **evidence mismatch only** (hash/required structure/required files mismatch)  
- **STATUS.USAGE → exit 2**: missing deps/args/privileges (not an evidence mismatch)  
- **STATUS.NETWORK → exit 3**: network steps cannot run / unstable (not an evidence mismatch)

### 3.2 Single Exit Path (Mandatory)
All termination must go through a single `finalize(status, code)` path.  
Early exits (including `set -e` failures) must be normalized via `trap` into USAGE/NETWORK/FAIL.

---

## 4) Mode Rail (OFFLINE Default / NETWORK Opt-In)
### OFFLINE (Default)
- Verifies **local integrity only**
- Network checks are **SKIP**
- Only iterates **declared(manifested)** targets (no brute-force tree scan)

### NETWORK (Opt-In: `--network`)
- Remote HEAD/re-download checks are allowed
- Network failure must result in **STATUS.NETWORK / exit 3**
- Network failure must **not** be escalated to FAIL(1)

---

## 5) Toolchain Gates (Cross-Platform)
- Hash tool auto-detect: `sha256sum` OR `shasum -a 256`
- JSON normalization: **jq required** (missing → exit 2)
- Network mode: **curl required** (missing → exit 2)

**Rule:** tool absence must never mix into FAIL(1). It must be USAGE(2).

---

## 6) Determinism & Safety Gates
- JSON keys sorted + lists sorted (always)
- No timestamps by default (optional only)
- No absolute paths, home paths, tokens, SSH keys, or environment dumps in JSON or stdout
- Writes only under `out/` (default read-only; no repo overwrite)

---

## 7) Repo Layout (Fixed)
- `scripts/ev424_pages_preflight_gate.sh`
- `scripts/ev424_pages_preflight_gate.sh.sha256`
- `scripts/lib/platform.sh`
- `scripts/lib/json.sh`
- `scripts/lib/checks.sh`
- `out/` (gitignored)
- `.github/workflows/preflight.yml`
- `.github/ISSUE_TEMPLATE/repro_report.md`

---

## 8) CLI (Fixed)
Default (OFFLINE):
- `./scripts/ev424_pages_preflight_gate.sh`

Options:
- `--offline` (default)
- `--network` (opt-in)
- `--out-dir out`
- `--strict` (optional warning escalation)
- `--selftest`

---

## 9) Check Labels (OK / FAIL / SKIP Only)
### Required (OFFLINE)
- `CHECK.SCRIPT_INTEGRITY`
- `CHECK.PUBLIC_TOC_SHA256`
- `CHECK.PUBLIC_INDEX_SHA256`
- `CHECK.PUBLIC_ENTRIES_SHA256`
- `CHECK.PUBLIC_STRUCTURE_COUNTS` (declared targets only)

### Opt-In (NETWORK)
- `CHECK.REMOTE_HEAD_BASELINE`
- `CHECK.REMOTE_REDOWNLOAD_MATCH` (only when needed)

### Self-Test
- `CHECK.SELF.DETERMINISM_JSON_SHA256`
- `CHECK.SELF.EXIT_CODE_MAPPING`
- `CHECK.SELF.NO_SENSITIVE_OUTPUT`

---

## 10) Self-Test Mode
Run:
- `./scripts/ev424_pages_preflight_gate.sh --selftest`

Must verify:
- Same input twice → identical `out/preflight_result.json.sha256`
- Exit-code mapping never mixes (USAGE/NETWORK/FAIL separation is preserved)
- Sensitive patterns in stdout/result.json cause a hard block

---

## 11) Standard Artifacts (Mandatory 3)
- `exit code`
- `out/preflight_result.json`
- `out/preflight_result.json.sha256`

Stdout (recommended minimum):
- `STATUS=... EXIT=... MODE=...`
- `SCRIPT_SHA256=...`
- `RESULT_JSON_SHA256=...`

---

## 12) `preflight_result.json` Schema (Final)
Required keys:
- `claim`: `["CLAIM.EVIDENCE","CLAIM.REPRODUCIBLE"]`
- `coverage`: `"COVERAGE.PREFLIGHT.OFFLINE" | "COVERAGE.PREFLIGHT.NETWORK"`
- `not_covered`: `["NOT_COVERED.*", ...]`
- `status`: `"STATUS.PASS" | "STATUS.FAIL" | "STATUS.USAGE" | "STATUS.NETWORK"`
- `exit_code`: `0 | 1 | 2 | 3`
- `mode`: `"offline" | "network"`
- `script_sha256`: `"64hex"`
- `toolchain`: `{ "hash_tool": "...", "jq": "...", "curl": "..."? }`
- `checks`: `{ "CHECK.*": "OK|FAIL|SKIP" }`
- `result_rep_sha256`: `"64hex" | null`
- `rep_target`: `"declared set description" | null`
- `env`: `{ "os": "...", "arch": "...", "shell": "...", "bash": "..." }`
- `policy`:
  - `fail_means`: `"evidence_mismatch_only"`
  - `usage_means`: `"missing deps/args/privileges"`
  - `network_fail_is`: `"STATUS.NETWORK"`
  - `declared_scope_only`: `true`

---

## 13) CI (Trust Amplifier)
- Matrix: **ubuntu + macOS** must PASS (Windows optional / non-blocking)
- CI command must match README quickstart exactly
- Upload artifacts: `preflight_result.json` + `.sha256`
- CI must run `--selftest`

---

## 14) Issue Template (Trust Accumulator)
Required paste fields (minimum):
- OS/arch
- script SHA verify result
- `preflight_result.json.sha256`
- exit code  
(Optional) checkbox: “I understand NOT_COVERED is not guaranteed.”

---

## 15) Fixed Public Message (EN-only)
**“Don’t trust me. Trust the exit code, SHA-256, and the normalized JSON.”**  
PASS meaning must remain inside the coverage fence; NOT_COVERED is explicitly non-guaranteed.

Accuracy(4)=Truth(2)=Life(4)