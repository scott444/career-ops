---
name: interview-prep
description: Generate likely interview questions for a job folder and draft STAR answers from the achievement bank. Includes questions the user should ask.
disable-model-invocation: true
argument-hint: [job folder] [screen|technical|behavioral|hiring-manager]
context: fork
background: false
---

Read jobs/$0/jd.md, analysis.md, resume.md and profile/achievements.md.
Stage: $1.

Produce jobs/$0/interview-$1.md:
1. 10–15 questions this stage is likely to ask, ordered by likelihood, each
   tagged with which JD requirement it probes.
2. For behavioral questions: map to a specific achievement by title; write a
   90-second STAR answer using only facts from achievements.md. Flag any gap
   where no story fits — the user needs to prepare one, not invent one.
3. For technical: list topics to review and 3 "explain your design" prompts
   drawn from the user's own projects.
4. 6 questions the user should ask, specific to red flags and scope signals
   in analysis.md.
5. Weakness/gap section: the 2–3 things the interviewer will probe and an
   honest framing for each.
