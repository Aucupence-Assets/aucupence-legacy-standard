# Standard NFR Response – Digital Lending Platform

This document is a reusable baseline for non-functional requirement (NFR) responses when proposing a cloud-hosted digital lending or credit-origination platform.

---

## 1. Performance & Scalability

Baseline requirement example: support 3–5x traffic growth over 3 years, seasonal peaks up to 10x baseline, while keeping 95% of API responses under 300 ms.

Proposed approach:

- Stateless microservices on Kubernetes (EKS). All business services run as stateless containers. Scale-out is handled via Horizontal Pod Autoscalers driven by CPU utilization and custom metrics (queue length, request-per-second per endpoint).
- Read/Write separation and caching. Operational data is stored in a relational database with a primary writer node and multiple read replicas behind a lightweight connection pooler. Hot paths (eligibility checks, product catalog, FX rates) are cached in Redis, reducing direct DB load.
- Back-pressure and graceful degradation. Per-endpoint rate limiting is applied at API gateway level. For non-critical features (e.g. marketing offers, some analytics calls), we enable graceful degradation under heavy load, to protect core journeys such as application submission and decisioning.

---

## 2. Availability & Resilience

Target service levels:

- Core transaction APIs: 99.95% monthly availability.
- Supporting services (reporting, batch exports): 99.5%.

Key design decisions:

- Multi-AZ deployment for all stateful components.
- Health checks and rolling updates with automatic rollback on failure.
- Circuit breakers and bulkheads to protect from cascaded failures when a dependency is slow or unavailable.

Availability is measured at the client-facing API gateway level, excluding planned maintenance windows agreed in advance.

---

## 3. Security & Compliance

We apply a pragmatic zero-trust mindset around the lending platform:

- Identity & Access Management. All users (internal and external) are authenticated via a central identity provider (OpenID Connect / SAML). Role-based access control (RBAC) is enforced at application and API gateway levels. Privileged access is limited, logged and regularly reviewed.
- Encryption. All data at rest is encrypted using cloud-native key-management services, with customer-managed keys when required. All traffic is encrypted using TLS with modern cipher suites; mutual TLS may be used between sensitive internal services.
- Secure SDLC. Static Application Security Testing (SAST), dependency checks and container image scans are integrated into the CI pipeline. Dynamic Application Security Testing (DAST) is run against staging environments before major releases. Threat modeling is performed for key flows: application submission, decisioning, document upload, payment execution.

---

## 4. Auditability & Logging

Banks and regulators require a clear audit trail for critical operations:

- Structured logging with correlation IDs. Every request carries a correlation ID propagated across services, allowing reconstruction of end-to-end traces.
- Admin and configuration changes. All administrative actions (changing limits, decision strategies, pricing rules) are logged with who performed the change, what was changed, when it was changed, and an optional “why” field where business justification is recorded.
- Retention and access. Logs are retained according to agreed retention periods (often 2–7 years for core operations) with access controlled and audited.

---

## 5. SLA and SLO Examples

Typical SLA and SLO parameters we propose during negotiations:

| Area              | Example SLO / SLA                                                   |
|:------------------|:--------------------------------------------------------------------|
| API latency       | 95% of core API calls under 300 ms, 99% under 800 ms               |
| Availability      | 99.95% monthly uptime for core APIs                                |
| Incident response | Severity 1 incidents responded to within 30 minutes, workaround in 4 hours |
| Change deployments| Standard change windows agreed in advance; emergency changes allowed under defined rules |

These numbers are tuned in workshops with the client’s operations and architecture teams to match their broader IT landscape.

---

## 6. Operability & Day-2 Concerns

- Dashboarding and monitoring for both technical and business metrics (e.g. approval rates, time-to-yes).
- Clear runbooks and on-call rotations for incident handling.
- Well-documented deployment, rollback and feature-toggle procedures, so that operations teams understand exactly how to react under adverse conditions.

