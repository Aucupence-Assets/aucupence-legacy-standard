# Standard NFR Response – Digital Lending Platform

## 1. Performance & Scalability

**Requirement**: Handle seasonal peaks up to 8x baseline traffic with predictable response times.

**Response**:
- Stateless microservices deployed on Kubernetes (EKS), sized using historical utilization patterns.
- Horizontal Pod Autoscaling triggers based on CPU and custom queue depth metrics.
- API Gateway with rate limiting and client-level throttling to protect downstream systems.
- Read-heavy workloads moved behind Redis and read replicas to offload primary data stores.

## 2. Availability & Resilience

- Target availability: **99.95%** for core transaction APIs.
- Distribution across **3 Availability Zones** with automated failover mechanisms.
- Usage of circuit breakers and bulkheads at service-to-service communication level.
- Synthetic health checks and proactive scaling based on error budgets and SLOs.

## 3. Security & Compliance

- Zero Trust principle applied; every request authenticated and authorized.
- Strong MFA enforced for privileged users; no shared admin accounts.
- All customer data encrypted at rest using KMS-managed keys; keys rotated on a defined schedule.
- Logging of all admin actions with immutable storage and regular review.

## 4. Observability & Operability

- Centralized logging (structured logs) with correlation IDs across services.
- Metrics at application, infrastructure and business levels (e.g. approval rate, time-to-decision).
- SLOs defined for latency and error rates; alerts aligned with SLO breaches, not raw metrics.
- Runbooks for common incidents, with clear handover between L1, L2 and L3 teams.

