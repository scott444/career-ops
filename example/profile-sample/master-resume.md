# Master resume — Alex Rivera (SAMPLE, fictional)

> The quarry, not the product. Everything Alex has ever done goes here, too long
> on purpose. Tailored resumes are cut from this; this file is never edited as a
> side effect of tailoring.

## Contact
Alex Rivera — Portland, OR
alex.rivera@example.com · (555) 010-4477
linkedin.com/in/alexrivera-example · github.com/alexrivera-example

## Education
BS Computer Science, Cascade State University — 2015

## Experience

### Staff Software Engineer @ Meridian Health — Portland, OR — Mar 2021 – Present
Multi-tenant clinical data platform serving 180 hospital systems. Go, Kubernetes,
PostgreSQL, Kafka, Terraform on AWS. Team of 6 engineers; tech lead since Jan 2023
(IC track — no direct reports).

- Led migration of 43 services from EC2 autoscaling groups to EKS over 14 months;
  deploy time fell from 45 min to 6 min and infra spend dropped 31%
- Designed the tenant isolation model (namespace-per-tenant + Postgres RLS) that
  unblocked the move from single-tenant installs to shared infrastructure
- Drove OpenTelemetry adoption across all 43 services; replaced three overlapping
  vendor agents with one collector and cut observability spend $340K/yr
- Cut p99 latency on the patient-records API from 1.8s to 340ms by replacing
  N+1 fanout with a batched gRPC reader and a read-through cache
- Wrote the SLO and error-budget framework now used by all four platform teams;
  paging volume dropped 62% in two quarters
- Authored the Terraform module library (28 modules) that new services template
  from; median time-to-first-deploy for a new service went from 9 days to 2
- Standardized internal service-to-service APIs on gRPC with a shared protobuf
  registry and CI-enforced backward-compatibility checks
- Mentored 4 engineers; 2 promoted to senior during that period
- On-call rotation lead: rewrote the runbooks, introduced blameless postmortems

### Senior Software Engineer @ Tidewater Analytics — Eugene, OR — Jun 2018 – Mar 2021
Batch and streaming data pipelines for retail forecasting. Python, Airflow, Spark,
dbt, AWS.

- Rebuilt the nightly forecasting pipeline (Airflow + Spark); runtime 11h → 2h15m
  and the SLA-miss rate went from ~3 nights/month to zero over the final year
- Introduced dbt and a tested warehouse layer; cut "why is this number wrong"
  escalations roughly in half (from ~20/month to ~9/month)
- Built the feature store that three ML teams consumed; ~60 features, daily refresh
- Migrated 400+ hand-rolled cron jobs onto Airflow with a generated DAG factory
- Ran the data-quality on-call; added Great Expectations checks at ingest

### Software Engineer @ Cobalt Systems — Salem, OR — Aug 2015 – Jun 2018
Java/Spring backend services for logistics customers. First job out of school.

- Extracted the rating engine from a 400K-line monolith into its own service;
  the extraction pattern was reused for four later carve-outs
- Built the carrier-integration framework (14 carrier APIs behind one interface)
- Cut the integration test suite from 52 min to 9 min by parallelizing and
  replacing shared fixtures with per-test containers
- Cobalt Systems Engineering Award, 2017 (team award — see constraints.md)

## Skills
**Languages** Go, Python, Java, SQL, Bash, TypeScript (working knowledge)
**Infrastructure** Kubernetes, EKS, Terraform, AWS, Docker, Helm, ArgoCD
**Data** PostgreSQL, Kafka, Spark, Airflow, dbt, Redis
**Observability** OpenTelemetry, Prometheus, Grafana, Honeycomb, SLOs/error budgets
**Practices** gRPC/protobuf, CI/CD, blameless postmortems, mentoring, technical writing

## Things Alex has NOT done
> Kept deliberately. It is faster to read this than to re-derive it every time,
> and it stops a tailoring pass from reaching.

- No Rust, no C++, no embedded or real-time systems
- No robotics, no hardware-in-the-loop, no ROS
- No Bazel (has read about it; never shipped with it)
- No people management, no headcount or budget ownership
- No formal security or compliance ownership (worked adjacent to HIPAA at
  Meridian; was never the accountable party)
