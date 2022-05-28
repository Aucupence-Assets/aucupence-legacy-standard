# Delivery Governance Model – Reference Framework

This governance model is used as a reference when designing delivery structures for transformation projects with offshore/nearshore components.

---

## 1. Governance Layers

1. Executive Steering Committee (Monthly or Quarterly)  
   Participants: client executive sponsor, vendor engagement director, sometimes risk/compliance representatives.  
   Focus: business outcomes, budget vs. actuals, major risks, and strategic decisions.  
   Outputs: approved decisions, updated risk posture, direction for next phase.

2. Engagement Governance (Bi-weekly)  
   Participants: product owners, project managers, solution architect, sometimes key SME leads.  
   Focus: scope decisions, prioritization, roadmap changes, cross-team dependencies.  
   Outputs: updated roadmap, approved change requests, clarified responsibilities.

3. Squad / Operational Level (Weekly/Daily)  
   Participants: scrum teams, tech leads, QA, DevOps, occasionally client representatives.  
   Focus: sprint goals, day-to-day blockers, incident follow-up, continuous improvement.  
   Outputs: sprint plans, sprint reviews, retrospective actions.

---

## 2. Artefacts and Cadence

- Steering Committee Pack: delivery KPIs (scope burn-up/burn-down, velocity trends, milestone completion), quality KPIs (defect trends, test coverage, environment stability), financials (burn rate, variance vs. budget, forecast-to-complete), and a risks/decisions log.
- Engagement Review Notes: updated RAID (Risks, Assumptions, Issues, Dependencies) log; change request register with status and impact summary; architectural decision log (often linked to ADRs in the code repository).
- Squad-Level Artefacts: sprint backlog, stand-up notes, Definition of Ready / Done checklists, retrospective action items and their status.

---

## 3. RACI at a Glance

A simplified RACI (Responsible, Accountable, Consulted, Informed) matrix for key decisions:

| Activity / Decision                     | Client Sponsor | Client PO | Vendor PM | Vendor Architect | Vendor Tech Lead |
|:----------------------------------------|:--------------:|:---------:|:---------:|:----------------:|:----------------:|
| Approve roadmap changes                 | A              | R         | C         | C                | I                |
| Approve major architecture decisions    | C              | C         | C         | A                | R                |
| Accept sprint scope                     | I              | A         | R         | C                | C                |
| Approve production go-live              | A              | R         | R         | C                | C                |
| Prioritize defects during UAT           | C              | A         | R         | C                | R                |

This matrix is tailored in each engagement but the pattern remains similar.

---

## 4. Escalation Paths

We define clear paths for issue escalation:

- Squad → Vendor Tech Lead → Vendor PM → Engagement Director → Steering Committee.
- For regulatory or security issues, parallel escalation to client security/compliance functions.

The escalation timelines (for example when a Sev-1 incident must be escalated to steering level) are documented in the SLA and incident-management annexes.

