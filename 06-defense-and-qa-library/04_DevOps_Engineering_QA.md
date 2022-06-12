# DevOps & Engineering Excellence Q&A

---

## CI/CD

**Q1**: What quality gates do you enforce in CI?  
**A**: Baseline gates include minimum coverage thresholds, static analysis, dependency scanning and policy-compliant build artefacts.

**Q2**: How do you manage release risk?  
**A**: We use staged environments, feature toggles, progressive rollout where applicable, and automated rollback criteria.

**Q3**: How do you handle emergency fixes?  
**A**: We define an emergency-change path with post-implementation review and audit logging.

---

## Environment Strategy

**Q4**: How many environments do you assume?  
**A**: We default to dev/test/stage/prod with explicit data-handling rules for each.

**Q5**: How do you avoid environment drift?  
**A**: We propose infrastructure-as-code with peer review and automated parity checks.

---

## Observability

**Q6**: What is your standard observability stack approach?  
**A**: Centralized logs, metrics and traces with correlation IDs; thresholds aligned to agreed SLOs.

**Q7**: How do you define SLOs for mixed workloads?  
**A**: We tier services by business criticality and align latency/availability targets per tier.

