# AI Skills Management

This project is the central source of truth for all AI agent skills.

## Repository structure

```
ai-skills/
├── claude/        → symlinked to ~/.claude/skills/
├── opencode/      → symlinked to ~/.config/opencode/skills/
├── agents/        → symlinked to ~/.agents/skills/
├── bootstrap.sh   → sets up symlinks on a new machine
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

Each agent uses a different directory:

```bash
~/.claude/skills/          # Claude Code
~/.config/opencode/skills/ # OpenCode
~/.agents/skills/          # Codex
```

OpenCode searches all three paths:

```bash
~/.config/opencode/skills/<name>/SKILL.md
~/.claude/skills/<name>/SKILL.md
~/.agents/skills/<name>/SKILL.md
```

## Setup with symlinks

```bash
mkdir -p ~/ai-skills
git clone git@github.com:boazsze/ai-skills.git ~/ai-skills
ln -s ~/ai-skills/claude ~/.claude/skills
ln -s ~/ai-skills/opencode ~/.config/opencode/skills
ln -s ~/ai-skills/agents ~/.agents/skills
```

Or just run `./bootstrap.sh` after cloning.

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
