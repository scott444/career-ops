# PowerShell wrapper: .\scripts\build-pdf.ps1 jobs\2026-09-16-acme-staff-swe
param([Parameter(Mandatory=$true)][string]$Dir)
$bash = "$env:ProgramFiles\Git\bin\bash.exe"
if (-not (Test-Path $bash)) { $bash = "bash" }
& $bash "scripts/build-pdf.sh" ($Dir -replace '\','/')
