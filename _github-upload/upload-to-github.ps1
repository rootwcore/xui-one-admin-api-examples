$ErrorActionPreference = "Stop"

function Write-Title($text) {
    Write-Host ""
    Write-Host "============================================================" -ForegroundColor Cyan
    Write-Host " $text" -ForegroundColor Cyan
    Write-Host "============================================================" -ForegroundColor Cyan
    Write-Host ""
}

function Run-Git([string[]]$GitArgs, [switch]$AllowFail) {
    Write-Host "> git $($GitArgs -join ' ')" -ForegroundColor DarkGray
    & git @GitArgs
    $code = $LASTEXITCODE
    if ($code -ne 0 -and -not $AllowFail) {
        throw "Git command failed: git $($GitArgs -join ' ')"
    }
    return $code
}

Write-Title "GitHub Upload Preparation"

try {
    & git --version | Out-Host
    if ($LASTEXITCODE -ne 0) { throw "Git was not found." }
} catch {
    Write-Host "Git was not found. Run INSTALL_GIT_WINDOWS.bat first." -ForegroundColor Red
    exit 1
}

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent $scriptDir
Set-Location $repoRoot

Write-Host "Repository folder:" -ForegroundColor Yellow
Write-Host $repoRoot
Write-Host ""

if (-not (Test-Path "README.md")) {
    Write-Host "WARNING: README.md was not found in this folder. This script should run from the repository root." -ForegroundColor Yellow
    $continue = Read-Host "Continue anyway? (Y/N)"
    if ($continue.ToUpperInvariant() -ne "Y") { exit 1 }
}

Write-Host "Create an empty repository on GitHub first." -ForegroundColor Yellow
Write-Host "Recommended repository name: xui-one-admin-api-examples"
Write-Host "Example repository URL: https://github.com/YOUR_USERNAME/xui-one-admin-api-examples.git"
Write-Host ""

$remoteUrl = Read-Host "Paste the GitHub repository URL"
if ([string]::IsNullOrWhiteSpace($remoteUrl)) {
    Write-Host "Repository URL cannot be empty." -ForegroundColor Red
    exit 1
}

if ($remoteUrl -notmatch "^https://github\.com/.+/.+\.git$" -and $remoteUrl -notmatch "^git@github\.com:.+/.+\.git$") {
    Write-Host "WARNING: The URL does not look like a GitHub remote URL. Continuing anyway." -ForegroundColor Yellow
}

$userName = (& git config --global user.name) 2>$null
$userEmail = (& git config --global user.email) 2>$null

if ([string]::IsNullOrWhiteSpace($userName)) {
    $newName = Read-Host "Enter your Git user name, example: Your Name"
    if (-not [string]::IsNullOrWhiteSpace($newName)) {
        Run-Git @("config", "--global", "user.name", $newName)
    }
}

if ([string]::IsNullOrWhiteSpace($userEmail)) {
    $newEmail = Read-Host "Enter your Git email address, example: mail@example.com"
    if (-not [string]::IsNullOrWhiteSpace($newEmail)) {
        Run-Git @("config", "--global", "user.email", $newEmail)
    }
}

Write-Title "Preparing Local Git Repository"

if (-not (Test-Path ".git")) {
    Run-Git @("init")
}

Run-Git @("branch", "-M", "main")
Run-Git @("add", "-A")

$status = (& git status --porcelain)
if ([string]::IsNullOrWhiteSpace($status)) {
    Write-Host "No file changes to commit." -ForegroundColor Yellow
} else {
    $commitMessage = Read-Host "Commit message [Initial commit]"
    if ([string]::IsNullOrWhiteSpace($commitMessage)) {
        $commitMessage = "Initial commit"
    }
    Run-Git @("commit", "-m", $commitMessage)
}

Write-Title "Setting GitHub Remote"

$existingRemote = (& git remote get-url origin) 2>$null
if ($LASTEXITCODE -eq 0 -and -not [string]::IsNullOrWhiteSpace($existingRemote)) {
    Run-Git @("remote", "set-url", "origin", $remoteUrl)
} else {
    Run-Git @("remote", "add", "origin", $remoteUrl)
}

Write-Title "Pushing to GitHub"

Run-Git @("push", "-u", "origin", "main")

Write-Title "Done"
Write-Host "Repository uploaded successfully." -ForegroundColor Green
Write-Host "Open your GitHub repository page and verify the files."
