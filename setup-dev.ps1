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

foreach ($app in $apps) {
    Write-Host "`nChecking $app..." -ForegroundColor Cyan
    
    $installed = winget list --id $app 2>&1
    
    if ($installed -match $app) {
        Write-Host "  Already installed. Skipping..." -ForegroundColor Gray
    } else {
        Write-Host "  Not found. Installing..." -ForegroundColor Yellow
        winget install --id $app --latest --silent --accept-package-agreements --accept-source-agreements
    }
}

Write-Host "`nSetup complete!" -ForegroundColor Green
