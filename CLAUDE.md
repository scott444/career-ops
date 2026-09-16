# Career Ops

This repo manages my job search. Source of truth is `profile/`. Per-application
work lives in `jobs/<date>-<company>-<role>/`. Pipeline status is in
`jobs/tracker.md`.

## Personal constraints

@profile/constraints.md

> The import above carries every fact about me: employment history, presentation
> decisions, and target role. It is gitignored here; the file itself lives in the
> private repo and `profile/` is a junction pointing at it.
>
> **This file (CLAUDE.md) is tracked in git and this repo is public.** Never
> inline a personal fact here — no employer, school, date, location, or comp
> figure. Those belong in profile/constraints.md.
>
> If the import does not resolve, the junctions are missing — clone
> career-ops-private alongside this repo and recreate them (see README §4.3).
> Do not proceed without it, and never reconstruct constraints.md from memory or
> from anything else in this repo: the constraints are what stop a skill from
> inventing a tidier version of someone's history.

**Tracked in git (public)** README.md, this file, `.gitignore`,
`.claude/settings.json`, nine `.claude/skills/*/SKILL.md`, `templates/resume.html`,
and three scripts (`build-pdf.sh`, `build-pdf.ps1`, `ats_keywords.py`).

**Never committed here.** `profile/` and `jobs/` (which contains `tracker.md`)
hold every personal fact. `.gitignore` excludes both wholesale. They are not
directories in this repo — they are Windows junctions into the sibling private
repo `career-ops-private`, which is where that data is versioned and backed up.
Editing through the junction edits the real file; commit those changes from
`../career-ops-private`, never from here.

**Skills: nine, all passing `claude plugin validate .claude/skills`.** Eight are
slash commands; `career-profile` is `user-invocable: false` and loads on its own
whenever the work concerns me. Every writing skill is `disable-model-invocation:
true` — they run when I type them, not when a model decides to.

**Profile status.** `profile/` contains five files: `constraints.md`,
`master-resume.md`, `achievements.md`, `linkedin-current.md`, `targets.md`.
Completeness varies and is stated in `profile/constraints.md`. Before using any
profile file, read it and work from what is actually there — several sections
carry `[TODO]` markers. A `[TODO]` means the fact does not exist yet. Ask for it;
never fill one in.

**Toolchain, verified working.** Python 3.14.0 (`python`, not `python3`),
pandoc 3.11, Chrome for headless PDF printing. `scripts/build-pdf.sh` has been
run end to end and produces a text-based PDF with embedded fonts and no image
objects — that property is what makes it ATS-readable, so preserve it.

**Remote.** `https://github.com/scott444/career-ops.git` over HTTPS, public,
branch `main`. Public is deliberate: the repo publishes the tooling, not the
career data. Before any push, confirm with `git status --short` that nothing
personal is staged.

## Non-negotiable rules
- NEVER invent, inflate, or round up a metric, title, date, employer, or skill.
  If a claim isn't in profile/, ask me before using it.
- NEVER change dates or employers on a tailored resume. Reorder and reword only.
- Tailored resumes are generated from profile/master-resume.md; never edit
  master-resume.md as a side effect of tailoring.
- Draft outreach and LinkedIn copy for me to paste. Do not attempt to post,
  message, or scrape LinkedIn or job boards.
- Before writing to profile/ or jobs/ (including jobs/tracker.md), tell me the
  file path you're writing. Those paths cross a junction into the private repo.
- Never commit a personal fact to this repo. If something belongs in git here, it
  goes in a tracked file and contains no fact about a person. Personal facts are
  committed to career-ops-private instead.

## Voice
- Direct, specific, first person on LinkedIn; implied first person on resume.
- Lead with outcomes and numbers, then how.
- No filler ("results-driven", "passionate", "synergy", "leverage").
- Resume bullets: past tense, start with a strong verb, one line, one metric where true.

## Conventions
- Job folder name: YYYY-MM-DD-company-role-slug
- Resume length: 1 page under 10 yrs experience, 2 pages max otherwise
- Dates: Mon YYYY

## Environment
- Windows. Scripts run under Git Bash (`bash scripts/build-pdf.sh <dir>`) or
  via the PowerShell wrapper (`scripts/build-pdf.ps1`).
- Python is `python` on this machine, not `python3`.
- After installing a tool, open a new shell before expecting it on PATH.
