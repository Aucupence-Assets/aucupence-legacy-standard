# Compliance Matrix – Banking / Payments (Advanced)

This matrix is used to communicate, internally and to clients, how we align with typical banking and payments requirements. It is not a legal opinion, but a structured view of “what we have”, “what we do not have”, and “how we mitigate”.

## 1. Regulatory and Data Protection

| Ref | Area           | Client Requirement (Typical)                                              | Our Baseline Capability                                      | Gap / Risk                                              | Mitigation / Narrative                                                                                      |
|:----|:---------------|:-------------------------------------------------------------------------|:-------------------------------------------------------------|:--------------------------------------------------------|:------------------------------------------------------------------------------------------------------------|
| R-01| Data Protection| Personal data processed in line with GDPR or equivalent                  | Data protection policy, RoPA, DSR process, DPIA templates    | Local specifics may differ                               | Map existing controls to local law; run joint DPIA workshop during discovery.                               |
| R-02| Data Residency | PII stored and processed only in named region(s)                         | Region-locked primary data stores, KMS-managed keys          | Some platform logs may currently be multi-region         | Constrain PII logs to region, keep only anonymized analytics cross-region; document in data-flow diagrams.  |
| R-03| Outsourcing    | Compliance with central bank outsourcing / cloud guidelines              | Governance, exit strategies, DR and audit models in place    | No explicit mapping to named guideline                   | Prepare short control mapping (for example to EBA, MAS, local CB circulars) for the engagement.             |
| R-04| Auditability   | Provision of logs and evidence for regulator audit on request            | Centralized logging, immutable storage, retention policies   | Retrieval SLAs not always formalized                     | Define audit log retrieval SLAs and cost model during contracting.                                         |
| R-05| AML / KYC      | Ability to support AML/KYC-related reporting and data access             | APIs and data models support KYC data structures             | Client-specific reporting formats may vary               | Align during design with client AML function; provide reference schemas and adjust to local needs.          |

## 2. Information Security and Controls

| Ref | Area          | Client Requirement (Typical)                                                      | Our Baseline Capability                                          | Gap / Risk                                            | Mitigation / Narrative                                                                                     |
|:----|:--------------|:----------------------------------------------------------------------------------|:-----------------------------------------------------------------|:------------------------------------------------------|:-----------------------------------------------------------------------------------------------------------|
| S-01| Certification | ISO 27001 certificate for core delivery locations                                | Either certified entity or control-aligned ISMS                  | Scope or certificate age may not fully align         | Provide SoA, internal audit reports, and plan for scope extension where needed.                            |
| S-02| Assurance     | SOC 2 Type II or equivalent assurance for platform or services                   | SOC reports may exist for part of the environment or providers   | Full Type II may not be in place for all components  | Use Type I or provider SOC reports, plus documented control ownership split.                               |
| S-03| IAM           | Role-based access control, MFA, joiner-mover-leaver processes                    | Central IAM with RBAC, MFA, JML procedures                       | Documentation maturity may vary                       | Provide IAM runbook and evidence of JML execution during due diligence.                                    |
| S-04| DevSecOps     | Security integrated into SDLC (SAST, DAST, dependency scans, code reviews)       | DevSecOps pipeline and policies in place                         | Tooling may differ from client preferences           | Map our toolchain to client expectations; accept independent security testing as needed.                   |
| S-05| Vendor Risk   | Third-party risk management for our own suppliers and cloud providers            | Vendor risk assessment practices for key suppliers               | Not all sub-suppliers may be formally documented      | Maintain and share a summarized third-party risk register for the engagement.                              |

## 3. Operational Resilience and BCP / DR

| Ref | Area      | Client Requirement (Typical)                                        | Our Baseline Capability                                  | Gap / Risk                                     | Mitigation / Narrative                                                                                 |
|:----|:----------|:-------------------------------------------------------------------|:---------------------------------------------------------|:-----------------------------------------------|:-------------------------------------------------------------------------------------------------------|
| O-01| DR        | Documented DR plan with tested RTO/RPO                             | DR patterns and playbooks for cloud-native deployments   | RTO/RPO values may need alignment to client    | Align RTO/RPO targets during architecture design; schedule joint DR tests within first year of service.|
| O-02| BCP       | Business continuity plan including pandemic, location outage, etc. | BCP policy and location-failover capabilities           | Documentation may not follow client template   | Adapt our BCP documentation to client format; include scenario-based playbook snapshots.               |
| O-03| Monitoring| End-to-end monitoring with defined escalation paths                | Monitoring and alerting for infra and application layers | Signal-to-noise ratio might differ             | Tune alert thresholds with client SRE and operations teams during early sprints.                       |
| O-04| Exit      | Ability to support exit/migration without lock-in                  | Data export and documentation practices                  | Explicit exit playbook may not exist upfront   | Agree on exit principles and include them in contract; build exit plan as part of later phases.        |

This matrix is not a static template; it is updated per RFP. The key is to always be precise about:
- What we can credibly claim now.
- What we are willing to build or adapt as part of the engagement.
- Which gaps require either a partner or a change in scope or pricing.
