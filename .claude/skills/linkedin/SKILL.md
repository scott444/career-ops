---
name: linkedin
description: Rewrite LinkedIn headline, About section, or experience entries for search visibility and recruiter conversion, grounded in the user's achievement bank.
disable-model-invocation: true
argument-hint: headline | about | experience | audit
---

Section: $ARGUMENTS. Read profile/linkedin-current.md, achievements.md, targets.md.

**audit** — score the current profile 1–10 on: headline keyword density,
About hook (first 2 lines are all that show), experience specificity,
skills section alignment with targets, and consistency with master-resume.md.
List the 5 highest-leverage changes.

**headline** — 3 options, ≤220 chars each. Formula: [target title] | [2–3
specialties recruiters search for] | [one concrete proof point]. No "seeking".
No "|" spam beyond 3 segments.

**about** — one draft, ≤2,000 chars. Structure:
  line 1–2: the hook — what you do and the outcome you produce (visible before "see more")
  para 2: 2–3 proof points with numbers from achievements.md
  para 3: what you're looking for / how to reach you
  First person. No buzzword list. Short paragraphs.

**experience** — for each role: 1-line scope statement, then 3–4 bullets
mirroring (not copying) the resume, slightly more narrative. Add the skills
LinkedIn lets you tag per role.

Always show current vs proposed side by side. Never post anything; the user pastes.
