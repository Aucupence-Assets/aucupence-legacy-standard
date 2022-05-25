# Regulatory & Compliance Checklist – Retail Banking Transformation

> Purpose: Internal working matrix to decide Bid / No-Bid and to prepare a defensible compliance section in proposals.

## 1. Corporate & Financial Standing

| Ref | Area        | Requirement                                                             | Evidence Type                              | Status | Gap Description                          | Mitigation / Narrative                                                                                 |
|:----|:------------|:------------------------------------------------------------------------|:-------------------------------------------|:-------|:-----------------------------------------|:-------------------------------------------------------------------------------------------------------|
| C-01| Legal       | Local legal entity in customer jurisdiction                             | Certificate of Incorporation               | TBD    | No direct entity in-country             | Use certified local partner as contracting entity; we remain delivery subcontractor with back-to-back SLAs. |
| C-02| Financial   | Last 3 years audited financial statements                               | Audited Financial Reports                  | Yes    | N/A                                      | Provide holding company financials and management letter explaining group structure.                    |
| C-03| Insurance   | Professional indemnity insurance ≥ 5M (or equivalent local currency)    | Insurance Certificate + Broker Letter      | Partial| Coverage 3M vs. requested 5M            | Commit to uplift coverage upon contract award; attach broker quote with conditional binding language.  |
| C-04| Credit Risk | Minimum credit rating or D&B score “Low Risk”                           | D&B Report                                 | TBD    | Rating not available in target country   | Provide bank reference letter and 12-month cash flow projection signed by CFO.                         |

## 2. Regulatory & Data Protection

| Ref | Area            | Requirement                                                            | Evidence Type                  | Status | Gap Description                    | Mitigation / Narrative                                                                                             |
|:----|:----------------|:-----------------------------------------------------------------------|:-------------------------------|:-------|:-----------------------------------|:-------------------------------------------------------------------------------------------------------------------|
| R-01| Data Protection | GDPR or equivalent regulation adherence                               | Data Protection Policy, RoPA   | Yes    | N/A                                | Map our internal data handling controls to GDPR Articles and attach ROPA excerpt for this engagement.             |
| R-02| Localization    | All PII stored and processed in-region                                | Technical Architecture Diagram | Partial| Non-PII logs replicated globally  | Constrain PII data stores to in-region cloud, mark all cross-region flows as redacted or tokenized.               |
| R-03| PCI-DSS         | PCI-DSS compliance for cardholder data                                | AoC, ROC summary               | TBD    | Scope clarification required       | Confirm whether card data is tokenized by upstream PSP; if yes, keep us out of PCI scope and document clearly.     |
| R-04| Audit           | Ability to provide security/audit logs for 24 months                  | Logging & Monitoring Standard  | Yes    | N/A                                | Present logging retention strategy, SIEM integration and procedures for regulator audit requests.                  |

## 3. Security Certifications & Controls

| Ref | Area       | Requirement                                       | Evidence Type     | Status | Mitigation if Missing                                                                 |
|:----|:-----------|:--------------------------------------------------|:------------------|:-------|:--------------------------------------------------------------------------------------|
| S-01| ISO 27001  | Valid certification for delivery centre           | Certificate       | TBD    | Show 27001-aligned ISMS with internal audit reports and external pre-assessment plan |
| S-02| SOC 2      | SOC 2 Type II (or at minimum Type I)              | SOC 2 Report      | Partial| Provide Type I with schedule for Type II; commit to include customer in scope        |
| S-03| Access Ctrl| RBAC, MFA, JML process documented and enforced    | IAM Procedure     | Yes    | N/A                                                                                   |
| S-04| Secure SDLC| Threat modeling, code review, SAST/DAST integrated| SDLC Playbook     | Yes    | N/A                                                                                   |

## 4. Internal Use: Narrative Blocks

The following narrative fragments are reused across proposals when explaining partial compliance:

- **“Compensating Controls”**  
  Where a formal certificate is missing, we describe the underlying control set, internal audit cadence, and roadmap to certification, emphasizing that the effective security posture is equivalent to certified peers.

- **“Fronting Partner Model”**  
  For tenders requiring local incorporation, we reference the structured fronting-partner model with clear RACI and back-to-back SLA construction, ensuring that the client receives a single accountable counterpart.

