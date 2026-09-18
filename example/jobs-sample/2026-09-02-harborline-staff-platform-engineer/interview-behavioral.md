# Interview prep — behavioral — Harborline Robotics, Staff Platform Engineer

> Written by `/interview-prep <folder> behavioral` on 2026-09-16. Every STAR
> answer below is built only from `achievements.md`. Where no story fits, it says
> so instead of inventing one.

## Likely questions, most probable first

| # | Question | Probes which JD requirement |
|---|---|---|
| 1 | Walk me through a large migration you led end to end. | "Deep Kubernetes experience — not just using it, but operating it" |
| 2 | We have three competing tracing stacks. How would you approach that? | "Set the standard for observability across the engineering org" |
| 3 | Tell me about a time you set a technical standard other teams had to adopt. | "Mentor senior engineers and raise the technical bar" / multi-team scope |
| 4 | How do you decide what's worth paging someone for? | "Define SLOs with service owners and make on-call sustainable" |
| 5 | Describe a multi-tenant isolation design you've owned. | "Design for multi-tenant isolation… shared regional clusters" |
| 6 | Tell me about a time you were wrong about a design decision. | Staff-level judgment, self-correction |
| 7 | How do you mentor someone more senior than the people you usually mentor? | "Mentor senior engineers" |
| 8 | Tell me about a disagreement with another senior engineer. | Design review, influence without authority |
| 9 | Something you shipped that failed. What happened? | Blameless culture fit |
| 10 | How do you pick what *not* to work on? | Staff-level prioritization |
| 11 | You'd be reviewing Rust you can't yet write. How do you handle that? | The stated nice-to-have gap |
| 12 | Why leave Meridian? | Standard; needs a clean, non-negative answer |

## STAR answers — drawn from achievements.md

### Q1 — large migration end to end
**Story:** "EKS migration of 43 services" (achievements.md, Meridian)

> **S.** We had 43 services on hand-managed EC2 autoscaling groups. Deploys took
> 45 minutes and they were serialized, so one bad release blocked every other
> team in the org.
>
> **T.** Move everything to EKS with no customer-visible outage and no code
> freeze — the business would not accept either.
>
> **A.** I wrote a per-service migration checklist and built Terraform modules
> for the shapes that repeated, so each migration got cheaper than the last.
> We went in dependency order and deliberately started with the two lowest-risk
> services to prove the pattern. For each cutover we ran both stacks in parallel
> behind weighted DNS, so rollback was a DNS change, not an incident.
>
> **R.** Fourteen months, 43 of 43 migrated, zero customer-visible outages
> attributable to the migration. Deploy time went 45 minutes to 6. Infra spend
> dropped 31%.

**If they push on what went wrong:** the first stateful service was a mistake —
we tried it fourth instead of much later and spent three weeks on storage-class
issues that taught us nothing about the other 39. Reordering after that was the
single best call of the project.

### Q2 — three tracing stacks
**Story:** "OpenTelemetry consolidation cut observability cost" (achievements.md)

> **S.** Three vendor agents on every host, overlapping data, paying per GB
> ingested, and still no consistent trace across a service boundary.
>
> **T.** One standard, lower spend, and actually usable cross-service debugging.
>
> **A.** Picked OpenTelemetry for vendor neutrality, wrote shared Go and Python
> instrumentation libraries so teams got tracing by upgrading a dependency rather
> than by doing work, ran a single collector tier, and deleted each old agent as
> its services landed. I sequenced it in the same dependency order as the EKS
> work, so teams absorbed one disruption instead of two.
>
> **R.** All 43 services on OTel. $340K/yr saved. Median time to root-cause a
> cross-service incident went from about 40 minutes to about 12.

**The part they'll care about:** their last attempt stalled in 2025 when the
driver left (per `notes.md`). Lead with the shared-library approach — it is what
makes adoption survive the departure of the person pushing it.

### Q4 — what's worth paging for
**Story:** "SLO framework reduced paging volume" (achievements.md)

> **S.** Paging was threshold-based and noisy. On-call was the top reason people
> gave for wanting off the team.
>
> **T.** Page on user-visible harm, not on CPU graphs.
>
> **A.** Sat with each service owner and defined SLIs for what their users
> actually feel, set SLOs and error budgets, converted alerts to burn-rate
> alerts, and deleted 140 legacy rules. Added blameless postmortems and a weekly
> error-budget review so the numbers stayed live instead of becoming a document.
>
> **R.** Paging volume down 62% in two quarters, adopted by all four platform
> teams, and no increase in incident duration — which was the thing everyone was
> afraid of.

### Q5 — multi-tenant isolation
**Story:** "Tenant isolation unblocked shared infrastructure" (achievements.md) —
the closest match to Harborline's per-customer → shared-regional-cluster move.
Use the 6-weeks-to-4-days onboarding number and the 3-customer pilot.

## ⚠ Questions with no story in achievements.md

**Q7 — mentoring engineers who are already senior.** achievements.md and
master-resume.md support mentoring 4 engineers with 2 promoted *to* senior. That
is mentoring toward senior, not mentoring senior engineers. `analysis.md` graded
this requirement "Moderate" for the same reason.

> Do not stretch this one. The honest answer: "I've mentored four engineers, two
> of whom made senior in that time. Influencing engineers already at senior level
> has been through design review and the SLO rollout rather than one-to-one
> mentoring — I had to get four teams to adopt a standard none of them asked for."
> Then tell the SLO adoption story, which *is* peer influence.

**Q6 — a time you were wrong.** No achievement entry is framed this way. The EKS
stateful-service misordering is the honest candidate but it is not written up.
**Alex should prepare this before the onsite**, and then add it to
achievements.md — not invent one in the room.

**Q9 — something that failed.** Same gap. The dbt escalation numbers are flagged
"Confidence: medium" in achievements.md; that is a candidate for an honest "what
I'd measure differently" answer, not a failure story.

## Questions Alex should ask

Drawn from the red flags and scope signals in `analysis.md`, minus the two
already resolved in the screen:

1. The posting says the last five years of production direction is this role's
   call. What did the last person in this seat decide, and what would you change?
2. The 2025 tracing consolidation stalled when the driver left. What would make
   this attempt survive that?
3. Who decides when a service is allowed to skip the paved path?
4. How does the platform team hear about pain — tickets, embedding, on-call?
5. "Unlimited PTO" is in the posting with no floor. What did the team actually
   take last year?
6. If I'm reviewing Rust within a year, what does ramping look like in practice —
   pairing, a starter service, a course budget?

## Weaknesses they will probe

**Rust.** Named in outreach already, and they said "within a year, not day one."
Framing: "I've learned two production languages on the job. I'd want a real
service to learn on rather than a tutorial." Do not claim familiarity.

**No robotics or real-time domain.** constraints.md forbids implying otherwise.
Framing: point at the JD's own "what you'll do" list — Kubernetes, observability,
multi-tenancy, SLOs, Terraform — none of which is robotics. Ask what the domain
actually changes about platform work; it is a genuine question, not a deflection.

**Healthcare → robotics is a domain switch at staff level.** Some interviewers
read staff as domain-expert. Framing: the tenant-isolation work was driven by
HIPAA constraints, so Alex has built platforms under external constraint — while
being precise, per constraints.md, that Alex was never the accountable party for
compliance.
