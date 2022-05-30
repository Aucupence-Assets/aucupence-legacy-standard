# Standard NFR Response – Digital Lending Platform (AWS Reference)

This document is a reusable, opinionated baseline for non-functional requirement (NFR) responses when proposing a cloud-hosted digital lending or credit-origination platform. It is written for architects and senior engineers, not just procurement readers.

The reference implementation assumes AWS, but the same patterns can be mapped to Azure or GCP.

---

## 1. Target Workload & Performance Envelope

Reference workload (to be tailored per client):

- 150–300 concurrent internal business users on back-office UIs.
- 800–1,200 external API requests per second at baseline.
- Peaks up to 5x baseline during campaigns, salary periods or product launches.
- 95th percentile response time target: **< 250 ms** for core decision and application APIs.
- 99th percentile response time target: **< 600 ms** for the same APIs.
- Batch workloads (for example nightly scoring refresh) must not materially degrade online performance.

Performance is validated with synthetic but production-like data sets using tools such as k6 or Gatling. Test plans cover:

- Baseline steady-state load.
- Peak and burst load.
- Soak tests (4–8 hours) to detect slow leaks or GC issues.
- Failure-injection scenarios (for example downstream API slowdown).

---

## 2. High-Level Runtime Architecture (AWS)

Reference region: `eu-central-1` (can be changed to meet data residency requirements).

**Network and isolation:**

- 1 VPC dedicated to the lending platform (or logically isolated via subnets and security groups).
- 3 Availability Zones.
- Public subnets for ingress (ALB/NLB, NAT).
- Private subnets for application workloads (EKS/Fargate).
- Private subnets for data stores (Aurora, Redis, MSK brokers).

**Core components:**

- **Compute:** Amazon EKS (Kubernetes) with managed node groups for most workloads. Optional AWS Fargate profiles for specific jobs.
- **Data:** Aurora PostgreSQL for transactional data, S3 for object/document storage, ElastiCache Redis for caching and rate limiting.
- **Messaging/events:** Amazon MSK (Kafka) for domain events and streaming; SQS for simple queueing needs.
- **Ingress:** Application Load Balancer (ALB) with AWS WAF in front of an ingress controller (ALB Ingress Controller or NGINX/Traefik).
- **Identity:** External IdP (for example Azure AD, Keycloak) via OpenID Connect and SAML.

This architecture is intentionally conservative and biased towards components with a long support horizon.

---

## 3. Scalability & Capacity Management

### 3.1 Kubernetes Horizontal Pod Autoscaling

Stateless services are deployed as Kubernetes Deployments with Horizontal Pod Autoscalers (HPA). A typical configuration:

```yaml
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: lending-api-hpa
  namespace: lending
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: lending-api
  minReplicas: 4
  maxReplicas: 40
  metrics:
    - type: Resource
      resource:
        name: cpu
        target:
          type: Utilization
          averageUtilization: 60
    - type: Pods
      pods:
        metric:
          name: http_requests_per_second
        target:
          type: AverageValue
          averageValue: "50"
```

Key principles:

- Scale on a mix of resource and custom business metrics (RPS, queue depth).
- Use PodDisruptionBudgets to avoid draining too many pods at once.
- Use separate node groups for latency-sensitive and batch workloads when needed.

### 3.2 Database and Cache Sizing

Initial sizing is based on expected data volume, concurrency and query patterns:

- Aurora writer instance sized for expected write TPS plus headroom.
- Two or more read replicas for reporting and read-heavy journeys.
- Redis cluster for:
  - Session storage (if server-side).
  - Short-lived authorization tokens.
  - Caching of hot reference data (for example product catalog, FX rates, decision matrices).

The sizing is refined after performance testing. We monitor:

- Top slow queries (Aurora Performance Insights).
- Buffer cache hit ratio.
- Lock waits and connection pool saturation.

---

## 4. Security Architecture

### 4.1 Identity, Authentication and Authorisation

- All human users authenticate via an enterprise IdP (OpenID Connect or SAML).
- Machine-to-machine exchanges use OAuth2 client credentials or mutual TLS.
- Role-based access control (RBAC) is enforced:
  - At the API gateway (coarse-grained: roles, scopes).
  - At the application layer (fine-grained: per object or loan).

Example of Istio AuthorizationPolicy enforcing admin-only access:

```yaml
apiVersion: security.istio.io/v1beta1
kind: AuthorizationPolicy
metadata:
  name: lending-admin-api-policy
  namespace: lending
spec:
  selector:
    matchLabels:
      app: lending-admin-api
  rules:
    - from:
        - source:
            requestPrincipals: ["*#role:admin"]
      to:
        - operation:
            methods: ["GET","POST","PUT","DELETE"]
```

### 4.2 Encryption and Key Management

- All data at rest is encrypted with AWS KMS–backed CMKs:
  - Aurora, MSK, S3, EBS, ElastiCache.
- Data in transit is protected by TLS 1.2+ externally and either TLS or mTLS internally.
- Key management practices:
  - Separation of duties between security admins and DB/app admins.
  - Periodic key rotation.
  - Strict KMS key policies allowing only necessary principals.

---

## 5. Network Security & Perimeter Protection

- No direct database access from the internet.
- Only ALB/NLB endpoints are exposed publicly; admin UIs can be limited to VPN or private connectivity.
- AWS WAF rulesets include:
  - Managed rules for common vulnerabilities.
  - IP reputation lists.
  - Optionally geo-blocking based on regulatory requirements.
- Security groups and Network ACLs restrict access between tiers.

For stricter environments we support private link connectivity only and disable all public endpoints.

---

## 6. Observability, Logging and Audit

- **Logs:** Structured JSON logs from all services with correlation IDs, captured into CloudWatch Logs and optionally shipped to OpenSearch/ELK.
- **Metrics:** Prometheus-compatible metrics scraped from services (or CloudWatch metrics for AWS-managed components).
- **Tracing:** OpenTelemetry instrumentation, exported to X-Ray, Jaeger or similar.

Audit requirements for banking/regulatory review:

- All admin actions on configuration, limits and decision strategies are logged with:
  - Who (identity).
  - When (timestamp).
  - What (before/after).
- Critical actions (for example manual overrides, write-offs) always include a business reason field.

Retention periods are aligned with policy (often 7–10 years for audit).

---

## 7. Availability, DR and Resilience

- Target availability:
  - 99.95% for customer-facing APIs.
  - 99.5% for back-office/reporting components.
- Within-region resilience:
  - Deployments spread across at least 3 Availability Zones.
  - Automatic pod rescheduling on node failure.
  - Self-healing configurations (for example restart policies, liveness/readiness probes).
- Cross-region DR (optional):
  - Aurora global database or cross-region replicas.
  - S3 cross-region replication for critical documents.
  - Infrastructure-as-Code to stand up minimal capacity in the DR region.

RTO/RPO are explicitly agreed and validated via DR tests at least annually.

---

## 8. Regulatory and Compliance Hooks

The platform is designed so that it can be brought under:

- PCI-DSS scope where card data is processed.
- GDPR and equivalent privacy regulations.
- EBA or local regulator outsourcing and cloud guidelines.

We maintain a control-mapping spreadsheet per engagement, linking:

- Regulatory control → Architectural pattern → Evidence source.

Examples include:

- Data minimisation → field-level design + retention configuration.
- Access control → IAM policies + RBAC manifests + audit logs.
- Logging and monitoring → Observability stack configuration and alert definitions.

This document is not the compliance statement itself but the technical basis for it.
