# Achievement Bank (STAR) — Alex Rivera (SAMPLE, fictional)

> Written by `/mine-achievements`, one role at a time. Every line is specific,
> defensible, and dated. This is what resume bullets and interview answers are
> built from — if a claim is not here or in master-resume.md, it does not ship.

### Staff Software Engineer @ Meridian Health, Mar 2021 – Present

- **Title (5 words):** EKS migration of 43 services
- **S:** 43 services on hand-managed EC2 autoscaling groups; deploys took 45
  minutes and were serialized, so a bad release blocked every other team.
  **T:** Move to EKS without a customer-visible outage and without a code freeze.
  **A:** Wrote a per-service migration checklist, built Terraform modules for the
  common shape, migrated in dependency order starting with the two lowest-risk
  services, ran both stacks in parallel behind weighted DNS for each cutover.
  **R:** 14 months, 43/43 migrated, zero customer-visible outages attributable to
  the migration. Deploy time 45 min → 6 min. Infra spend down 31%.
- **Metrics:** 43 services · 14 months · 45min→6min · −31% spend · 0 outages
  **Skills demonstrated:** Kubernetes, EKS, Terraform, incremental migration,
  cross-team coordination
- **One-line resume bullet:** Led migration of 43 services from EC2 to EKS in 14
  months with zero customer-visible outages; deploy time 45 min → 6 min, infra
  spend −31%
- **Confidence:** high

- **Title (5 words):** OpenTelemetry consolidation cut observability cost
- **S:** Three vendor agents on every host, overlapping data, $$ per GB ingest,
  and no consistent trace across service boundaries.
  **T:** One tracing standard, lower spend, better cross-service debugging.
  **A:** Picked OpenTelemetry, wrote the shared Go and Python instrumentation
  libraries, ran a single collector tier, migrated services in the same
  dependency order as the EKS work, deleted the old agents as each landed.
  **R:** All 43 services on OTel. Observability spend down $340K/yr. Median time
  to root-cause a cross-service incident fell from ~40 min to ~12 min.
- **Metrics:** 43 services · −$340K/yr · 40min→12min MTTR-to-root-cause
  **Skills demonstrated:** OpenTelemetry, Prometheus, Grafana, vendor migration,
  library design
- **One-line resume bullet:** Drove OpenTelemetry adoption across 43 services,
  replacing three vendor agents with one collector and cutting observability
  spend $340K/yr
- **Confidence:** high

- **Title (5 words):** SLO framework reduced paging volume
- **S:** Paging was threshold-based and noisy; the on-call rotation was the top
  reason engineers gave for wanting to leave the team.
  **T:** Page on user-visible harm, not on CPU graphs.
  **A:** Defined SLIs per service with each service owner, set SLOs and error
  budgets, rewrote alerts to burn-rate alerts, deleted 140 legacy alert rules,
  introduced blameless postmortems and a weekly error-budget review.
  **R:** Paging volume down 62% in two quarters. Adopted by all four platform
  teams. No increase in incident duration.
- **Metrics:** −62% pages · 140 alerts deleted · 4 teams adopted
  **Skills demonstrated:** SLOs, error budgets, incident response, org influence
- **One-line resume bullet:** Wrote the SLO and error-budget framework adopted by
  four platform teams; paging volume fell 62% in two quarters
- **Confidence:** high

- **Title (5 words):** Tenant isolation unblocked shared infrastructure
- **S:** Every customer got a single-tenant install. Onboarding took ~6 weeks and
  the per-customer cost floor made small hospital systems unprofitable.
  **T:** A shared-infrastructure model that still satisfies HIPAA-driven data
  separation requirements.
  **A:** Designed namespace-per-tenant on EKS plus PostgreSQL row-level security,
  wrote the threat model with the security team, built the tenant-provisioning
  control plane, ran a 3-customer pilot before general rollout.
  **R:** Onboarding 6 weeks → 4 days. 180 hospital systems on shared infra.
  Per-tenant cost floor down roughly 70%.
- **Metrics:** 6wk→4d onboarding · 180 tenants · −~70% cost floor
  **Skills demonstrated:** multi-tenancy, Postgres RLS, Kubernetes, threat
  modeling, systems design
- **One-line resume bullet:** Designed the namespace-per-tenant + Postgres RLS
  isolation model behind the move to shared infrastructure; customer onboarding
  6 weeks → 4 days across 180 tenants
- **Confidence:** high

- **Title (5 words):** Batched gRPC reader cut latency
- **S:** The patient-records API fanned out N+1 calls per request; p99 was 1.8s
  and the mobile client timed out for large charts.
  **T:** Sub-500ms p99 without a schema rewrite.
  **A:** Replaced per-record calls with a batched gRPC reader, added a
  read-through Redis cache with per-tenant keys, added load tests to CI to stop
  the regression coming back.
  **R:** p99 1.8s → 340ms. Mobile timeout reports went to zero.
- **Metrics:** p99 1.8s→340ms · 0 timeout reports
  **Skills demonstrated:** gRPC, caching, performance profiling, load testing
- **One-line resume bullet:** Cut patient-records API p99 latency from 1.8s to
  340ms with a batched gRPC reader and per-tenant read-through cache
- **Confidence:** high

### Senior Software Engineer @ Tidewater Analytics, Jun 2018 – Mar 2021

- **Title (5 words):** Forecasting pipeline rebuilt for speed
- **S:** The nightly retail forecasting pipeline ran 11 hours and missed its 6am
  SLA about three nights a month; buyers made decisions on stale numbers.
  **T:** Finish by 6am reliably.
  **A:** Rebuilt on Airflow with a generated DAG factory, moved the heavy joins
  to Spark, partitioned by region, added retries with backoff and a data-quality
  gate that fails fast instead of producing wrong numbers.
  **R:** Runtime 11h → 2h15m. Zero SLA misses in the final year.
- **Metrics:** 11h→2h15m · 3 misses/month → 0 · final 12 months
  **Skills demonstrated:** Airflow, Spark, data modeling, SLAs, Python
- **One-line resume bullet:** Rebuilt the nightly forecasting pipeline on Airflow
  and Spark; runtime 11h → 2h15m and SLA misses went from ~3/month to zero
- **Confidence:** high

- **Title (5 words):** dbt warehouse layer reduced escalations
- **S:** Business logic lived in 400+ untested cron SQL scripts; "this number is
  wrong" escalations ran about 20 a month and nobody could say which query was
  authoritative.
  **T:** One tested, documented warehouse layer.
  **A:** Introduced dbt, modeled the core entities, added tests and freshness
  checks, migrated the scripts in batches, published a data dictionary.
  **R:** Escalations ~20/month → ~9/month over 8 months. Three ML teams built on
  the resulting feature store (~60 features, daily refresh).
- **Metrics:** ~20→~9 escalations/month · 60 features · 3 consuming teams
  **Skills demonstrated:** dbt, SQL, data quality, documentation
- **One-line resume bullet:** Introduced dbt and a tested warehouse layer, halving
  data-correctness escalations and seeding a feature store used by three ML teams
- **Confidence:** medium — the escalation counts came from the support queue and
  the categories shifted partway through; the direction is solid, the exact
  numbers are approximate

### Software Engineer @ Cobalt Systems, Aug 2015 – Jun 2018

- **Title (5 words):** Rating engine extracted from monolith
- **S:** A 400K-line Java monolith; the rating engine was the hottest path and
  every change to it required a full-system release.
  **T:** Extract it without a rewrite and without breaking 14 carrier integrations.
  **A:** Strangler-fig approach — put the interface in front first, shadowed
  traffic for six weeks comparing outputs, cut over per-customer.
  **R:** Shipped. The pattern was reused for four later carve-outs.
- **Metrics:** 400K LOC monolith · 6 weeks shadow traffic · 4 reuses
  **Skills demonstrated:** Java, strangler-fig migration, service extraction
- **One-line resume bullet:** Extracted the rating engine from a 400K-line
  monolith using shadowed traffic and per-customer cutover; the pattern was
  reused for four later service carve-outs
- **Confidence:** high

- **Title (5 words):** Test suite parallelized, 52 to 9
- **S:** 52-minute integration suite; people stopped running it locally and
  broke main instead.
  **T:** Get it under 10 minutes.
  **A:** Parallelized across workers and replaced shared database fixtures with
  per-test containers so tests stopped interfering.
  **R:** 52 min → 9 min. Main-branch breakages dropped noticeably (not measured).
- **Metrics:** 52min→9min
  **Skills demonstrated:** test infrastructure, Docker, CI
- **One-line resume bullet:** Cut the integration test suite from 52 to 9 minutes
  by parallelizing and replacing shared fixtures with per-test containers
- **Confidence:** high
