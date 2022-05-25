# Presales Technical Q&A – Standard Library

## Scalability

**Question**: How do you scale the platform if our user base doubles in one year?

**Answer**:  
We design for horizontal scalability by default. All stateless components are containerized and deployed on an orchestrated platform. When load increases, we scale out pods and supporting infrastructure based on metrics, not manual intervention. We also separate read and write workloads to avoid bottlenecks.

## Security

**Question**: How do you ensure that offshore teams cannot access production data?

**Answer**:  
Production access is restricted to a small, approved onshore group. Offshore engineers work only on lower environments populated with masked or synthetic data. Network-level controls, VDI solutions and strict IAM policies are used to technically enforce this separation, not just process guidelines.

