# AI Skills

Central source of truth for AI agent skills. Synced across PCs via Git.

## Prerequisites

- [Node.js](https://nodejs.org/) (for `npx skills`)
- [Git](https://git-scm.com/) (to clone and push)
- On Windows: **Developer Mode** enabled (Settings → For developers) for symlink support. If you can't enable it, use WSL2 instead.

`npx skills` auto-installs on first use — no separate `npm install -g` needed.

## Quick start

### macOS / Linux

```bash
git clone git@github.com:boazcstrike/ai-skills.git ~/ai-skills
cd ~/ai-skills
./bootstrap.sh
```

### Windows (PowerShell as Administrator)

```powershell
git clone git@github.com:boazcstrike/ai-skills.git "$env:USERPROFILE\ai-skills"
cd "$env:USERPROFILE\ai-skills"
.\bootstrap.ps1
```

### Windows (WSL2)

Same as Linux — run the instructions above inside WSL2.

## What this gives you

Skills become available in all supported agents:

| Agent | macOS/Linux | Windows |
|-------|-------------|---------|
| Claude Code | `~/.claude/skills/` | `%USERPROFILE%\.claude\skills\` |
| OpenCode | `~/.config/opencode/skills/` | `%USERPROFILE%\.config\opencode\skills\` |
| Codex | `~/.agents/skills/` | `%USERPROFILE%\.agents\skills\` |

## Install new skills

### From a registry (global)

```bash
npx skills add -g <repo-owner>/<repo-name>
```

Example:

```bash
npx skills add -g vercel-labs/agent-skills
```

### Manual install

Drop the skill folder into the corresponding agent directory under this repo:

```
~/ai-skills/
├── claude/        → symlinked to ~/.claude/skills/
├── opencode/      → symlinked to ~/.config/opencode/skills/
├── agents/        → symlinked to ~/.agents/skills/
├── bootstrap.sh   → Linux/macOS setup
├── bootstrap.ps1  → Windows setup
└── README.md
```

Then commit and push:

```bash
git add -A && git commit -m "feat(skills): add <skill-name>"
git push
```

## Backup your skills

Your skills live in Git. After adding or updating skills, commit and push:

```bash
git add -A
git commit -m "chore(skills): update skill inventory"
git push
```

## Switch to a new PC

1. Clone this repo
2. Run `./bootstrap.sh` (macOS/Linux) or `.\bootstrap.ps1` (Windows)
3. Done — skills mirror your old machine

## Recommended workflow

```
GitHub repo  →  source of truth
Global agent folders  →  local runtime cache (symlinks)
npx skills  →  package installer
```

- Install globally for daily use
- Save the inventory in Git
- `npx skills add -g` pulls from package registries; Git captures the result
