# Presales Commercial & Scope Q&A – Extended Library

This document captures common questions raised by procurement, finance and business stakeholders during presales and contract negotiations. It focuses on scope, pricing models, discounts and risk-sharing.

---

## 1. Scope, Baseline and Change Control

### Q1.1: Why do you insist on a formal change-control process?

**Answer:**  
Complex initiatives evolve as understanding improves. Without a clear process, changes accumulate informally, deadlines slip and nobody can say which decisions were made when. A formal but pragmatic change process:

- Makes impact visible (effort, date, risk),
- Ensures the right people approve trade-offs,
- Protects both parties from unpleasant surprises.

We keep the mechanics lightweight (simple templates, clear thresholds) so the process is a safeguard, not bureaucracy.

---

### Q1.2: How do you distinguish between a defect and a change request?

**Answer:**  
We use the agreed baseline as the reference: signed-off stories, acceptance criteria or specifications.

- If the delivered behaviour deviates from that baseline, it is a defect and is corrected within existing scope.  
- If the behaviour is new, extends the baseline or contradicts it, it is a change.

We can include sample scenarios in the contract annex to illustrate how this works in practice.

---

### Q1.3: What is your approach to handling many small clarifications?

**Answer:**  
Not every clarification becomes a formal change. We normally:

- Include a buffer in the plan for minor clarifications, and  
- Only raise a change request when the cumulative impact crosses an agreed threshold (for example, more than X person-days or a material impact on a milestone).

This keeps administration manageable while still ensuring that meaningful scope creep is discussed and agreed.

---

## 2. Fixed Price vs. Time & Materials

### Q2.1: Can you deliver this entire scope on a fixed price?

**Answer:**  
A full fixed price is feasible when:

- Scope is complete and stable,
- Technical and integration risks are bounded,
- Dependencies on third parties are understood.

If those conditions are not met, a full fixed price tends to include a high risk premium or result in later disputes. We usually propose:

1. A discovery or inception phase on T&M to reduce uncertainty,  
2. Fixed price for well-understood workstreams,  
3. T&M or capped T&M for higher-uncertainty items.

This mix lets you cap exposure without paying for oversized buffers.

---

### Q2.2: How do you calculate a fixed price?

**Answer:**  
We start from the same work-breakdown and effort estimates used for T&M. On top of that we add:

- Contingency for known-unknowns (typically 10–15%),  
- Additional allowance where we take on specific delivery risks,  
- Governance and reporting overhead associated with fixed-price commitments.

We can walk your team through the structure so you understand how the number is constructed and which assumptions it rests on.

---

### Q2.3: How do you protect us if we choose Time & Materials?

**Answer:**  
On T&M we provide transparency and control instead of built-in risk premiums:

- A clear rate card per role and location,  
- Regular reporting of effort, burn and forecast-to-complete,  
- Optional “not-to-exceed” caps on specific workstreams,  
- The ability to adjust scope or pause work based on observed value.

You retain the right to redirect or stop work if it does not deliver the expected outcome.

---

## 3. Rates, Discounts and Cost Optimisation

### Q3.1: Your rates are higher than some competitors. Why?

**Answer:**  
Headline rates do not tell the whole story. Total cost is driven by:

- How many person-days are needed to reach the outcome,  
- How much rework and late change can be avoided,  
- How well risks are managed so that production issues do not consume budget.

We typically staff with fewer but more experienced people, backed by proven frameworks. This can mean higher rates but fewer days and lower risk. We are open to structured discounts where it aligns with volume, duration or strategic value.

---

### Q3.2: What kind of discounts can you offer?

**Answer:**  
Discounts are usually linked to predictable volume or commitment. Examples include:

- Volume discounts for maintaining a minimum team size over an agreed period,  
- Term discounts for multi-year frameworks or rolling renewals,  
- Rate adjustments where we can rely more heavily on offshore capacity while keeping critical roles onshore or nearshore.

We avoid ad-hoc one-off discounts that undermine delivery quality; instead we design pricing that is sustainable for both sides.

---

### Q3.3: What levers do we have if your estimate exceeds our budget?

**Answer:**  
We can jointly explore three levers:

1. **Scope:** prioritise and phase features, delivering a smaller but coherent first release.  
2. **Team mix:** adjust the proportion of senior vs. mid-level roles and onshore vs. offshore presence.  
3. **Timeline:** modestly extending timelines sometimes allows a smaller team with lower monthly burn.

We typically run a short working session where we model scenarios until we find a combination that fits budget and risk appetite.

---

## 4. Budget Constraints & Phasing

### Q4.1: Our budget is fixed this year. Can we still start?

**Answer:**  
Yes, if we focus on a well-defined slice of value. Options include:

- Building a first release for a specific segment or channel,  
- Implementing the core platform with limited products and adding more later,  
- Preparing foundations (APIs, data model, integration patterns) that de-risk later phases.

We will propose a phased roadmap with clear milestones so you can align internal funding and benefits realisation.

---

### Q4.2: How do you handle funding approvals that happen year by year?

**Answer:**  
We align major phases and contract options with your planning cycles. For example:

- Phase 1 within current-year funds,  
- Option for Phase 2 and 3 linked to future approvals, with indicative pricing and guardrails.

This gives you flexibility to stop or redirect after each phase while preserving continuity if further funding is approved.

---

## 5. SLAs, Penalties and Risk Sharing

### Q5.1: What service levels do you typically commit to?

**Answer:**  
We propose SLAs that are realistic and measurable, such as:

- Incident response times by severity,  
- Resolution targets for production issues,  
- Availability targets for platform components under our control.

We also define what is excluded (for example upstream outages or changes outside our scope) and how metrics are calculated. This avoids disputes later and ensures SLAs drive the right behaviour.

---

### Q5.2: Do you accept financial penalties for missing SLAs?

**Answer:**  
We can agree service credits where they are linked to clearly measured, material underperformance within our control. The level of penalties must be balanced with the overall commercial structure; heavily punitive models tend to push prices up and can encourage defensive behaviour.

We prefer models that encourage collaboration to resolve root causes rather than purely shifting financial risk.

---

## 6. Multi-Vendor and Procurement Questions

### Q6.1: How do you work in a multi-vendor environment?

**Answer:**  
We are used to working alongside other vendors and internal teams. Key practices include:

- Clear division of responsibilities documented in a RACI,  
- Joint ceremonies where necessary (for example cross-vendor architecture reviews),  
- Shared ways of working for incident handling and change control.

Our goal is to make interfaces clean and to avoid blame games; we focus discussions on facts and logs.

---

### Q6.2: How do we exit the engagement if needed?

**Answer:**  
We support a structured exit with:

- Handover of code, documentation and configurations,  
- Knowledge-transfer sessions for incoming teams,  
- Assistance during a defined transition window.

We can include an exit plan as an annex in the agreement so both sides know what to expect if this scenario arises.

