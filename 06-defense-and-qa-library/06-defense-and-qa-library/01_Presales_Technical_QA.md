# Presales Technical Q&A – Deep Technical Version

This library is intended for discussions with client architects, security teams and senior engineers. Answers are written to show concrete technical thinking, not generic marketing language.

---

## 1. Architecture & Runtime

### Q1: Why choose Kubernetes (EKS) over a pure serverless approach?

We prefer EKS when:

- There is a mix of latency-sensitive APIs and long-running or stateful workloads.
- The platform needs sidecars (for example service mesh, logging, tracing, policy agents).
- There is a realistic chance that parts of the workload might move on-premises or to another cloud in future.
- The client wants stronger control over runtime, versioning and networking.

We still use serverless components (Lambda, Step Functions, EventBridge) for specific jobs: low-throughput event handlers, scheduled housekeeping tasks or glue logic. We document the split explicitly so the platform does not turn into “Kubernetes everywhere” by accident.

---

### Q2: How do you prevent a microservices design from degenerating into a distributed monolith?

We partition by domain, not layers. Each service owns:

- A clear bounded context (for example onboarding, decisioning, disbursement).
- Its own persistence schema.
- A small, stable set of APIs and domain events.

Cross-service communication uses:

- Synchronous APIs when necessary, with clear contracts and backward compatibility rules.
- Asynchronous events for cross-domain notifications.

We explicitly avoid:

- Cross-service database access.
- “Utility” services that become God objects.
- Shared “common” schemas that couple unrelated services.

Architecture Decision Records capture these choices and exceptions.

---

## 2. Performance & Capacity

### Q3: How do you size the initial cluster and database?

We express sizing as a process, not a magic number:

1. Estimate peak RPS and concurrency for critical journeys.
2. Map to resource needs per request (CPU, memory, DB calls).
3. Apply realistic utilisation targets (for example aim for 60–70% CPU at peak, not 100%).
4. Run load tests and adjust.

As a starting point for a mid-size lending platform:

- 4–6 pods of core API services (2 vCPU, 4–8 GiB RAM each).
- Aurora writer with 2–4 vCPUs and 16–32 GiB RAM, plus 2 read replicas.
- Redis cluster with 2 small or medium nodes for session and cache.

We then run tests and tune:

- Pod resources and HPA thresholds.
- Connection pool sizes.
- DB instance size and number of replicas.

---

### Q4: How do you protect critical flows during high load?

We treat critical flows (application submission, decision, payment) separately:

- Per-route and per-client rate limiting at API gateway or ingress.
- Circuit breakers at service mesh level so slow downstream services do not cascade failures.
- Isolation where needed:
  - Critical services on separate node groups.
  - Separate Redis or Kafka topics/partitions for high-priority traffic.

We also agree non-critical features that can degrade gracefully (for example background scoring refresh or campaign analytics) so they can be slowed or paused automatically in overload scenarios.

---

## 3. Security & Compliance

### Q5: How is least privilege enforced in AWS and Kubernetes?

We enforce least privilege at multiple layers:

- AWS IAM:
  - IAM roles for service accounts (IRSA) linking pods to IAM roles with minimal permissions.
  - Strict role policies (for example read-only to specific S3 prefixes, limited KMS usage).
- Kubernetes:
  - Namespaces per environment or domain.
  - RBAC roles and role bindings per team.
  - NetworkPolicies restricting traffic between namespaces and services.
- Application:
  - Role/scope checks at API layer.
  - Feature flags for highly sensitive operations.

We back this with:

- Periodic access reviews.
- Automated checks on Terraform and Kubernetes manifests with policy-as-code tools.

---

### Q6: What evidence can you provide to auditors that controls are actually in place?

We provide a simple control → configuration → evidence mapping. For example:

- “DB data is encrypted at rest” →
  - Terraform config for Aurora with KMS CMK →
  - AWS console/screenshots or API output validating encryption flags.
- “Admin actions are logged” →
  - Kubernetes audit log configuration + log samples →
  - CloudTrail events for IAM role usage.

Where possible we avoid one-off screenshots and point to reproducible queries or scripts.

---

## 4. DevSecOps & SDLC

### Q7: What does your DevSecOps pipeline look like in practice?

Typical stages:

1. On pull request:
   - Static code analysis (SonarQube or equivalent).
   - Unit tests with coverage thresholds.
   - Dependency scanning and container base image scanning.
2. On merge to main:
   - Build container images, scan again.
   - Deploy to integration via GitOps (for example Argo CD).
   - Run API, contract and UI regression tests.
   - Run basic DAST against integration.
3. Before production:
   - Change record with risk notes.
   - Production deployment with smoke tests.
   - Post-deploy verification and quick rollback option.

We keep pipeline configuration as code (YAML) and subject to code review.

---

### Q8: How are secrets handled?

- Secrets are stored in a secure secret manager (AWS Secrets Manager or similar), not in Git.
- CI/CD jobs assume short-lived roles to fetch secrets at deploy time.
- Container images never include environment-specific secrets.
- Secret scanning tools run periodically on repos to detect accidental leaks.

If a leak is suspected:

- A defined runbook is executed (revoke, rotate, search, monitor).
- Logs are checked to see if leaked secrets were used.

---

## 5. Observability & Operations

### Q9: How do you ensure that on-call engineers can resolve issues quickly?

We design for debuggability:

- Every incoming request gets a correlation ID that is propagated across service boundaries.
- Logs are structured to at least include:
  - Correlation ID.
  - User or system id (where applicable).
  - Service and version.
  - Key parameters and error codes.
- Dashboards aggregate:
  - Golden signals (latency, error rate, saturation).
  - Business-level metrics (applications submitted, approved, declined, by segment).

Runbooks describe:

- How to interpret specific graphs.
- What first checks to perform.
- When and how to escalate.

We encourage game days to rehearse these procedures.

---

### Q10: How do you avoid alert fatigue?

We:

- Derive alerts from SLOs rather than raw metrics.
- Group alerts into incidents and use noise reduction features where available.
- Regularly review alert history:
  - Remove alerts that rarely fire or never lead to action.
  - Adjust thresholds when conditions have changed.

The outcome is a small, meaningful set of alerts that on-call staff trust.
