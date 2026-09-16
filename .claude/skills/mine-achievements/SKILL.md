---
name: mine-achievements
description: Interview the user to extract quantified accomplishments and write them to profile/achievements.md in STAR format.
disable-model-invocation: true
argument-hint: [role or employer to focus on]
---

Goal: turn vague experience into specific, defensible, quantified stories.

Focus: $ARGUMENTS (if empty, work through master-resume.md top to bottom).

Process:
1. Read profile/master-resume.md and profile/achievements.md.
2. Pick ONE role or project. Ask 3–5 pointed questions, one at a time:
   - What was broken/at risk before you touched it?
   - What did you specifically decide or build (vs the team)?
   - What changed, in numbers? (latency, $, %, headcount, time, incidents, users)
   - Who noticed, and what happened next (promotion, adoption, reuse)?
   - What would have happened if you'd done nothing?
3. When you have Situation / Task / Action / Result with at least one number,
   append to profile/achievements.md under a heading for that role:
   ### <Role @ Company, dates>
   - **Title (5 words):** ...
   - **S:** ... **T:** ... **A:** ... **R:** ...
   - **Metrics:** ...  **Skills demonstrated:** ...
   - **One-line resume bullet:** ...
   - **Confidence:** high/medium (medium = user estimated the number; flag it)
4. Repeat. Stop when the user says stop or the role is exhausted.

Never write a number the user did not say. If they estimate, record it as an
estimate. Estimated numbers may be used on a resume only with a qualifier ("~", "roughly").
