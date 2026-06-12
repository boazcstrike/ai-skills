#Requires -RunAsAdministrator

$ErrorActionPreference = "Stop"

$repoDir = Join-Path $env:USERPROFILE "ai-skills"

Write-Host "Setting up AI skills symlinks..."

# Claude Code
$claudePath = Join-Path $env:USERPROFILE ".claude\skills"
New-Item -ItemType Directory -Path (Join-Path $env:USERPROFILE ".claude") -Force | Out-Null
Remove-Item $claudePath -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType SymbolicLink -Path $claudePath -Target (Join-Path $repoDir "claude") -Force | Out-Null
Write-Host "  $claudePath -> $repoDir\claude"

# OpenCode
$opencodePath = Join-Path $env:USERPROFILE ".config\opencode\skills"
New-Item -ItemType Directory -Path (Join-Path $env:USERPROFILE ".config\opencode") -Force | Out-Null
Remove-Item $opencodePath -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType SymbolicLink -Path $opencodePath -Target (Join-Path $repoDir "opencode") -Force | Out-Null
Write-Host "  $opencodePath -> $repoDir\opencode"

# Codex
$agentsPath = Join-Path $env:USERPROFILE ".agents\skills"
New-Item -ItemType Directory -Path (Join-Path $env:USERPROFILE ".agents") -Force | Out-Null
Remove-Item $agentsPath -Recurse -Force -ErrorAction SilentlyContinue
New-Item -ItemType SymbolicLink -Path $agentsPath -Target (Join-Path $repoDir "agents") -Force | Out-Null
Write-Host "  $agentsPath -> $repoDir\agents"

Write-Host "Done."
