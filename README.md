# AI Skills

Central source of truth for AI agent skills. Synced across PCs via Git.

## Quick start (new PC)

```bash
git clone git@github.com:boazsze/ai-skills.git ~/ai-skills
cd ~/ai-skills
./bootstrap.sh
```

## What this gives you

Skills become available in all supported agents:

| Agent | Global skills path |
|-------|-------------------|
| Claude Code | `~/.claude/skills/<name>/SKILL.md` |
| OpenCode | `~/.config/opencode/skills/<name>/SKILL.md` |
| Codex | `~/.agents/skills/<name>/SKILL.md` |

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
├── bootstrap.sh
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
2. Run `./bootstrap.sh`
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
