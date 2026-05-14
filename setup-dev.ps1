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

# Let the user choose which apps to process
$selected = $apps | Out-GridView -Title "Select the apps to install" -PassThru

if (-not $selected) {
    Write-Host "No apps selected. Exiting..." -ForegroundColor Red
    exit
}

foreach ($app in $selected) {
    Write-Host "`nChecking $app..." -ForegroundColor Cyan
    
    $installed = winget list --id $app 2>&1
    
    if ($installed -match [regex]::Escape($app)) {
        Write-Host "  Already installed. Skipping..." -ForegroundColor Gray
    } else {
        Write-Host "  Not found. Installing..." -ForegroundColor Yellow
        winget install --id $app --silent --accept-package-agreements --accept-source-agreements
    }
}

Write-Host "`nSetup complete!" -ForegroundColor Green
