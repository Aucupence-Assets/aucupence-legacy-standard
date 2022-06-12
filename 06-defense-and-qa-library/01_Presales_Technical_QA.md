# Presales Technical Q&A – Standard Library

These questions are used to prepare delivery leaders and architects for technical evaluation workshops.

---

## Architecture and Scalability

**Q1**: How do you ensure the platform scales without redesign?  
**A**: We design critical services as stateless components with horizontal scale-out, isolate bottlenecks early, and validate scale assumptions during discovery through load-profile workshops.

**Q2**: What is your approach to peak traffic and unpredictable bursts?  
**A**: We define latency/throughput envelopes by journey tier, apply rate limiting at the edge, and use graceful degradation for non-critical features to protect core transactions.

**Q3**: How do you handle high read workloads without overbuilding the database?  
**A**: We combine read replicas, caching for hot paths, and asynchronous event-driven updates for reporting and audit-heavy queries.

---

## Integration and Dependency Risk

**Q4**: How do you manage unclear third-party API maturity?  
**A**: We treat external integration readiness as a key estimation driver and include explicit assumptions, sandbox validation steps, and change-control triggers.

**Q5**: What if the client’s upstream systems are unstable?  
**A**: We propose resilience patterns such as retries with jitter, circuit breakers, and dependency-health dashboards with joint incident protocols.

---

## Security and Compliance

**Q6**: How do you enforce least privilege in multi-team delivery?  
**A**: We define role-based production access under client approval, enforce separation of duties, and maintain auditable access logs.

**Q7**: How do offshore teams work without touching sensitive data?  
**A**: We use anonymized/synthetic datasets for lower environments and restrict production access to approved onshore roles under controlled procedures.

**Q8**: What security testing is included by default?  
**A**: Baseline includes SAST, dependency scanning, container scanning, and pre-release DAST for high-risk flows.

---

## Reliability and DR

**Q9**: What availability targets can you support?  
**A**: We link targets to service tiers, typically proposing higher availability for core transaction APIs and lower targets for non-critical reporting services.

**Q10**: How do you propose RTO/RPO without overcommitting?  
**A**: We present tiered options aligned to data criticality and confirm targets during discovery and architecture workshops.

---

## Operability

**Q11**: How do you ensure the platform is supportable post go-live?  
**A**: We define minimum runbook coverage, on-call rotations, monitoring baselines, and release-readiness checks before production cutover.

**Q12**: What observability signals do you expect for regulated clients?  
**A**: End-to-end correlation IDs, admin-action audit logs, and retention policies aligned to local regulatory expectations.

