# Presales Technical Q&A – Extended Library

This document contains technical Q&A items that frequently come up in presales workshops, RFP or RFI clarifications, and architecture review boards. It is structured by topic so individual answers can be reused or tailored per engagement.

---

## 1. Overall Architecture & Technology Stack

### Q1.1: Are you proposing a monolith or microservices architecture?

**Answer:**  
We design for modularity first, not buzzwords. For most digital platforms we propose a modular, service-based architecture with clear domain boundaries and APIs. In practice, this often looks like microservices for core domains (onboardings, applications, decisions, payments) and a small number of shared services for cross-cutting concerns (identity, notifications, audit).

Where the client team is earlier in its journey, we may start with a well-structured modular monolith but keep boundaries and interfaces explicit so that later extraction into services is manageable. The decision is based on operational maturity and deployment constraints, not fashion.

---

### Q1.2: Which technologies do you typically use?

**Answer:**  
We work with mainstream, enterprise-ready stacks that your internal teams or future vendors can support:

- Backend: Java/Kotlin, .NET, or Go, with frameworks such as Spring Boot or ASP.NET Core.
- Frontend: React or Angular for web, with REST/GraphQL APIs.
- Databases: relational stores like PostgreSQL or SQL Server for transactional data; document or key-value stores where justified.
- Integration: REST/JSON APIs as the default, message queues or streams (e.g. Kafka, RabbitMQ) for asynchronous flows.
- Cloud: AWS, Azure or GCP, using native services for security, logging and observability.

We adapt to client standards where they exist; the architecture is kept portable enough to avoid hard lock-in on a niche technology.

---

## 2. Scalability & Performance

### Q2.1: How will the platform scale if our transaction volumes triple?

**Answer:**  
We design for horizontal scalability. All stateless components run in containers and are orchestrated by a platform such as Kubernetes. Scaling is driven by metrics (requests per second, queue depth, CPU/memory) so capacity automatically adjusts within agreed limits.

Stateful components (databases, caches, message brokers) are sized with headroom and scale vertically and/or through partitioning or read replicas. We run performance tests with realistic data and traffic patterns to validate that the target volumes and latency can be achieved before go-live.

---

### Q2.2: How do you ensure performance under peak load, such as campaign launches or seasonal events?

**Answer:**  
We combine three strategies:

1. **Capacity planning:** simulate expected peaks and pre-scale capacity where predictable (for example salary periods or Black Friday).  
2. **Graceful degradation:** define which features can be temporarily reduced during overload (non-critical analytics, some non-essential checks) to protect core flows.  
3. **Back-pressure and rate limiting:** apply per-client and per-endpoint limits at API gateway level, so that a noisy caller does not impact the entire platform.

These strategies are tested through load and stress tests as part of non-functional testing.

---

## 3. Security, Identity & Access

### Q3.1: How do you handle authentication and authorisation?

**Answer:**  
We favour a central identity provider implementing OpenID Connect and/or SAML. Application clients obtain tokens from this provider; APIs validate tokens and apply role- or attribute-based access control.

Admin and operational users are given the minimum required privileges, with just-in-time elevation where necessary. All admin actions are logged for audit. We can integrate with your existing identity platform (e.g. Azure AD, Ping, Keycloak) to avoid introducing a parallel identity silo.

---

### Q3.2: How do you protect sensitive customer data?

**Answer:**  
We apply multiple layers of protection:

- Encryption in transit using TLS for all external and internal traffic.
- Encryption at rest for databases, object storage and backups using managed key-management services with appropriate key rotation.
- Field-level protection for highly sensitive attributes where required (for example national IDs, card data) via tokenisation or additional encryption.
- Strict access control and segregation of duties for users who can see unmasked data.

Data classification is agreed with the client so that we align on which data elements require which level of protection.

---

## 4. Data Residency, Privacy & Compliance

### Q4.1: How do you meet data residency requirements?

**Answer:**  
We design the deployment so that systems storing personal or regulated data are pinned to the required region or data centre. This is enforced through infrastructure-as-code, so environments cannot accidentally be created outside the allowed regions.

If cross-region services are required (for example global monitoring or centralised log analysis), we ensure any data leaving the region is anonymised, pseudonymised or aggregated, and describe this explicitly in the data-protection impact assessment.

---

### Q4.2: How do you support GDPR or similar regulations?

**Answer:**  
Our design and processes support:

- Lawful-basis mapping and purpose limitation for data processing.
- Data minimisation, including configurable retention and archiving policies.
- Data-subject rights, such as access and erasure, through traceable mechanisms.
- Logging and reporting necessary for accountability.

We typically work with the client’s Data Protection Officer or equivalent role to finalise the details and to document these controls in your existing governance framework.

---

## 5. Reliability, DR and Business Continuity

### Q5.1: What is your disaster-recovery approach?

**Answer:**  
We design for resilience at three levels:

1. **Within a site/region:** multi-AZ deployments, rolling updates, health checks and automatic restarts.  
2. **Between sites/regions:** active-passive or pilot-light strategies, with data replicated asynchronously within RPO targets.  
3. **Process level:** documented runbooks for failover, regular DR tests with clear roles and communication plans.

The exact RPO/RTO values are agreed with you and validated through scheduled DR exercises.

---

### Q5.2: How do you avoid single points of failure?

**Answer:**  
We identify potential single points (critical services, shared components, network paths) during architecture design. For each, we consider redundancy strategies: clustering, replicas, failover components or alternative routes.

We additionally use observability tooling to continuously monitor availability and to detect early signals that a supposedly redundant component is behaving like a single point in practice.

---

## 6. Integration & APIs

### Q6.1: How do you manage integration with legacy systems?

**Answer:**  
We typically introduce an integration layer (API gateway or integration services) between the new platform and legacy systems. Responsibilities are clearly separated:

- The platform focuses on business logic and user-facing flows.
- Integration services handle protocol translation, data mapping and resiliency patterns such as retries or circuit breaking.

Where legacy systems are fragile, we isolate them behind well-defined interfaces and add caching or queuing to decouple user experience from back-end responsiveness.

---

### Q6.2: How do you handle third-party API changes?

**Answer:**  
We avoid tight coupling to external APIs by:

- Wrapping each external API in an internal adapter service,
- Keeping mapping logic in one place,
- Introducing contract tests that detect upstream changes early.

When feasible, we agree change-notification channels with providers. For high-risk integrations, we keep additional buffer in the plan and design fallbacks so that the platform fails gracefully if an external dependency is temporarily unavailable.

---

## 7. DevOps, CI/CD and Environments

### Q7.1: What does your CI/CD pipeline look like?

**Answer:**  
A typical pipeline includes:

- Static code analysis and unit tests on each commit,
- Build and packaging of artefacts or container images,
- Automated deployment to integration and test environments,
- Execution of API and end-to-end regression suites,
- Promotion to staging and production under controlled approvals.

Quality gates (test coverage thresholds, static-analysis scores, security scans) are enforced so that changes cannot be promoted with known critical issues.

---

### Q7.2: How many environments do you expect and how are they used?

**Answer:**  
Commonly we have at least:

- Development / integration environments for daily work,
- System test / regression environments,
- UAT / pre-production environments aligned with client testing needs,
- Production.

Additional environments may be set up temporarily for performance testing or dedicated feature teams. We align the environment strategy with your existing practices to avoid unnecessary complexity.

---

## 8. Observability & Operations

### Q8.1: How do you ensure that operations teams can run the platform effectively?

**Answer:**  
We design with operations in mind:

- Centralised logging with structured events and correlation IDs,
- Metrics and dashboards for technical health (latency, error rates, resource utilisation),
- Business-level indicators (conversion rates, application status distributions),
- Alerting rules tuned to minimise noise while catching real issues.

We also provide operations runbooks describing common incidents, diagnostic steps and clear escalation paths.

---

### Q8.2: Can the client eventually take over operations or development?

**Answer:**  
Yes. One of our design principles is that the client should have the option to internalise development or operations later. We support this by:

- Using mainstream technologies and open standards,
- Documenting architecture decisions and deployment processes,
- Involving client staff in design, code review and operations from early stages,
- Structuring knowledge-transfer and shadowing phases as part of the engagement plan.

This reduces long-term dependency on our team and gives you flexibility in how you evolve the platform.

