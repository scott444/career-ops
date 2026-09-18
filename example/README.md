# Worked example — one application, start to finish

Everything here is **fictional**. Alex Rivera is not a real person; Harborline
Robotics, Meridian Health, Tidewater Analytics and Cobalt Systems are invented
companies. Contact details use `example.com` and a `555-01xx` number, both
reserved for fiction. No real person's data appears in this repository — see
[§3 of the root README](../README.md#3-the-privacy-model--read-this-before-you-push-anything).

The point of this folder is that you can read the whole cycle — including the
**[built PDF](jobs-sample/2026-09-02-harborline-staff-platform-engineer/resume.pdf)** —
without installing anything or having a profile of your own.

## The artifacts

**Source of truth** — `profile-sample/` (in a real setup: `profile/`, gitignored)

| File | What it is |
|---|---|
| [`constraints.md`](profile-sample/constraints.md) | The hard limits. Loads in every session, ahead of everything else. |
| [`master-resume.md`](profile-sample/master-resume.md) | The quarry — everything Alex has done, too long on purpose. Ends with an explicit "things Alex has NOT done" list. |
| [`achievements.md`](profile-sample/achievements.md) | STAR stories with metrics and a confidence rating. Resume bullets are cut from here. |
| [`targets.md`](profile-sample/targets.md) | Titles, comp floor, dealbreakers, companies to avoid. |
| [`linkedin-current.md`](profile-sample/linkedin-current.md) | The profile as it reads today, filler and all, so `/linkedin audit` has something to diff. |

**One application** — `jobs-sample/2026-09-02-harborline-staff-platform-engineer/`

| File | Produced by | What to look at |
|---|---|---|
| [`jd.md`](jobs-sample/2026-09-02-harborline-staff-platform-engineer/jd.md) | `/analyze-job` | The posting, saved verbatim and never edited. |
| [`analysis.md`](jobs-sample/2026-09-02-harborline-staff-platform-engineer/analysis.md) | `/analyze-job`, then `/tailor-resume` appends | Fit table with evidence per requirement, a blunt 8/10, red flags, and the tailoring notes. |
| [`resume.md`](jobs-sample/2026-09-02-harborline-staff-platform-engineer/resume.md) | `/tailor-resume` | Two pages. Every bullet traces to the profile. |
| [**`resume.pdf`**](jobs-sample/2026-09-02-harborline-staff-platform-engineer/resume.pdf) | `scripts/build-pdf.sh` | The deliverable. Text-based, embedded fonts, zero image objects. |
| [`ats-check.md`](jobs-sample/2026-09-02-harborline-staff-platform-engineer/ats-check.md) | `/ats-check` | Real script output, 60% → 70%, and the list of keywords deliberately left missing. |
| [`notes.md`](jobs-sample/2026-09-02-harborline-staff-platform-engineer/notes.md) | `/outreach` | Two recruiter drafts, a follow-up, and the call log. |
| [`interview-behavioral.md`](jobs-sample/2026-09-02-harborline-staff-platform-engineer/interview-behavioral.md) | `/interview-prep` | STAR answers built only from `achievements.md`, plus three questions with **no story** and a note to prepare rather than invent one. |

**Pipeline** — [`tracker-sample.md`](tracker-sample.md) (in a real setup: `jobs/tracker.md`)

## The cycle

```
/analyze-job Harborline "Staff Platform Engineer" <url>
    creates the folder, saves jd.md verbatim, writes analysis.md + fit score
        ↓
/tailor-resume 2026-09-02-harborline-staff-platform-engineer
    writes resume.md from the profile, appends "Tailoring notes" to analysis.md
        ↓
bash scripts/build-pdf.sh <folder>
    pandoc + headless Chrome → resume.pdf
        ↓
/ats-check 2026-09-02-harborline-staff-platform-engineer
    keyword coverage, format audit, honest-ceiling verdict
        ↓
/outreach <folder> recruiter "Priya Raman, technical recruiter"
    two drafts into notes.md — you send them, the tool never does
        ↓
/track <folder> applied "submitted via careers page"
        ↓
/interview-prep <folder> behavioral
    questions, STAR answers, and the gaps you must prepare yourself
        ↓
/track <folder> technical "onsite pending"
```

## What this example is actually demonstrating

The tailoring is the easy part. The reason this repo exists is the refusals.

**1. Keywords are left on the table on purpose.**
The JD wants Rust, robotics, and Bazel. Alex has none of them. Coverage stops at
70% and [`ats-check.md`](jobs-sample/2026-09-02-harborline-staff-platform-engineer/ats-check.md)
lists each omission with the reason. The 60% → 70% lift came from three words —
`tracing`, `production`, `technical` — that were **already true and merely
unsaid**. That is the whole legitimate use of an ATS tool.

**2. A near-miss claim is caught and kept honest.**
The JD asks for "experience mentoring senior engineers." Alex mentored four
engineers, two of whom were *promoted to* senior. Those are different sentences.
The resume keeps the true one, `analysis.md` grades the requirement "Moderate,"
and [`interview-behavioral.md`](jobs-sample/2026-09-02-harborline-staff-platform-engineer/interview-behavioral.md)
scripts the honest version of the answer.

**3. Missing interview stories are flagged, not invented.**
Three likely questions have no matching entry in `achievements.md`. The prep
document says so under a warning heading and tells Alex to prepare them before
the onsite — the one thing a language model will otherwise cheerfully fabricate.

**4. `constraints.md` outranks everything.**
It forbids "led a team of" and "managed", forbids implying robotics experience
from adjacent infrastructure work, and requires the 2017 award be marked as a
team award. Every downstream document obeys it. That file is why a tailoring pass
cannot quietly produce a tidier version of someone's history.

**5. The fit score is allowed to be unflattering.**
8/10 here, with two points taken off in writing. A polite 10 would have cost Alex
the information that Rust is the real risk — which is exactly what the recruiter
note leads with, and what the screen then resolved.

## Reproducing it

From the repository root, with pandoc and Chrome installed:

```bash
bash scripts/build-pdf.sh example/jobs-sample/2026-09-02-harborline-staff-platform-engineer
python scripts/ats_keywords.py \
  example/jobs-sample/2026-09-02-harborline-staff-platform-engineer/jd.md \
  example/jobs-sample/2026-09-02-harborline-staff-platform-engineer/resume.md
```

The second command prints the 70% block quoted in `ats-check.md`.

## Why the folders are named `-sample`

`.gitignore` excludes `profile/`, `jobs/` and `tracker.md` **unanchored**, so
those names are ignored at any depth — deliberately, so a stray copy of real
career data anywhere in the tree cannot be committed. Renaming the example
directories was the safer fix. In your own setup the real directories are
`profile/` and `jobs/`, and both are junctions into a separate private repo.
