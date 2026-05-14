# setup-dev.ps1
# Development environment - automatic setup

$apps = @(
    "Microsoft.VisualStudio.Community",
    "Microsoft.VisualStudioCode",
    "Notepad++.Notepad++",
    "Git.Git",
    "Postman.Postman",
    "SlackTechnologies.Slack",
    "Microsoft.Teams"
)

# Step 1: Update everything that is already installed
Write-Host "Updating existing programs..." -ForegroundColor Yellow
winget upgrade --all --silent --accept-package-agreements --accept-source-agreements

# Step 2: Install what doesn't yet exist
Write-Host "`nA verifying/installing missing programs..." -ForegroundColor Yellow
foreach ($app in $apps) {
    Write-Host "`n  -> $app" -ForegroundColor Cyan
    winget install --id $app --latest --silent --accept-package-agreements --accept-source-agreements
}

Write-Host "`nSetup finished!" -ForegroundColor Green
