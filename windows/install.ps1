#!/usr/bin/env pwsh
<#
    Bootstrap script for Windows: installs Git and Ansible so you can clone this repo
    and run Ansible playbooks for the rest of the setup.

    Usage:
      1. Run this script in an elevated PowerShell to get Git + Ansible
      2. Clone this repo: git clone https://github.com/ri5h/dev-setup.git
      3. cd dev-setup/windows
      4. Run: ansible-playbook bootstrap.yml
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Error 'winget is not available. Install winget first and re-run this script.'
    exit 1
}

function Test-PackageInstalled {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Id
    )
    $listOutput = winget list --id $Id --exact --source winget 2>$null
    return [bool]($listOutput | Select-String -Pattern $Id -Quiet)
}

function Install-WingetPackage {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [Parameter(Mandatory = $true)]
        [string]$Id
    )

    if (Test-PackageInstalled -Id $Id) {
        Write-Host "✔ $Name already installed." -ForegroundColor Green
        return
    }

    Write-Host "Installing $Name..." -ForegroundColor Yellow
    winget install --id $Id --exact --source winget --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -ne 0) {
        throw "winget failed to install $Name (exit code $LASTEXITCODE)."
    }
    Write-Host "✔ Installed $Name." -ForegroundColor Green
}

# Install Git (required to clone repo)
Install-WingetPackage -Name 'Git' -Id 'Git.Git'

# Install Python (required for Ansible)
Install-WingetPackage -Name 'Python' -Id 'Python.Python.3.12'

# Refresh PATH so pip is available
$env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# Install Ansible via pip
Write-Host "Installing Ansible via pip..." -ForegroundColor Yellow
pip install --user ansible
if ($LASTEXITCODE -ne 0) {
    Write-Warning "pip install ansible failed. You may need to restart your shell and run: pip install --user ansible"
}

Write-Host ""
Write-Host "Bootstrap complete!" -ForegroundColor Cyan
Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "  1. Restart your terminal (to refresh PATH)" -ForegroundColor White
Write-Host "  2. git clone https://github.com/ri5h/dev-setup.git" -ForegroundColor White
Write-Host "  3. cd dev-setup/windows" -ForegroundColor White
Write-Host "  4. ansible-playbook bootstrap.yml" -ForegroundColor White
