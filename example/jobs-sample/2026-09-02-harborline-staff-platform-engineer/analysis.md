# Analysis — Harborline Robotics, Staff Software Engineer, Platform Infrastructure

> Written by `/analyze-job` on 2026-09-02. Fit is deliberately blunt.

## Role summary

This is a platform-ownership role, not a feature role: Kubernetes, observability
consolidation, multi-tenancy, SLOs, and the paved path for other teams. The
robotics domain is the context, not the job — the actual work is the same
infrastructure problem set Alex has been solving at Meridian for four years.

## Must-haves

- "8+ years building and operating distributed systems in production"
- "Deep Kubernetes experience — not just using it, but operating it"
- "Strong Go"
- "Experience with OpenTelemetry or equivalent distributed tracing at scale"
- "Terraform and infrastructure as code"
- "You've designed multi-tenant systems and understand the isolation tradeoffs"
- "Track record defining SLOs and error budgets that teams actually adopt"
- "Experience mentoring senior engineers"

## Nice-to-haves

- Rust ("the control plane is Rust and you'd be reviewing it")
- Robotics, real-time systems, or hardware-in-the-loop testing
- Bazel ("we're migrating the monorepo")
- gRPC and protobuf at scale
- Regulated or safety-critical environment experience

## Keywords

Kubernetes · Go · OpenTelemetry · distributed tracing · Terraform ·
infrastructure as code · multi-tenant · tenant isolation · SLOs · error budgets ·
on-call · CI/CD · platform · distributed systems · observability · gRPC ·
protobuf · mentoring · design review · production operations · Rust · Bazel ·
monorepo · regional clusters · fleet services

## Seniority & scope signals

- "set technical direction for a team of 8" — influence, and the posting never
  says direct reports; read as IC staff. **Confirm in the screen.**
- "work across three product groups" — genuine multi-team scope
- "decides how we run things in production for the next five years" — real
  architectural ownership, and a hint that nobody currently owns it
- "we have three competing tracing stacks and need one" — this is the actual
  first project

## Red flags

- **"Unlimited PTO"** with no stated minimum. Usually means less time taken.
- **"A team that ships"** as a listed benefit is filler, and slightly defensive.
- **No compensation range.** Several states now require one; its absence is
  worth asking about directly and early.
- **"team of 8" + "mentor senior engineers" + "set technical direction"** could
  be a manager role with an IC title. Ask who runs performance reviews.
- Three competing tracing stacks and per-customer deployments suggest real
  platform debt. That is the job, not a surprise — but ask whether the last
  attempt failed and why.

## Fit

| Requirement | Evidence from profile | Strength |
|---|---|---|
| 8+ yrs distributed systems | master-resume.md — Aug 2015 – present, 11 yrs | Strong |
| Deep Kubernetes, operating it | achievements.md — "EKS migration of 43 services", namespace-per-tenant design | Strong |
| Strong Go | master-resume.md Skills; Meridian platform services are Go | Strong |
| OpenTelemetry at scale | achievements.md — "OpenTelemetry consolidation", 43 services, 3 agents → 1 | Strong — near-exact match to their stated first project |
| Terraform / IaC | master-resume.md — 28-module Terraform library | Strong |
| Multi-tenant isolation design | achievements.md — "Tenant isolation unblocked shared infrastructure", namespace-per-tenant + Postgres RLS | Strong — and they are moving per-customer → shared, which Alex has already done |
| SLOs and error budgets adopted | achievements.md — "SLO framework reduced paging volume", 4 teams, −62% pages | Strong |
| Mentoring senior engineers | master-resume.md — mentored 4, 2 promoted to senior | Moderate — mentored *to* senior, not *senior* engineers |
| Rust | none | **Absent** |
| Robotics / real-time / HIL | none — constraints.md rules out implying it | **Absent** |
| Bazel | none | **Absent** |
| gRPC / protobuf at scale | achievements.md — batched gRPC reader; shared protobuf registry | Strong |
| Regulated environment | master-resume.md — HIPAA-adjacent at Meridian, never the accountable party | Weak — state it precisely or not at all |

## Fit score

**8/10.** Every must-have is a direct hit, and two of them — OpenTelemetry
consolidation and the per-customer → shared-tenancy migration — are not just
matched but are literally the projects Alex already delivered at Meridian. The
missing items are all in the nice-to-have list. The two points come off for
Rust, which they will actually want for control-plane review, and for the domain
gap: Alex has never worked on robotics or real-time systems, and the posting
implies reviewing code in a language Alex does not write.

## Gaps

- **Rust — not a dealbreaker, but do not paper over it.** It is nice-to-have, and
  the platform services are Go. Best handled by naming it first in the screen and
  pointing at the Go and Java depth. Alex should not claim "familiar with."
- **Robotics domain — not a dealbreaker.** The platform problems are domain-
  independent and the JD's own "what you'll do" list contains no robotics.
  constraints.md forbids implying adjacent infra counts as domain experience.
- **Bazel — not a dealbreaker.** Monorepo migration is a nice-to-have and Alex has
  done comparable large migrations.
- **"Team of 8" ambiguity — the real risk.** targets.md rules out management.
  If this turns out to be a manager role with an IC title, it is a skip.

## Recommendation

**Apply.** Nothing in targets.md is violated: Portland hybrid at 2 days/week is
within range, the domain is not on the avoid list, and the scope is genuinely
staff-level with a real on-call rotation. The OpenTelemetry consolidation and the
shared-tenancy migration are close enough to Alex's last four years that the
resume almost writes itself.

Two things to resolve before investing further: get the comp band early, since
the post omits it and targets.md sets a floor of $245K base; and confirm in the
screen that this is an IC role and who owns performance reviews for the 8.

---

## Tailoring notes

> Appended by `/tailor-resume` on 2026-09-02.

**What moved up.** The Meridian bullets were reordered to lead with EKS
migration, OpenTelemetry consolidation, tenant isolation, and the SLO framework —
the four must-haves that map most directly, and in roughly the order the JD lists
them. Kubernetes and Go were pulled to the front of the Skills block; the
original master-resume Skills line leads with languages generally.

**What was cut.** Tidewater and Cobalt were compressed from five and four bullets
to three and two. Cut entirely: the Airflow cron migration, Great Expectations
data-quality checks, the carrier-integration framework, and the Cobalt team award
— all true, none load-bearing for a platform-infrastructure role, and the award
would need the "(team)" qualifier that constraints.md requires, which costs a line
to say something that adds nothing here. The feature-store bullet stayed because
"three consuming teams" is multi-team influence evidence.

**Kept despite weak keyword value.** The test-suite bullet (52 min → 9 min) stayed
because the JD asks for CI/CD paths that let teams ship in days, and it is the
earliest evidence that Alex has cared about developer experience for a decade.

**Keywords deliberately NOT included:**

- **Rust** — Alex has never written it. The JD lists it as nice-to-have. Adding
  "exposure to Rust" would be the kind of soft lie that collapses in a code
  review. Left out; it belongs in the screen conversation instead.
- **Robotics / real-time / hardware-in-the-loop** — constraints.md is explicit
  that adjacent infrastructure work is not domain experience.
- **Bazel** — never shipped with it. master-resume.md says so in as many words.
- **"Safety-critical" / "regulated"** — the HIPAA exposure at Meridian was real
  but Alex was never the accountable party. The summary says "HIPAA-regulated
  healthcare data," which is true and verifiable, rather than claiming compliance
  ownership.
- **"Led a team of"** — constraints.md forbids it. The resume says "tech lead"
  and "mentored," which is what actually happened.

**Length:** 2 pages, per CLAUDE.md conventions for 10+ years of experience.
