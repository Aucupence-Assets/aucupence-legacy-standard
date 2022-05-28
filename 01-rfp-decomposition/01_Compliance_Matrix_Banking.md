# Regulatory & Compliance Checklist – Retail / SME Banking Transformation

Purpose: internal working matrix to decide Bid / No-Bid and to prepare defensible, reality-based compliance sections in proposals for retail or SME banking clients.

---

## 1. Corporate, Financial and Legal Standing

| Ref | Area        | Requirement                                                               | Evidence                                | Status | Gap Description                            | Mitigation / Narrative                                                                                                      |
|:----|:------------|:--------------------------------------------------------------------------|:----------------------------------------|:-------|:-------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------|
| C-01| Legal       | Local legal entity or authorized contracting partner in client country    | Certificate of Incorporation / MSA      | TBD    | No direct entity in-country                | Engage certified local partner as contracting entity; we remain named subcontractor with back-to-back SLAs and warranties. |
| C-02| Financial   | 3 years of positive net equity and no going-concern warning               | Audited Financials + Auditor Letter     | TBD    | Consolidated group reports only            | Provide group-level financials and management letter; explain structure and ring-fencing of project delivery entity.        |
| C-03| Insurance   | Professional Indemnity (E&O) ≥ 5M equivalent, Cyber insurance if required | Insurance certificates, broker letter   | Partial| Current coverage below threshold           | Commit in writing to uplift coverage before go-live; attach broker quote with binding conditions linked to award date.      |
| C-04| Sanctions   | Not listed on any EU/US/UK sanctions lists                                | Sanctions-screening screenshot          | Yes    | N/A                                        | Provide screening report from a third-party sanctions tool for the contracting and delivery entities.                       |
| C-05| Subcontract | Transparent subcontracting model                                          | Draft subcontracting plan and RACI      | Yes    | N/A                                        | Include subcontractor overview, responsibilities, and oversight mechanisms in the governance annex.                         |

---

## 2. Regulatory & Data Protection Requirements

| Ref | Area            | Requirement                                                                          | Evidence Type                         | Status | Gap Description                       | Mitigation / Narrative                                                                                                                                   |
|:----|:----------------|:-------------------------------------------------------------------------------------|:--------------------------------------|:-------|:--------------------------------------|:---------------------------------------------------------------------------------------------------------------------------------------------------------|
| R-01| Data Protection | GDPR or equivalent data-protection adherence                                        | Data Protection Policy, RoPA excerpt  | Yes    | N/A                                   | Provide mapping of controls to GDPR Articles, including lawful basis, data minimization, retention and data-subject rights handling.                     |
| R-02| Localization    | PII stored and processed only in specified region                                   | Architecture diagram, cloud design    | Partial| Log analytics currently cross-region  | Constrain PII data stores to a single region; keep only anonymized or aggregated logs outside region with clear DPA and TOM (technical/organisational). |
| R-03| PCI-DSS         | PCI-DSS compliance when processing cardholder data                                  | AoC, ROC summary                      | TBD    | Scope of card data not fully defined | Clarify whether issuer or payment gateway tokenizes card data before it reaches our platform; aim to remain out of PCI scope when possible.              |
| R-04| EBA Guidelines  | Alignment with EBA outsourcing and cloud guidelines for critical banking functions  | Control-mapping document              | TBD    | Control alignment not documented      | Produce short mapping of existing controls to EBA guidelines; explicitly show governance, exit strategies and data location controls.                    |
| R-05| Auditability    | Ability to provide logs and evidence for regulator / internal audit for 7+ years    | Logging and retention standard        | Yes    | N/A                                   | Describe central log retention, access controls, immutable storage and retrieval process including time-bound search capabilities.                      |

---

## 3. Information Security & Certification

| Ref | Area       | Requirement                                         | Evidence Type      | Status | Mitigation if Missing                                                                                                           |
|:----|:-----------|:----------------------------------------------------|:-------------------|:-------|:--------------------------------------------------------------------------------------------------------------------------------|
| S-01| ISO 27001  | Valid certificate covering core delivery locations  | Certificate, SoA   | TBD    | Provide 27001-aligned ISMS with scope statement, internal audit reports and letter of intent for certification within 12–18mo. |
| S-02| SOC 2      | SOC 2 Type II or equivalent assurance report        | SOC 2 Report       | Partial| Provide Type I report, remediation plan and timeline for Type II; explicitly include client environment in future scope.       |
| S-03| IAM        | Role-based access, MFA, JML process enforced        | IAM Procedures     | Yes    | N/A                                                                                                                              |
| S-04| SDLC Sec   | SAST, DAST, dependency scanning integrated in SDLC  | SDLC / DevSecOps   | Yes    | N/A                                                                                                                              |
| S-05| Vendor Risk| Third-party risk management for own suppliers       | Vendor risk policy | TBD    | Document due diligence practice and provide example assessment of one technology subcontractor.                                 |

---

## 4. Delivery, BCP and Operational Resilience

| Ref | Area          | Requirement                                                | Evidence Type                | Status | Gap Description                    | Mitigation / Narrative                                                                                               |
|:----|:--------------|:-----------------------------------------------------------|:-----------------------------|:-------|:-----------------------------------|:---------------------------------------------------------------------------------------------------------------------|
| D-01| BCP/DR        | Documented BCP and DR plan with tested RTO/RPO             | BCP/DR documentation, report | Partial| Tests not yet aligned to client RTO| Commit to align RTO/RPO with client targets; propose joint DR test within first year of production.                |
| D-02| Delivery Model| Clear explanation of onshore/nearshore/offshore split      | Delivery model description   | Yes    | N/A                                | Provide staffing model, time-zone coverage and escalation paths.                                                    |
| D-03| Service Levels| SLAs for incident response, change, and request handling   | Draft SLA schedule           | Yes    | N/A                                | Attach detailed SLA table with severity definitions, response/resolve targets, and reporting obligations.           |
| D-04| Exit Strategy | Ability to support exit/migration without vendor lock-in   | Exit strategy note           | TBD    | Not yet documented                 | Provide high-level exit plan (handover artefacts, documentation, knowledge-transfer, IP and data export mechanisms).|

---

## 5. Narrative Blocks for Proposal Text

These fragments are repeatedly reused when writing the “Compliance” and “Regulatory” sections of proposals:

### 5.1 Compensating Controls

When a formal certification is missing but underlying controls are mature, we describe:
- The current control framework and audit cadence,
- Existing internal or customer audits,
- Concrete timelines and milestones towards formal certification.

The objective is to show that the effective risk level is equivalent to fully certified peers, even if the paperwork is in transition.

### 5.2 Fronting Partner Model

When a tender requires a local contracting entity, we describe:
- The local partner’s legal and financial role,
- The subcontracting structure, including flow-down of obligations,
- How governance and accountability remain clear for the end client.

This allows smaller vendors to participate in complex tenders without overstating their legal footprint, while still giving clients a single accountable face.

### 5.3 Data Residency and Cloud

For data-residency requirements, we explicitly:
- Show region-locked data stores,
- Separate PII from non-PII flows,
- Describe encryption, key management and access control around in-region data,
- Clarify which components are multi-region and why (usually anonymized logs or disaster-recovery replicas).

