# Career Ops: A Claude Code Workspace for Job Search, Resume & LinkedIn Optimization

A repo-as-workspace design. Every skill reads from one source of truth (your master profile), writes into a versioned per-job folder, and never invents a fact about you.

**This repository is built and working.** What you see here is the tooling — nine skills, two scripts, a PDF template, and the permissions to run them. The career data that drives it lives only on the machine that owns it and is deliberately excluded from git (see §3).

Clone it, bootstrap your own profile, and it works. Budget about 90 minutes, most of it spent on the one step that matters — mining your real accomplishments.

---

## 1. Design principles

**One master, many tailored outputs.** You maintain a single `master-resume.md` and `achievements.md`. Every job-specific resume is generated *from* those, never edited into them. Tailoring is a projection, not a fork.

**Skills load on demand; CLAUDE.md is always on.** Facts and rules (your voice, hard constraints, what never to fabricate) go in `CLAUDE.md`. *Procedures* (how to tailor a resume, how to score a JD) go in skills, so they only cost context when used.

**Manual invocation for anything with judgment or side effects.** Skills that write files or produce outreach you'll send carry `disable-model-invocation: true`. Background knowledge (your profile, positioning) carries `user-invocable: false`, so Claude pulls it in automatically but you never type it.

**Nothing leaves the repo automatically.** Claude drafts LinkedIn copy and messages; you paste and send. No scraping, no auto-apply, no bulk messaging — that's how accounts get restricted and how you end up applying to jobs you didn't read.

**Truth is enforced structurally, not by good intentions.** The rules live in an always-on file, `/analyze-job` demands `file:line` evidence for every fit claim, and `/ats-check` refuses to recommend keyword stuffing. The system is designed so that the honest path is the easy one.

---

## 2. Repository layout

Tracked in git — the shareable tooling:

```
career-ops/
├── README.md
├── CLAUDE.md                      # always-on rules, voice, conventions (no personal facts)
├── .gitignore                     # excludes all personal data; see §3
├── .claude/
│   ├── settings.json              # permissions so skills run without prompts
│   └── skills/
│       ├── career-profile/        # background knowledge (Claude-invoked, never typed)
│       ├── mine-achievements/     # /mine-achievements — interviews you, builds the STAR bank
│       ├── analyze-job/           # /analyze-job — JD breakdown + fit score
│       ├── tailor-resume/         # /tailor-resume — job-specific resume
│       ├── ats-check/             # /ats-check — keyword coverage report
│       ├── linkedin/              # /linkedin — headline, about, experience rewrites
│       ├── outreach/              # /outreach — recruiter / referral / hiring-manager notes
│       ├── interview-prep/        # /interview-prep — questions + STAR answers for a job
│       └── track/                 # /track — update the pipeline tracker
├── templates/
│   └── resume.html                # pandoc template for PDF export
└── scripts/
    ├── build-pdf.sh               # md → pdf via pandoc + Chrome/Edge/wkhtmltopdf
    ├── build-pdf.ps1              # PowerShell wrapper around the above
    └── ats_keywords.py            # extracts JD keywords, scores a resume (stdlib only)
```

Local-only — created by you, never committed:

```
├── profile/
│   ├── constraints.md             # personal facts CLAUDE.md imports; never committed
│   ├── master-resume.md           # everything you've ever done; never sent as-is
│   ├── achievements.md            # STAR accomplishment bank with metrics
│   ├── linkedin-current.md        # your profile as it exists today
│   └── targets.md                 # roles, comp floor, location, dealbreakers
├── jobs/
│   └── 2026-09-16-acme-staff-swe/ # one folder per application
│       ├── jd.md                  # the job description, verbatim
│       ├── analysis.md            # output of /analyze-job
│       ├── resume.md              # output of /tailor-resume
│       ├── resume.pdf             # built by scripts/build-pdf.sh
│       ├── cover.md               # optional
│       └── notes.md               # contacts, interview notes, follow-ups
└── tracker.md                     # pipeline table
```

---

## 3. The privacy model — read this before you push anything

**This repository is public, and it holds only tooling.** `.gitignore` excludes three paths, and they hold every fact about a person:

| Path | Why it's excluded |
|---|---|
| `profile/` | Full work history, compensation floor, positioning strategy — including `constraints.md`, the personal facts `CLAUDE.md` imports |
| `jobs/` | Job descriptions, tailored resumes, named contacts, interview notes |
| `tracker.md` | Which companies you're talking to and how far along you are |

Those files stay fully functional on disk. Every skill reads them normally. Git simply cannot see them.

`CLAUDE.md` **is** tracked, deliberately: it holds the rules, voice, and conventions, which are worth version-controlling and contain nothing personal. The personal half lives in `profile/constraints.md` and reaches every session through an `@profile/constraints.md` import. Keep that boundary — a fact typed directly into `CLAUDE.md` is a fact staged for publication.

Use a **second private repository** for the data, this one is for tooling.

Regardless of model: never commit government IDs, account numbers, or passwords. No skill here needs them.

---

## 4. Setup

### 4.1 — Prerequisites

```bash
# Claude Code (Node 18+)
npm install -g @anthropic-ai/claude-code

# PDF toolchain
winget install --id JohnMacFarlane.Pandoc   # Windows
brew install pandoc                         # macOS
sudo apt install pandoc                     # Debian/Ubuntu

# Python 3.9+ for the ATS script — stdlib only, nothing to pip install
python --version
```

For HTML→PDF you need a headless browser. **Chrome or Edge already counts** — `build-pdf.sh` finds them automatically, including at standard Windows install paths. `wkhtmltopdf` works as a fallback.

After installing pandoc on Windows, open a new shell. The installer updates `PATH`, but already-running shells keep the old one, and `build-pdf.sh` will report `pandoc not found` until you restart.

### 4.2 — Clone and bootstrap

```bash
git clone https://github.com/<owner>/career-ops.git
cd career-ops
mkdir -p profile jobs
```

Because the personal files are gitignored, **a fresh clone does not contain them.** That's the point, and it means you create them once. `CLAUDE.md` is the exception — it ships with the repo and imports the rest. The two subsections below give you exactly what to write.

### 4.3 — Write `profile/constraints.md`

`CLAUDE.md` ships with the repo, so you don't write it — but it imports a file that only you can supply:

```markdown
# Personal constraints — LOCAL ONLY, NEVER COMMITTED

## Facts that constrain every output
- [Anything a skill must never get wrong: employment gaps, a single-employer
  history, a career change, work authorization, a name you don't publish under.
  State it plainly so no skill invents a tidier version of your life.]

## Presentation decisions
- [Deliberate choices about what appears in output — e.g. omitting a graduation
  year. Record the true value in profile/master-resume.md and the rendering rule
  here. Omitting a fact from an output is formatting; altering one is not.]

## Target (full detail in profile/targets.md)
- Roles: [e.g. Staff/Principal Software Engineer, ML infra, applied LLM]
- Location: [e.g. Denver / remote US]
- Comp floor: [set in targets.md; never mention a number in outreach]
```

This is the section people skip and then regret. If something about your history could be smoothed over by a helpful model — a gap, one employer, a pivot — write it down as a hard constraint. Stating the truth once is far cheaper than catching a plausible fabrication in every draft.

Two properties make this safe by construction: the file sits under `profile/`, which is gitignored wholesale, and `career-profile` reads it directly as well as through the import, so the constraints survive even if the import fails to resolve.

### 4.4 — Build the profile (the step that actually matters)

Everything downstream is only as good as `profile/`. Create four files:

1. **`profile/master-resume.md`** — every role, project, and bullet you've ever put on a resume. Too long is correct; this is the quarry, not the product. If you have no resume to paste, run `/mine-achievements` and let it interview you.
2. **`profile/linkedin-current.md`** — your headline, About, and each Experience entry, verbatim as they read today. `/linkedin audit` diffs against this, so an approximation makes the audit useless.
3. **`profile/targets.md`** — titles you want, titles you'd accept, industries, comp floor, location, must-haves, dealbreakers, companies to avoid. `/analyze-job` scores against this file, so honesty about the floor is what makes a blunt 5/10 useful.
4. **`profile/achievements.md`** — leave empty. `/mine-achievements` fills it.

Then create `tracker.md`:

```markdown
# Pipeline

| Date applied | Company | Role | Folder | Status | Fit | Next action | Due | Last touch |
|---|---|---|---|---|---|---|---|---|
```

### 4.5 — Permissions

`.claude/settings.json` ships with the repo and is already configured, so skills read/write the workspace and run the two scripts without prompting every time. It allows both `python` and `python3` because Windows installs only the former.

---

## 5. The skills

Each skill is a folder under `.claude/skills/` containing a `SKILL.md`. **The folder name is the slash command.** All nine pass `claude plugin validate .claude/skills`.

The bodies live in the repo — read them there rather than here, so this README can't drift from what actually runs.

| Command | What it does | Arguments |
|---|---|---|
| *(none — auto)* | `career-profile` loads your positioning whenever it's relevant, so you never re-explain who you are. `user-invocable: false`. | — |
| `/mine-achievements` | Interviews you one question at a time and writes STAR entries to `profile/achievements.md`. Records estimates *as* estimates. | `[role or employer]` |
| `/analyze-job` | Creates the job folder, saves the JD verbatim, writes `analysis.md` with must-haves, ATS keywords, red flags, an evidence-backed fit table, and a blunt 1–10 score. | `[company] [role] [URL or path]` |
| `/tailor-resume` | Projects a job-specific `resume.md` from your profile, reordering and rewording only, then builds the PDF. | `[job folder]` |
| `/ats-check` | Runs the keyword scorer, flags parser-hostile formatting, and gives a 3-line verdict. Never recommends stuffing. | `[job folder]` |
| `/linkedin` | Headline options, About draft, experience rewrites, or a scored audit — always current vs proposed, never posted for you. | `headline\|about\|experience\|audit` |
| `/outreach` | Two variants (direct and warm) of a recruiter, hiring-manager, referral, or follow-up message, logged to the job's `notes.md`. | `[folder] [type] [recipient]` |
| `/interview-prep` | Likely questions for a stage, STAR answers drawn only from your achievement bank, questions *you* should ask, and an honest read on what they'll probe. | `[folder] [stage]` |
| `/track` | Updates the pipeline row and commits, or summarizes the pipeline on `show`. | `[folder] [status] [note]` or `show` |

Two behaviors worth knowing because they're load-bearing:

- **`/mine-achievements` will not write a number you didn't say.** Estimates are recorded as estimates and may only reach a resume with a qualifier.
- **`/interview-prep` flags gaps rather than filling them.** If no story in your bank fits a likely question, it tells you to prepare one — it will not invent one.

---

## 6. Supporting files

**`scripts/ats_keywords.py`** — extracts the most frequent uni/bigrams from a JD, checks which appear in the resume, prints coverage. Standard library only. Reads with explicit UTF-8, because job descriptions are full of smart quotes and em dashes that crash Windows' default encoding.

```bash
python scripts/ats_keywords.py jobs/<folder>/jd.md jobs/<folder>/resume.md
```

**`scripts/build-pdf.sh`** — pandoc renders `resume.md` through `templates/resume.html`, then a headless browser prints it to PDF.

```bash
bash scripts/build-pdf.sh jobs/<folder>      # Git Bash, macOS, Linux
.\scripts\build-pdf.ps1 jobs\<folder>        # PowerShell wrapper
```

It searches `PATH` for chromium/chrome/msedge, then falls back to standard Windows install locations, then to `wkhtmltopdf`. On Windows it converts paths with `cygpath`, since `chrome.exe` cannot read a `/c/...` path.

**`templates/resume.html`** — single column, system fonts, no tables, no icons, no multi-column CSS. That's what ATS parsers read cleanly. It sets letter size with 0.5in margins and avoids orphaned role headings at page breaks. If you restyle it, keep the structure boring; the parser is the audience.

The output is text-based PDF with embedded fonts and zero image objects — worth preserving, because a resume rendered as an image scores zero on every keyword check no matter how well it's written.

---

## 7. Execution: the weekly loop

**Week 0 — foundation (once)**

1. Run `claude` in the repo. Type `/` and confirm the eight invocable skills appear.
2. `/mine-achievements` for each recent role. Budget 60–90 minutes across a few sessions. This is the highest-ROI hour in the process — everything downstream is a projection of it.
3. `/linkedin audit`, then `headline`, `about`, `experience`. Paste the results in yourself. Set "Open to work" visible to recruiters only.

**Per job (30–45 min)**

```
/analyze-job Acme "Staff Software Engineer" https://…    → fit score, apply/skip
/tailor-resume 2026-09-16-acme-staff-swe                 → resume.md + resume.pdf
/ats-check 2026-09-16-acme-staff-swe                     → fix top 3, rebuild
/outreach 2026-09-16-acme-staff-swe referral "Jane, ex-colleague now at Acme"
/track 2026-09-16-acme-staff-swe applied "via referral from Jane"
```

Skip anything scoring under 6 unless a referral changes the math. Volume is not the goal; the analysis step exists so you *don't* tailor a resume for a job you shouldn't want.

**When you get a screen**

```
/interview-prep 2026-09-16-acme-staff-swe screen
/track 2026-09-16-acme-staff-swe screen "Recruiter call Thu 2pm"
```

Repeat for `technical`, `behavioral`, `hiring-manager` as stages advance.

**Every Monday**

```
/track show
```

Send follow-ups for anything past due (`/outreach <folder> follow-up`). Re-run `/mine-achievements` whenever an interview surfaces a story you hadn't written down.

---

## 8. Tuning and troubleshooting

- **A skill isn't triggering** — the folder name is the command. Check `.claude/skills/<name>/SKILL.md` exists and starts with `---` on line 1. `claude plugin validate .claude/skills` reports frontmatter parse errors.
- **`pandoc not found` right after installing it** — the installer updated `PATH`, but your running shell still has the old copy. Open a new shell.
- **A gitignore rule silently does nothing** — gitignore does not support trailing comments. `profile/    # my history` is a literal pattern that matches no file, and your data stays tracked. Put comments on their own line, and verify with `git check-ignore -v <path>`.
- **Verify before you push, not after** — `git status --short` and `git ls-files` show what's actually tracked. On a public repo, a push is not reversible in any meaningful sense; caches and forks outlive deletion.
- **`Permission denied (publickey)` on push** — the remote is SSH but no key is authorized. Switch to HTTPS: `git remote set-url origin https://github.com/<owner>/<repo>.git`.
- **Your email in commit metadata** — files aren't the only leak. Use GitHub's masked address: `git config user.email <id>+<user>@users.noreply.github.com`.
- **`LF will be replaced by CRLF` warnings on Windows** — cosmetic, not an error. Silence with `git config core.autocrlf true`.
- **Claude keeps padding claims** — tighten the "NEVER invent" rule in `CLAUDE.md` and ask it to cite `file:line` for every bullet. The fit table in `/analyze-job` already forces this.
- **JD fetch fails** — most large boards block fetchers. Paste the text; the skills handle that path deliberately.
- **Too many skills in context** — `/skill-doctor` shows cost and usage; set rarely-used ones to `"name-only"` in `skillOverrides`.
- **Reuse across machines** — clone the repo and the tooling comes with it. Recreate `CLAUDE.md` and `profile/` from §4.3–4.4, or sync them privately. Personal-only tweaks go in `~/.claude/skills/`.
- **Improve a skill** — install `skill-creator` (`/plugin install skill-creator@claude-plugins-official`) and evaluate a change on realistic prompts before committing it.

---

## 9. What this deliberately doesn't do

- **Auto-apply or mass-submit.** Every application is a decision you make after reading `analysis.md`.
- **Scrape LinkedIn or post on your behalf.** Draft → you paste.
- **Hide keywords, white-text, or otherwise game ATS.** Coverage reports tell you what to *learn or highlight*, not what to fake.
- **Invent anything about you.** Not a metric, not a date, not a job that would make a timeline look tidier. If it isn't in `profile/`, a skill asks instead of guessing.
- **Store credentials or IDs.** Nothing here needs them.

---

Official reference for skill syntax as it evolves: https://code.claude.com/docs/en/skills
