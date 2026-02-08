# EV424 — Reproducible Integrity Receipts (Same Bytes → Same SHA-256)

EV424 issues a reproducible integrity receipt so anyone can re-verify that an official document is still byte-identical (Same Bytes → Same SHA-256).

EV424 does NOT: judge truth/safety/legality, analyze content, or host/mirror the original file.

## 30-second demo
- Verify by Entry ID:
  - https://ev424verify.com/?q=EV424-ENTRY-000016

---

# EV424 — 재검증 가능한 무결성 영수증 (Same Bytes → Same SHA-256)

EV424는 누구나 제3자로서 “공식 문서가 지금도 바이트 단위로 동일한지”를 재검증할 수 있도록, 무결성 영수증(Integrity Receipt)을 발행합니다.

EV424는 하지 않습니다: 진실/안전/적법성 판정, 내용 분석, 원문 파일 보관/미러링/재배포.

## 30초 데모
- 엔트리 ID로 검증:
  - https://ev424verify.com/?q=EV424-ENTRY-000016

## Security / Tests (baseline)

EN) This repo follows a minimal security baseline (CI build checks + dependency alerts).
KR) 이 저장소는 최소 보안 기준(CI 빌드 체크 + 의존성 알림)을 적용합니다.
EN) Report security issues privately: ev424.verify@gmail.com
KR) 보안 이슈는 비공개로 제보 부탁드립니다: ev424.verify@gmail.com

Accuracy(4)=Truth(2)=Life(4)

---

## Skipped Entry IDs (Transparency Note)

Some entry IDs may appear missing due to the deterministic generation process.

- **EV424-ENTRY-000014**: Slot reserved but not materialized (no entry artifact generated)
- **EV424-ENTRY-000015**: Demo reference only (no actual entry file existed)

Entry ID continuity is not a validity requirement.
Integrity is guaranteed solely by SHA-256 verification and reproducible receipts.

일부 엔트리 번호는 생성 과정 중 중단으로 인해 실제 파일이 만들어지지 않을 수 있습니다.

- **EV424-ENTRY-000014**: 슬롯은 생성되었으나 엔트리 파일이 생성되지 않음
- **EV424-ENTRY-000015**: 데모용 참조로만 사용됨 (실제 엔트리 없음)

엔트리 번호의 연속성은 무결성 조건이 아닙니다.
무결성은 SHA-256과 재현 가능한 영수증으로만 보장됩니다.

