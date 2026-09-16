#!/usr/bin/env bash
# Usage: bash scripts/build-pdf.sh jobs/2026-09-16-acme-staff-swe
set -euo pipefail
DIR="${1:?usage: build-pdf.sh <job-folder>}"
DIR="${DIR%/}"

command -v pandoc >/dev/null || { echo "pandoc not found. Install it: winget install --id JohnMacFarlane.Pandoc" >&2; exit 1; }

pandoc "$DIR/resume.md" --template templates/resume.html -o "$DIR/resume.html"

# Find a headless browser: PATH first, then standard Windows install locations.
CHROME=""
for c in chromium chromium-browser google-chrome chrome msedge; do
  if command -v "$c" >/dev/null 2>&1; then CHROME="$(command -v "$c")"; break; fi
done
if [ -z "$CHROME" ]; then
  for p in "/c/Program Files/Google/Chrome/Application/chrome.exe" \
           "/c/Program Files (x86)/Google/Chrome/Application/chrome.exe" \
           "/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"; do
    [ -x "$p" ] && { CHROME="$p"; break; }
  done
fi

HTML_ABS="$(cd "$DIR" && pwd)/resume.html"
PDF_ABS="$(cd "$DIR" && pwd)/resume.pdf"

if [ -n "$CHROME" ]; then
  # Windows chrome.exe needs Windows-style paths; cygpath is available in Git Bash.
  if command -v cygpath >/dev/null 2>&1; then
    HTML_URL="file:///$(cygpath -m "$HTML_ABS")"
    PDF_OUT="$(cygpath -w "$PDF_ABS")"
  else
    HTML_URL="file://$HTML_ABS"
    PDF_OUT="$PDF_ABS"
  fi
  "$CHROME" --headless --disable-gpu --no-pdf-header-footer \
    --print-to-pdf="$PDF_OUT" "$HTML_URL" 2>/dev/null
elif command -v wkhtmltopdf >/dev/null 2>&1; then
  wkhtmltopdf --enable-local-file-access "$DIR/resume.html" "$DIR/resume.pdf"
else
  echo "No headless browser or wkhtmltopdf found; $DIR/resume.html was still built." >&2
  exit 1
fi

echo "Built $DIR/resume.pdf"
