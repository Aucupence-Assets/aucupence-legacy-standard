# Presales Commercial & Scope Q&A – Standard Library

This document contains commercial and scope-related Q&A that we reuse in presales conversations, especially when clients challenge pricing models, discounts or change-control rules.

---

## 1. Scope & Change Control

### Question: Why do you insist on a formal change-control process?

**Answer:**  
Complex digital projects evolve over time. Without a clear mechanism to manage changes, both parties risk hidden scope, shifting deadlines and unplanned cost. A structured change-control process protects both the customer and the vendor by:

- Making the impact of each change visible (effort, timeline, risk),
- Ensuring decisions are documented and traceable,
- Keeping the baseline scope and budget stable enough to manage.

In practice, we keep the process lightweight: small clarifications are absorbed within the agreed buffer; only material changes that impact effort, dates or risk are raised as formal change requests.

---

### Question: How do you distinguish between a defect and a change request?

**Answer:**  
A defect is a deviation from the agreed and documented behaviour. A change request is a new or altered requirement compared to that baseline.

We normally define this baseline through signed-off user stories, acceptance criteria or a functional specification. If the delivered behaviour does not match that baseline, the correction is treated as a defect and handled under the existing budget. If the behaviour is new or extends what was originally agreed, it is treated as a change and estimated accordingly.

---

## 2. Fixed Price vs. Time & Materials

### Question: Can you deliver this entire scope on a fixed price?

**Answer:**  
Fixed price is feasible when three conditions are met:

1. The scope is stable and documented in sufficient detail,  
2. The technical and integration risks are understood,  
3. Dependencies on third parties (APIs, data, environments) are under control.

When key assumptions are still open, we usually propose a short discovery phase on Time & Materials to converge on a realistic baseline. After discovery, we can convert well-understood parts of the scope into fixed price, while keeping higher-uncertainty areas on T&M or with explicit assumptions.

This hybrid approach limits your exposure while avoiding an inflated risk premium that would make a fully fixed price unattractive.

---

### Question: What exactly goes into your fixed-price calculation?

**Answer:**  
We start from the same effort model we would use for a T&M engagement and then add:

- Contingency for known-unknowns (typically 10–15%),
- A risk premium for areas where we absorb downside risk,
- The cost of governance and reporting required under fixed-price contracts.

We do not quote arbitrary round numbers. Each fixed-price component can be traced back to a set of assumptions, effort estimates and risk factors, which we can walk you through in a workshop.

---

### Question: How do you protect us if we choose Time & Materials?

**Answer:**  
On T&M we provide transparency and control instead of a risk premium:

- A clear rate card with role definitions and locations,
- Weekly or bi-weekly reporting of effort, burn and forecast-to-complete,
- Optional caps or “not-to-exceed” amounts for specific workstreams,
- The ability to pause or re-prioritise work based on value delivered.

You remain in control of scope and spend, while we avoid loading the price with conservative buffers that may never be used.

---

## 3. Rates, Discounts and Competitor Comparisons

### Question: Your rates are higher than some competitors. Can you match them?

**Answer:**  
We rarely compete on the lowest nominal rate. Instead, we focus on total cost and risk:

- A stronger team can deliver the same scope with fewer person-days,
- Better governance reduces rework and late-stage surprises,
- More experienced engineers handle complex integrations faster and more safely.

That said, we are willing to structure value-based discounts where it makes sense, for example:

- Volume discounts tied to a minimum team size or duration,
- Commitment discounts for multi-year frameworks,
- Rate adjustments when we can use more offshore capacity without increasing risk.

We are open to reviewing competitor proposals, as long as we compare like-for-like in terms of scope, seniority and delivery model.

---

### Question: What levers do we have if we need to reduce the overall cost?

**Answer:**  
There are three main levers:

1. Scope: revisit the “must-have vs. nice-to-have” features and consider phasing some items to a later release.  
2. Team mix: adjust the blend of senior/junior roles or onshore/offshore ratio while keeping critical roles (for example architect and lead PM) in place.  
3. Timeline: in some cases, extending the timeline slightly allows for a leaner team without overloading individuals or increasing risk.

We can run a short working session to model combinations of these levers against your target budget.

---

## 4. Budget Constraints & Phasing

### Question: Our budget is significantly below your estimate. What are our options?

**Answer:**  
When there is a clear gap between the budget and a realistic estimate, the options are:

- Phase the scope: deliver a smaller but coherent “Version 1” that fits the budget and creates value quickly, then plan follow-on phases.  
- Narrow the problem: focus on one segment, channel or product line first instead of tackling everything in one step.  
- Adjust quality attributes carefully: for example, starting with a simpler reporting layer or fewer non-critical integrations, while keeping core security and compliance intact.

We do not recommend simply forcing the same scope into a smaller budget. That usually results in hidden compromises and higher long-term cost.

---

## 5. Overruns and Assumptions

### Question: What happens if you underestimate the effort?

**Answer:**  
For fixed-price components, we absorb normal estimation variance as long as the agreed assumptions hold. If those assumptions change materially—for example, if integrations are added or third-party APIs behave differently than specified—we treat that as scope change and handle it through the change-control process.

For T&M components, we keep a live forecast-to-complete based on real velocity. If we see a trend that would overrun an agreed cap or budget envelope, we raise it early and present options: adjust scope, extend the budget, or change the delivery approach.

Our goal is to surface risks early and keep decisions transparent rather than pushing surprises to the end of the project.
