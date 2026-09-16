---
name: outreach
description: Draft recruiter, hiring-manager, referral, and follow-up messages for a specific job folder. Drafts only; user sends.
disable-model-invocation: true
argument-hint: [job folder] [recruiter|hiring-manager|referral|follow-up] [recipient name/context]
---

Read jobs/$0/analysis.md and profile/. Message type: $1. Recipient context: $2.

Constraints:
- LinkedIn connection note: ≤300 chars. InMail/email: ≤120 words.
- Lead with one specific thing about them or the team, not about you.
- One concrete proof point that maps to a must-have in the JD.
- One clear ask (15-min call, referral, "is this role still open?").
- No compensation. No "I'm passionate about". No apology for reaching out.
- Follow-up: reference date of last contact, add one new piece of value, re-ask.

Produce 2 variants: direct and warm. Save to jobs/$0/notes.md under
"## Outreach — <date> — <type> — <recipient>" so there's a record of what was sent.
