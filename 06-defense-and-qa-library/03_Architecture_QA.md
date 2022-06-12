# Architecture Q&A – Extended Library

---

## Core Architecture

**Q1**: Why microservices instead of a monolith?  
**A**: We choose modularity based on domain boundaries, delivery phasing and operational constraints. The proposal emphasises isolation of high-change and high-risk domains.

**Q2**: How do you prevent service sprawl?  
**A**: We define domain ownership, ADR discipline, and a design authority cadence that controls granularity decisions.

**Q3**: How do you handle versioning across services?  
**A**: We use backward-compatible API versioning, consumer-driven contracts for critical interfaces, and staged deprecation policies.

---

## Data

**Q4**: How do you avoid inconsistent data across services?  
**A**: We define canonical sources by domain, use event-driven propagation for non-critical reads, and keep strong consistency where legally required.

**Q5**: Do you support real-time reporting?  
**A**: We propose tiered reporting latency options and clarify whether near real-time is mandatory or “nice-to-have” for the client’s operating model.

---

## Security Architecture

**Q6**: How do you embed zero-trust in the design?  
**A**: Central identity, least privilege, network segmentation and auditable admin boundaries are included in the baseline.

**Q7**: How do you manage secrets?  
**A**: We reference centralized secrets management and rotation policies as part of the DevSecOps baseline.

---

## Cloud Portability

**Q8**: What is your approach to avoiding vendor lock-in?  
**A**: We standardize on containers, mainstream databases and IaC patterns that can be translated across clouds with reasonable effort.

