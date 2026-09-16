---
name: track
description: Update tracker.md with application status, next action, and dates. Shows the pipeline on request.
disable-model-invocation: true
argument-hint: [job folder] [status] [note]  — or "show"
---

## Current tracker
!`cat tracker.md`

If $ARGUMENTS is "show": summarize the pipeline — counts by status, anything
with a next-action date in the past, anything untouched for 7+ days.

Otherwise update the row for jobs/$0 (create it if missing):
| Date applied | Company | Role | Folder | Status | Fit | Next action | Due | Last touch |
Status values: researching, applied, screen, technical, onsite, offer, rejected, withdrawn.
Set Last touch to today. Then git commit tracker.md and the job folder with
message "track: <company> <role> → <status>".
