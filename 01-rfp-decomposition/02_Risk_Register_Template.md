# Engagement Bid Risk Register – Template

> Scope: Pre-contract phase risk identification focusing on feasibility, profitability and reputational exposure.

## 1. Risk Table

| ID | Category        | Description                                               | Likelihood | Impact | Inherent Rating | Mitigation Strategy                                                                 | Residual Rating | Owner           |
|:---|:----------------|:----------------------------------------------------------|:-----------|:-------|:----------------|:------------------------------------------------------------------------------------|:----------------|:----------------|
| R1 | Scope Creep     | Customer expects “consulting” work not explicit in RFP   | Medium     | High   | High            | Clarify deliverables list, include explicit out-of-scope appendix, use CR process. | Medium          | Engagement Lead |
| R2 | Data Readiness  | Source data quality insufficient for migration timeline  | Medium     | High   | High            | Run data profiling PoC; add pre-migration remediation workstream as separate scope.| Medium          | Data Architect  |
| R3 | Dependency      | Third-party APIs unstable or poorly documented           | High       | Medium | High            | Build stub services, add non-functional assumptions in contract, buffer estimation.| Medium          | Tech Lead       |
| R4 | Resource Supply | Niche skillset (e.g. mainframe, COBOL) limited in market | Medium     | High   | High            | Pre-identify subcontractor pool, design cross-training, keep flexibility in contract. | Medium        | Delivery Director |

## 2. Risk Evaluation Method

- **Likelihood**: Low / Medium / High based on historical data from similar accounts.
- **Impact**: Financial, timeline, or reputational impact on a 3-level scale.
- **Inherent Rating**: Max(Likelihood, Impact) before mitigation.
- **Residual Rating**: Re-assessed after mitigation actions are defined.

## 3. Standard Mitigation Playbook

1. Convert ambiguous expectations into **documented assumptions** and include them in the proposal.
2. Introduce **stage gates** where the vendor can legally re-estimate if constraints are not met.
3. Use **joint steering committee** governance to formally log and track risks with the client.
