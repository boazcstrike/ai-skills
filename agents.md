# AI Skills Management

This project is the central source of truth for all AI agent skills.

## Prerequisites

- [Node.js](https://nodejs.org/) — `npx skills` auto-installs on first use
- [Git](https://git-scm.com/)
- Windows: enable **Developer Mode** for symlink support, or use WSL2

## Repository structure

```
ai-skills/
├── claude/        → symlinked to ~/.claude/skills/
├── opencode/      → symlinked to ~/.config/opencode/skills/
├── agents/        → symlinked to ~/.agents/skills/
├── bootstrap.sh   → Linux/macOS setup
├── bootstrap.ps1  → Windows setup
├── README.md
├── agents.md
├── CLAUDE.md
└── GEMINI.md
```

## Installing skills globally

```bash
npx skills add -g vercel-labs/agent-skills
# or
npx skills add --global <repo-owner>/<repo-name>
```

Global install makes skills available across all projects.

## Where global skills live

### macOS / Linux

```bash
~/.claude/skills/          # Claude Code
~/.config/opencode/skills/ # OpenCode
~/.agents/skills/          # Codex
```

### Windows

```powershell
%USERPROFILE%\.claude\skills\          # Claude Code
%USERPROFILE%\.config\opencode\skills\ # OpenCode
%USERPROFILE%\.agents\skills\          # Codex
```

OpenCode searches all three paths (whichever exist):

```bash
~/.config/opencode/skills/<name>/SKILL.md
~/.claude/skills/<name>/SKILL.md
~/.agents/skills/<name>/SKILL.md
```

## Setup with symlinks

### macOS / Linux

```bash
mkdir -p ~/ai-skills
git clone git@github.com:boazcstrike/ai-skills.git ~/ai-skills
ln -s ~/ai-skills/claude ~/.claude/skills
ln -s ~/ai-skills/opencode ~/.config/opencode/skills
ln -s ~/ai-skills/agents ~/.agents/skills
```

Or just run `./bootstrap.sh` after cloning.

### Windows (PowerShell as Administrator)

```powershell
git clone git@github.com:boazcstrike/ai-skills.git "$env:USERPROFILE\ai-skills"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.claude\skills" -Target "$env:USERPROFILE\ai-skills\claude" -Force
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.config\opencode\skills" -Target "$env:USERPROFILE\ai-skills\opencode" -Force
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.agents\skills" -Target "$env:USERPROFILE\ai-skills\agents" -Force
```

Or just run `.\bootstrap.ps1` after cloning.

## Adding a skill to the repo

1. Drop `SKILL.md` into the appropriate agent directory (or all three if cross-agent)
2. Commit and push

```bash
git add -A
git commit -m "feat(skills): add <skill-name>"
git push
```

## Philosophy

- **GitHub repo** = source of truth
- **Global agent folders** = local runtime cache (symlinked)
- **npx skills** = package installer for pulling from registries

Do not rely only on `npx skills add` history. Version-control the global skills directory.
