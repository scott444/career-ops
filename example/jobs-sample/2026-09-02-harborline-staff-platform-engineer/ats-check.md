# ATS check — Harborline Robotics, Staff Platform Engineer

> Written by `/ats-check` on 2026-09-02. The command output below is the real,
> unedited output of `python scripts/ats_keywords.py` against the files in this
> folder — you can reproduce it yourself.

## First pass

```
$ python scripts/ats_keywords.py jd.md resume.md
COVERAGE: 24/40 = 60%

PRESENT: staff software, software engineer, platform infrastructure, platform,
infrastructure, systems, software, across, services, staff, engineer, record,
own, run, three, kubernetes, design, multi-tenant, isolation, slos, service,
terraform, senior, engineers

MISSING: harborline robotics, re looking, fleet services, senior engineers,
control plane, robotics, what, fleet, harborline, rust, not, looking, set,
technical, production, tracing
```

60% is below the 60% threshold in the skill, so every miss gets triaged. The
script is a blunt n-gram counter — it does not know which misses matter, and
roughly a third of that list is noise. Sorting them is the whole job.

### Misses that are noise — ignore

`what` · `not` · `looking` · `re looking` — artifacts of the script tokenizing
prose like "What we're looking for". No action.

### Misses Alex genuinely has — fix, because the words were simply absent

| Term | True? | Where it went |
|---|---|---|
| `tracing` | Yes — achievements.md, OpenTelemetry consolidation across 43 services | Summary: "OpenTelemetry distributed tracing". Skills: added "distributed tracing" next to OpenTelemetry. |
| `production` | Yes — 11 years operating production systems | Summary: "distributed systems **in production**" |
| `set` / `technical` | Yes — the SLO framework was adopted by four platform teams | Summary: "**set the technical standard** — SLOs and error budgets" |

These were real omissions: the evidence was already in the resume, the JD's exact
word was not. That is the legitimate use of this tool.

### Misses Alex does NOT have — never add

| Term | Why it stays missing |
|---|---|
| `rust` | Alex has never written Rust. master-resume.md says so explicitly. It is a nice-to-have on this posting, and claiming it would collapse in a code review. Raise it in the screen instead. |
| `robotics` · `fleet` · `fleet services` · `control plane` | Harborline's domain vocabulary. constraints.md forbids implying that adjacent infrastructure work is robotics experience. |
| `harborline` · `harborline robotics` | The company's own name. Putting an employer's name on a resume you have not worked at is not keyword optimization. |
| `senior engineers` | Subtle and worth stopping on. Alex mentored 4 engineers, 2 of whom were **promoted to** senior. The JD asks for mentoring **of** senior engineers. Those are different claims and the resume keeps the true one. |

## Second pass, after the honest fixes

```
$ python scripts/ats_keywords.py jd.md resume.md
COVERAGE: 28/40 = 70%

PRESENT: staff software, software engineer, platform infrastructure, platform,
infrastructure, systems, software, across, services, staff, engineer, record,
own, run, set, technical, three, production, kubernetes, tracing, design,
multi-tenant, isolation, slos, service, terraform, senior, engineers

MISSING: harborline robotics, re looking, fleet services, senior engineers,
control plane, robotics, what, fleet, harborline, rust, not, looking
```

**+10 points, and nothing untrue was added.** Every remaining miss is either
parser noise or a thing Alex cannot honestly claim. 70% is the honest ceiling for
this pairing — pushing higher would require lying, so this is where it stops.

## Format check

Run against `resume.md` and the built `resume.pdf`:

- **No tables, no columns, no text boxes.** Single-column throughout.
- **No header/footer text.** `build-pdf.sh` passes `--no-pdf-header-footer`;
  parsers routinely drop that region.
- **No icons or images.** The PDF contains zero image objects — verified with
  `grep -a -c "/Subtype */Image" resume.pdf` → `0`.
- **Text-based, not scanned.** Three embedded TrueType subsets with `/ToUnicode`
  maps, so `pdftotext resume.pdf -` returns the full text, including the `→` and
  `·` characters.
- **Standard section names.** Summary / Experience / Skills / Education — no
  "My Journey", no "What Drives Me".
- **Dates as `Mon YYYY`,** consistent, on the same line as the employer.
- **2 pages,** correct for 11 years per the repo's length convention.

## Verdict

```
Coverage:      70% (up from 60%; honest ceiling for this JD)
Top 3 fixes:   done — added "distributed tracing", "production", "set the
               technical standard"; all three were already true and merely unsaid
Ready to send: yes
```

The residual gap is Rust and the robotics domain. Neither belongs on the resume.
Both belong in the first conversation, named before they can be discovered — see
the recruiter note in `notes.md`, which leads with exactly that.
