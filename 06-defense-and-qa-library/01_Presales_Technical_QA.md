# Presales Technical Q&A – Standard Library

These Q&A items are used when technical stakeholders from the client challenge the proposed architecture or delivery model.

---

## 1. Scalability & Performance

Question: How will the system behave if our volumes double or we have a peak like Black Friday?

Answer:  
We design for horizontal scalability by default. All stateless services are containerized and deployed on an orchestrated platform, and we scale out pods based on live metrics (requests per second, queue depth, CPU and memory). For predictable seasonal peaks we agree capacity plans in advance; for unexpected peaks, rate limiting and graceful degradation ensure critical journeys remain available.

---

## 2. Data Residency and Offshore Access

Question: How do you ensure that offshore teams cannot access our production data?

Answer:  
Production environments are strictly segregated and accessible only to a small, approved group under client governance. Offshore developers work on lower environments with anonymized or synthetic data. We combine network segmentation, identity and access management with least-privilege roles, and virtual desktop infrastructure with copy/paste and file-transfer restrictions, to enforce this separation technically, not just procedurally.

---

## 3. Vendor Lock-in and Exit Strategy

Question: How difficult would it be to move away from your team in the future?

Answer:  
We design for portability. Infrastructure is defined as code, and the application follows standard technologies (for example containers, mainstream databases, open API standards). We maintain up-to-date documentation, architecture decision records and a structured knowledge base. During contract negotiations we can include a clear exit plan with handover activities, data and documentation exports and, if needed, shadowing for incoming teams.

