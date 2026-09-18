# Alex Rivera

Portland, OR · alex.rivera@example.com · (555) 010-4477 · linkedin.com/in/alexrivera-example · github.com/alexrivera-example

**Staff Software Engineer — Platform Infrastructure**

## Summary

Platform engineer with 11 years building and operating distributed systems in
production, the last four owning the Kubernetes platform behind a multi-tenant
clinical data service running across 180 hospital systems. Consolidated three
observability vendors onto OpenTelemetry distributed tracing, designed the
tenant isolation model that moved the product from per-customer installs to
shared infrastructure, and set the technical standard — SLOs and error budgets —
that four platform teams now run on. Go, Kubernetes, Terraform, gRPC.

## Experience

### Staff Software Engineer — Meridian Health, Portland, OR — Mar 2021 – Present

Multi-tenant clinical data platform, 180 hospital systems. Go, Kubernetes,
PostgreSQL, Kafka, Terraform on AWS. Tech lead for a team of 6.

- Led migration of 43 services from EC2 to EKS over 14 months with zero
  customer-visible outages; deploy time 45 min → 6 min, infra spend −31%
- Drove OpenTelemetry adoption across 43 services, replacing three vendor agents
  with one collector and cutting observability spend $340K/yr
- Designed the namespace-per-tenant and PostgreSQL row-level-security isolation
  model behind the move to shared infrastructure; onboarding 6 weeks → 4 days
- Wrote the SLO and error-budget framework adopted by four platform teams;
  paging volume fell 62% in two quarters with no increase in incident duration
- Authored a 28-module Terraform library new services template from; median
  time-to-first-deploy fell from 9 days to 2
- Standardized service-to-service APIs on gRPC with a shared protobuf registry
  and CI-enforced backward-compatibility checks
- Cut patient-records API p99 latency from 1.8s to 340ms with a batched gRPC
  reader and per-tenant read-through cache
- Mentored 4 engineers, 2 promoted to senior; rotation lead for on-call

### Senior Software Engineer — Tidewater Analytics, Eugene, OR — Jun 2018 – Mar 2021

Batch and streaming data pipelines for retail forecasting. Python, Airflow,
Spark, dbt, AWS.

- Rebuilt the nightly forecasting pipeline on Airflow and Spark; runtime
  11h → 2h15m and SLA misses went from ~3/month to zero over the final year
- Introduced dbt and a tested warehouse layer, roughly halving data-correctness
  escalations and publishing the data dictionary the team still uses
- Built the feature store three ML teams consumed — ~60 features, daily refresh

### Software Engineer — Cobalt Systems, Salem, OR — Aug 2015 – Jun 2018

Java/Spring backend services for logistics customers.

- Extracted the rating engine from a 400K-line monolith using shadowed traffic
  and per-customer cutover; the pattern was reused for four later carve-outs
- Cut the integration test suite from 52 to 9 minutes by parallelizing and
  replacing shared fixtures with per-test containers

## Skills

**Platform** Kubernetes, EKS, Terraform, Helm, ArgoCD, Docker, AWS
**Languages** Go, Python, SQL, Java, Bash
**Observability** OpenTelemetry, distributed tracing, Prometheus, Grafana, Honeycomb, SLOs and error budgets
**Data** PostgreSQL, Kafka, Spark, Airflow, dbt, Redis
**Practices** Multi-tenant architecture, gRPC and protobuf, CI/CD, incident response, design review, mentoring

## Education

BS Computer Science, Cascade State University — 2015
