---
name: ats-check
description: Score a tailored resume against its job description for keyword coverage and flag formatting that breaks applicant tracking systems.
disable-model-invocation: true
argument-hint: [job folder name]
allowed-tools: Bash(python scripts/ats_keywords.py *) Read
---

Run: python scripts/ats_keywords.py jobs/$ARGUMENTS/jd.md jobs/$ARGUMENTS/resume.md

Interpret the output:
- Coverage below 60%: list the missing keywords; for each, say whether the user
  genuinely has the skill (per profile/) and where it could truthfully go.
- Flag anything in resume.md that ATS parsers mangle: tables, columns, text in
  headers/footers, icons, unusual section names ("My Journey" → "Experience").
- Do NOT recommend keyword stuffing or hidden text. Ever.

End with a 3-line verdict: coverage %, top 3 fixes, ready-to-send yes/no.
