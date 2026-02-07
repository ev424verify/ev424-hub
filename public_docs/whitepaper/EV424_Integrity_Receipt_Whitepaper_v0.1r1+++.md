TRACK B — WHITEPAPER (Informative, EN-only) — FINAL v0.1r1+++

1. Executive Summary
EN (Informative)
EV424 publishes an integrity-only receipt proving byte-level sameness (Same Bytes → Same SHA-256) for documents referenced by Official URLs. EV424 never hosts or mirrors originals and enables third-party re-verification using the receipt alone. PASS is printed only when all integrity gates and reproducibility requirements are satisfied; otherwise FAIL is observation only.
KR (비규범 번역)
EV424는 Official URL 문서의 바이트 동일성(Same Bytes → Same SHA-256)만 증명하는 무결성 영수증을 발행한다. 원본을 호스팅/미러링하지 않으며 영수증만으로 제3자 재검증이 가능하다. 모든 게이트/요건을 만족할 때만 PASS, 아니면 FAIL(관측)이다.

2. Why “sameness” matters
EN (Informative)
Distribution paths change. Audits, incidents, and provenance workflows often need a reproducible answer to: “Is this exactly the same file as the official snapshot?”—without judging what the content means.
KR (비규범 번역)
배포 경로는 변한다. 감사/사고/프로비넌스에서는 “공식 스냅샷과 완전히 같은 파일인가?”를 내용 판단 없이 재현 가능하게 답해야 한다.

3. What EV424 is (and is not)
EN (Informative)
Is: non-custodial integrity proof + deterministic receipt + third-party reproducibility
Is not: truth/safety/legal/compliance assessment; content analysis; file hosting/mirroring
KR (비규범 번역)
EV424는 비보관 무결성 증명 + 결정적 영수증 + 제3자 재현성.
진실/안전/법/컴플라이언스 판단, 내용 분석, 호스팅/미러링은 아니다.

4. How it works (high-level)
EN (Informative)
EV424 follows a fixed 5-step sequence. The receipt records identity, check results, and a deterministic representative hash of the canonical receipt text.
KR (비규범 번역)
EV424는 5단계 고정 시퀀스를 따르며, 영수증에 ID/체크 결과/정본 텍스트의 대표 해시를 기록한다.

5. Use cases
EN (Informative)
IR/ESG/official disclosures distribution integrity; audit/incident deliverables; AI provenance; standards/regulatory referencing verification.
KR (비규범 번역)
IR/ESG/공식 공시 배포 무결성, 감사/사고 산출물, AI 프로비넌스, 표준/규제 참조 검증.

6. Publication policy (plain-language)
EN (Informative)
PASS receipts may be public. FAIL receipts are not published. Optionally, after a dispute request is received, a minimal one-line notice may be published (not a receipt; no URLs, no hashes, no observables).
KR (비규범 번역)
PASS는 공개 가능. FAIL은 공개 금지. 분쟁 접수 후에만 URL/해시/관측값 없는 1줄 공지를 선택적으로 게시 가능(영수증 아님).

7. Link to Spec
EN (Informative)
Normative conformance rules live in the Spec.
KR (비규범 번역)
규범(준수) 규칙은 SPEC에 있다.
