Write-Host "🚀 Starting Neovim Deployment Suite for Windows..." -ForegroundColor Cyan

# System Dependencies Lifecycle
Write-Host "📦 Installing core binaries and language runtimes via Winget..." -ForegroundColor Yellow
winget install Neovim.Neovim --silent
winget install Git.Git --silent
winget install BurntSushi.Ripgrep --silent
winget install sharkdp.fd --silent
winget install OpenJS.NodeJS --silent
winget install Python.Python.3 --silent

# Automated Directory Junction Link Lifecycle
Write-Host "🔗 Structuring runtime symbolic directory junctions..." -ForegroundColor Yellow
$TargetConfig = "$HOME\AppData\Local\nvim"
# Find the exact folder path where this running script is executing from
$RepoDir = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

# Safely clear out any lingering local appdata nvim folders
    if (Test-Path $TargetConfig) {
        Remove-Item -Recurse -Force $TargetConfig
    }

# Create a robust Directory Junction link targeting our configuration workspace repository
cmd /c mklink /J "$TargetConfig" "$RepoDir"

Write-Host "✨ System linked! Run 'nvim' to initialize your 23 plugins." -ForegroundColor Green
