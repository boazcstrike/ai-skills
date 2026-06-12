#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Setting up AI skills symlinks..."

# Claude Code
mkdir -p "$HOME/.claude"
rm -rf "$HOME/.claude/skills"
ln -s "$REPO_DIR/claude" "$HOME/.claude/skills"
echo "  ~/.claude/skills -> $REPO_DIR/claude"

# OpenCode
mkdir -p "$HOME/.config/opencode"
rm -rf "$HOME/.config/opencode/skills"
ln -s "$REPO_DIR/opencode" "$HOME/.config/opencode/skills"
echo "  ~/.config/opencode/skills -> $REPO_DIR/opencode"

# Codex / generic agents
mkdir -p "$HOME/.agents"
rm -rf "$HOME/.agents/skills"
ln -s "$REPO_DIR/agents" "$HOME/.agents/skills"
echo "  ~/.agents/skills -> $REPO_DIR/agents"

echo "Done."
