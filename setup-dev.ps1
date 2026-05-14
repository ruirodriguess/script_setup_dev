# setup-dev.ps1
# Development environment - automatic setup

$apps = @(
    "Microsoft.Teams"
)

foreach ($app in $apps) {
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
