---
name: analyze-job
description: Analyze a job description into requirements, keywords, red flags, and a fit score against the user's profile. Creates the job folder.
disable-model-invocation: true
argument-hint: [company] [role] [URL or path to JD]
allowed-tools: WebFetch Read Write
---

Inputs: $ARGUMENTS → company, role, and either a URL or a file path.

1. If a URL: WebFetch it. If the page is blocked or thin (common for LinkedIn
   and Workday), tell the user to paste the JD text and stop.
2. Create jobs/<YYYY-MM-DD>-<company>-<role-slug>/ and save the JD verbatim to jd.md.
3. Read profile/ (via career-profile knowledge) and write analysis.md:

   ## Role summary — 2 sentences, what this job actually is under the title
   ## Must-haves — explicit requirements, quoted
   ## Nice-to-haves
   ## Keywords — 15–25 exact terms/phrases an ATS would match (tools, methods, nouns)
   ## Seniority & scope signals — team size, ownership, who it reports to
   ## Red flags — vague comp, "wear many hats", 8+ years for a mid title, etc.
   ## Fit — table: requirement | evidence from profile (file:line or "none") | strength
   ## Fit score — 1–10 with one-paragraph justification
   ## Gaps — what's missing and whether it's a dealbreaker per targets.md
   ## Recommendation — apply / apply with referral / skip, and why

4. Print the fit score and recommendation, then ask whether to run /tailor-resume.

Be blunt in Fit. An honest 5/10 saves more time than a polite 8.
