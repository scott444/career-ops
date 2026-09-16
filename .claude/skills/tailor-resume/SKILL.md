---
name: tailor-resume
description: Generate a tailored resume for a job folder from the master resume and achievement bank. Reorders and rewords only; never fabricates.
disable-model-invocation: true
argument-hint: [job folder name]
---

Job folder: jobs/$ARGUMENTS/ — read jd.md and analysis.md. Read profile/.

Rules (from CLAUDE.md, restated because they matter here):
- Every bullet must trace to master-resume.md or achievements.md.
- Dates, titles, employers unchanged.
- Reorder bullets and sections to put the strongest match first.
- Use the JD's exact terminology where it's true (e.g. "Kubernetes" not "k8s"
  if the JD says Kubernetes). Do not add a skill the profile lacks.
- Length per CLAUDE.md conventions.

Produce jobs/$ARGUMENTS/resume.md in this structure:
  # Name  |  city · email · phone · linkedin · github
  **Headline** — one line mirroring the target title
  ## Summary — 2–3 lines, keyword-dense, specific
  ## Experience — per role: 3–5 bullets, most relevant first
  ## Skills — grouped; lead with JD keywords you genuinely have
  ## Education / Certs

After writing, append a "## Tailoring notes" section to analysis.md:
what you moved, what you cut, which keywords you could NOT honestly include.

Then run scripts/build-pdf.sh jobs/$ARGUMENTS and report the PDF path.
Suggest running /ats-check next.
