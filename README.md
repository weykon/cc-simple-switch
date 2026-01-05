# cc-simple-switch

## **Claude Code Switch Settings (CCSS)**

A simple switcher for Claude Code `~/.claude/settings.json`.

## Install

### One-liner (curl)

> Repo: **weykon/cc-simple-switch**

```bash
curl -fsSL https://raw.githubusercontent.com/weykon/cc-simple-switch/main/install.sh | bash
# then ensure ~/.local/bin is in PATH
```

### Manual

```bash
chmod +x ./ccss
mkdir -p ~/bin
ln -sf "$(pwd)/ccss" ~/bin/ccss
```

## Before you start

1. Make sure Claude has created `~/.claude/settings.json` (run Claude Code once, or create it yourself).
2. Create at least one profile file **before** using `ccss use`:

```bash
# snapshot your current live config into a named profile
ccss save evolink

# or import an existing json into a profile
ccss add minimax ~/.claude/settings.json

# or create profiles manually:
#   ~/.claude/settings.minimax.json
#   ~/.claude/settings.evolink.json
```

## Usage

```bash
ccss list
ccss save minimax
ccss use evolink
ccss use settings.minimax.json
ccss current
```

## Release

Push a tag like `v0.1.0` and GitHub Actions will publish a release with assets.

## How it works

- Profiles: `~/.claude/settings.<name>.json`
- Active live file: `~/.claude/settings.json` (symlink)
- Active pointer: `~/.claude/settings.active` (plain text)

## TODO

- [ ] Add `ccss add` enhancements: support stdin (`ccss add <name> -`) and schema-aware validation.

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=weykon/cc-simple-switch&type=Date)](https://www.star-history.com/#weykon/cc-simple-switch&Date)
