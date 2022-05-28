# Estimation Model – Digital Delivery Projects

This document describes how we estimate the effort and cost for a typical digital delivery project, especially in an offshore / nearshore setup.

---

## 1. Estimation Principles

1. Decompose first, estimate second. We avoid “single number” estimates on a whole project. Instead we break work into workstreams and epics, then estimate each.
2. Use three-point estimates for uncertain items. For high-uncertainty activities we use optimistic, most-likely and pessimistic estimates to make risk visible.
3. Separate effort types. We explicitly separate build effort (implementation and testing), environments / DevOps effort, governance and coordination overhead, and one-off activities such as data migration and cutover.

---

## 2. Example Workstream Breakdown

| Workstream                  | Description                                          | Estimated Effort (Person-Days) |
|:--------------------------- |:-----------------------------------------------------|:--------------------------------|
| Discovery & Elaboration     | Workshops, backlog refinement, architecture baseline | 40–60                           |
| Core Services Development   | Business microservices and APIs                      | 180–240                         |
| Frontend & UX               | Web/mobile UI, design system integration             | 80–120                          |
| Test Automation             | Unit, API and E2E automation                         | 60–90                           |
| DevOps & Environments       | CI/CD pipelines, monitoring, logging, IaC            | 50–80                           |
| Data Migration              | ETL design, test loads, reconciliation               | 50–100                          |
| Cutover & Hypercare         | Dress rehearsal, go-live, post-go-live support      | 30–50                           |

These ranges are then refined once more detailed user stories and non-functional constraints are understood.

---

## 3. Effort Drivers

Key drivers that increase or reduce effort:

- Integration count and quality. Number of external systems (core banking, CRM, KYC, scoring engines). Availability of sandboxes, documentation and test data.
- Non-functional constraints. Performance and latency requirements. Regulatory constraints (audit, data residency, security reviews).
- Team maturity. Whether the vendor team already has experience with similar architectures and technologies, and whether there is an existing delivery playbook that can be reused.

We make these drivers explicit in the proposal so that the client understands why effort looks the way it does.

---

## 4. Contingency and Reserves

- Known-unknowns contingency. Typically 10–15% on top of the visible effort, to handle clarifications, minor requirement changes and unforeseen technical challenges.
- Management reserve. A small internal reserve held by the vendor for strategic risks (e.g. scope under-estimation in a fixed-price environment). This is not usually disclosed in detail but is factored into pricing decisions.

---

## 5. Linking to Commercial Models

Once effort is estimated, we map it to different commercial models:

- Time & Materials. Direct mapping of person-days into a blended rate model; transparent for the client and suitable when scope is evolving.
- Fixed Price (with assumptions). Use T&M estimates as input, add contingency and risk premium. Assumptions and change-control rules are documented; certain workstreams (e.g. discovery) may remain T&M even in a largely fixed-price deal.
- Outcome-based components. For some engagements we consider linking fees to clear business outcomes (e.g. go-live by a date, certain KPIs met), but only when both sides can measure these outcomes reliably.

