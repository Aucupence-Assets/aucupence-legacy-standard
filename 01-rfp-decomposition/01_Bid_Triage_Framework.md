# Bid Triage Framework – Enterprise Digital Programs

This document is used in the first 48–72 hours after receiving an RFP. It answers a single question:

> Should we bid, and if yes, under which constraints, partners and price posture?

We use a 5-dimension scoring model. Each dimension is scored 1–5, then combined into a Go / No-Go / Partner decision.

## 1. Domain and Problem Fit

Question:
- Is the problem in a domain where we have real delivery history and reusable assets?

Scoring:
- 1: No relevant domain experience, no similar case studies, no assets.
- 3: We understand the domain conceptually and have related work, but no direct production reference.
- 5: We have delivered similar systems in production in a comparable regulatory environment.

Signals:
- Prior projects in lending, cards, wallets, onboarding, KYC, AML, or public sector.
- Reusable components: NFR patterns, architecture, test assets, governance models.

Decision rule:
- Average below 3 requires a strong strategic reason to bid (relationship, long-term portfolio value).

## 2. Regulatory and Compliance Load

Question:
- Are the regulatory requirements aligned with our current control framework?

Scoring:
- 1: Multiple mandatory certifications or controls we do not currently have, or new jurisdiction we do not understand.
- 3: We have equivalent controls, but not necessarily mapped to the named frameworks.
- 5: Our current capabilities already align with the stated regulatory guidelines.

Signals:
- Need for PCI-DSS, ISO 27001, SOC 2, local central bank ICT guidelines, outsourcing circulars.
- Explicit requirements on data residency, audit trails, operational resilience, BCP/DR.

Decision rule:
- If compliance score is 1 or 2, we switch to either:
  - Partner-led model (local regulated entity in front), or
  - “Advisory only” posture instead of full delivery ownership.

## 3. Delivery Footprint and Timeline

Question:
- Can we realistically deliver within the proposed timeline and team footprint?

Scoring:
- 1: Aggressive deadlines, no discovery phase, fixed price for a large, unclear scope.
- 3: Timelines are tight but plausible if we prioritize and phase delivery.
- 5: Timelines include discovery, phased rollout, realistic UAT and hardening.

Signals:
- Presence of discovery / elaboration phase.
- Explicit recognition of integration and migration complexity.
- Deployment and cut-over constraints (e.g. fiscal year-end, regulatory deadlines).

Decision rule:
- Score 1 implies “bid only with strong phasing and assumptions” or decline.

## 4. Competitive and Relationship Position

Question:
- Do we have a realistic chance to win at a price that preserves quality and margin?

Scoring:
- 1: Late entry, incumbent vendor in place, clear preference for another provider.
- 3: We are one of several contenders, with partial relationship and references.
- 5: We have a strong sponsor, past track record and clear differentiators.

Signals:
- Is this a true competition or a benchmark to force incumbent discounts?
- Are we providing input to the RFP before issuance?
- Do we have direct access to business and architecture stakeholders?

Decision rule:
- Score 1: Only bid if strategic; otherwise avoid being a “comparison quote”.

## 5. Commercial Attractiveness and Risk

Question:
- Does the commercial model allow us to manage risk without eroding delivery quality?

Scoring:
- 1: Fixed price only, broad scope, unlimited liability, heavy penalties, no assumptions.
- 3: Mixed models possible, but some constraints and punitive clauses.
- 5: Flexible mix (T&M, capped T&M, fixed price work packages) with reasonable liability caps.

Signals:
- Room for change control and re-phasing.
- Cap on total penalties and clear definitions of breach.
- Ability to separate run and change services commercially.

Decision rule:
- Score 1: Prefer not to bid unless we can renegotiate structure.
- Score 5: Prioritize the opportunity even if competition is strong.

## 6. Combined Decision Grid

We compute a simple composite:

- 4–5 average and no dimension below 3 → Go
- 3–4 average, at least one dimension below 3 → Go with constraints (assumptions, partner, phased scope)
- Below 3 average → No-Go, unless Executive Sponsor explicitly overrides

We document:
- Final decision and rationale.
- Required assumptions and red lines (no unlimited liability, no “all inclusive” fixed price, etc.).
- Need for local partners or additional SMEs.

The output of this framework feeds directly into:
- 02_Compliance_Matrix_Banking_Advanced.md
- 04_Commercial_Strategy_Playbook.md
