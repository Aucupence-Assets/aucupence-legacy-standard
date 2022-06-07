# RFP Clarification Questions – Banking / Payments

This list is used to drive RFP clarification rounds. The goal is not to ask “nice to know” questions, but to force clarity on items that drive architecture, risk and price.

## 1. Scope and Roadmap

1. Which parts of the scope are mandatory for Day 1, and which can be phased later?
2. Is there a target roadmap beyond the initial implementation (for example, new products, new channels, new geographies)?
3. Is the vendor expected to migrate all existing customers, or only new business from a cut-off date?
4. Which features are considered regulatory or compliance-critical versus business convenience?

## 2. Integrations and Dependencies

5. Which systems are in scope for integration (core banking, CRM, KYC providers, scoring, payment gateways)?
6. Are stable test environments and documentation available for all integrations?
7. Who owns the relationship and SLAs with third-party providers (client, us, or shared)?
8. Are there any planned changes in core platforms during the project timeline?

## 3. Data, Migration and Reporting

9. What is the expected volume and quality of legacy data to be migrated?
10. Are there known data quality issues (duplicates, missing fields, inconsistent keys)?
11. What are the reporting and regulatory reporting requirements (internal vs regulator-facing)?
12. Are there specific reconciliation or parallel run requirements during cut-over?

## 4. Security, Compliance and Audit

13. Which regulatory frameworks are explicitly in scope (e.g. local central bank guidelines, GDPR, PCI, AML/KYC)?
14. Are there any specific security controls that go beyond standard industry expectations?
15. How are security testing and audits handled: internal teams, third parties, or both?
16. What is the expected level of our involvement in responses to regulators and internal audit?

## 5. Delivery Model and Governance

17. Are there preferences or restrictions regarding onshore / nearshore / offshore mix?
18. What is the expected cadence of steering committees and working groups?
19. Is there an internal product owner with decision authority, or a committee-based decision model?
20. How are key design decisions documented and approved?

## 6. Commercial and Legal

21. Are there mandatory contractual clauses (unlimited liability, specific penalties, unilateral termination rights)?
22. Is there a defined budget range or financial envelope we should assume?
23. Are hybrid commercial models (T&M plus fixed price, capacity-based, outcome-based) acceptable?
24. How are changes in scope or regulatory requirements expected to be treated commercially?

## 7. Success Criteria

25. How will success be measured at go-live and after six or twelve months?
26. Are there key business KPIs tied to this program (time-to-yes, NPS, cost per loan, default rates)?
27. Are there any non-negotiable constraints or “red lines” from the client side?

The answers to these questions feed into:
- Bid triage and Go/No-Go decision.
- Architectural choices and NFR commitments.
- Commercial model and risk sharing structure.
