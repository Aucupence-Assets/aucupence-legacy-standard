# Estimation Model – Digital Delivery Projects

## 1. Estimation Principles

- Use **three-point estimation** at user story level where possible.
- Apply **complexity bands** (S/M/L/XL) mapped to ideal effort ranges.
- Maintain a clear separation between **build effort**, **environments/DevOps effort**, and **governance overhead**.

## 2. Example Effort Breakdown

| Workstream                  | Description                                      | Estimated Effort (Person-Days) |
|:--------------------------- |:-------------------------------------------------|:--------------------------------|
| Discovery & Elaboration     | Workshops, backlog refinement, architecture      | 40–60                           |
| Core Services Development   | Business microservices and APIs                  | 180–240                         |
| Frontend & UX               | Web/mobile UI, design system integration         | 80–120                          |
| Test Automation             | Unit, API and E2E automation                     | 60–90                           |
| DevOps & Environments       | CI/CD, monitoring, logging, IaC                  | 50–80                           |
| Data Migration              | ETL design, mock runs, reconciliation            | 50–100                          |
| Cutover & Hypercare         | Dress rehearsal, go-live, post-go-live support  | 30–50                           |

## 3. Contingency & Reserves

- **Known-Unknowns Contingency**: typically 10–15% on top of estimated effort.
- **Management Reserve** (commercial decision): typically held outside the customer-visible estimate.

