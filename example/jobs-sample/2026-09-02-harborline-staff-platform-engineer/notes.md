# Notes — Harborline Robotics, Staff Platform Engineer

## Outreach — 2026-09-02 — recruiter — Priya Raman (Technical Recruiter, Harborline)

> Drafted by `/outreach`. **Drafts only — Alex sends these, not the tool.**
> Two variants, same facts, different temperature.

### Variant A — direct (LinkedIn InMail, 98 words)

> Priya — I saw the Staff Platform Infrastructure posting. The line about three
> competing tracing stacks is the part I'd want to work on: I did that
> consolidation at Meridian Health, moving 43 services onto OpenTelemetry and
> retiring three vendor agents, which cut $340K/yr and took cross-service
> root-cause time from ~40 minutes to ~12.
>
> I should say up front that I don't write Rust, so control-plane review would be
> a ramp for me. Everything else in the posting is what I've spent four years on.
>
> Is the role IC, and is there a band you can share? Happy to do 15 minutes.

### Variant B — warm (LinkedIn connection note, 271 chars)

> Priya — the Harborline posting mentions three competing tracing stacks. I ran
> exactly that consolidation at Meridian: 43 services onto OpenTelemetry, three
> agents retired, $340K/yr saved. Curious whether the Staff role is IC. Worth
> 15 minutes?

**Why these are shaped this way**
- Opens on *their* stated problem, not on Alex's job history
- One proof point, with a number, that maps to a must-have
- The Rust gap is volunteered in variant A rather than discovered later —
  `analysis.md` flagged it as the main credibility risk
- Asks the two questions `analysis.md` says to resolve early: IC vs manager, and
  the comp band the posting omits
- No salary number. targets.md: never state one first.
- No "passionate", no "I'd love the opportunity", no apology for reaching out

---

## Outreach — 2026-09-09 — follow-up — Priya Raman

> Sent after a week of silence. References the last contact, adds something new,
> re-asks the same question.

> Priya — following up on my note from the 2nd about the Staff Platform role.
>
> Since then I wrote up the tenant-isolation design I mentioned — namespace-per-
> tenant plus Postgres row-level security, which is the same shape as the move
> from per-customer deployments to shared regional clusters in your posting.
> Happy to walk through what broke the first time we tried it.
>
> Still interested in 15 minutes, and still curious whether the role is IC.

---

## Call log

**2026-09-08 — recruiter screen, Priya Raman, 25 min.**
- Role **is** IC. The "team of 8" is a peer group; the EM is Dan Whitlock, who
  owns reviews. This clears the main red flag in analysis.md.
- Band: $238K–$276K base + equity. Floor in targets.md is $245K base — inside the
  range but not comfortably. Did not name a number; asked where a staff hire with
  platform-migration experience typically lands. She said "upper half."
- Three tracing stacks confirmed as the first project. A previous attempt to
  consolidate stalled in 2025 when the engineer driving it left.
- Rust: they said control-plane review is "expected within a year, not on day
  one." Not a blocker.
- Next: technical screen with two platform engineers, 2026-09-15.

**2026-09-15 — technical screen, 60 min.** System design: multi-tenant isolation
for regional clusters. Went well. Asked about blast radius on a bad tenant
migration — answered from the Meridian pilot. Awaiting scheduling for onsite.
