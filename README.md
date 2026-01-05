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

## Usage

```bash
ccss list
ccss save guodaxia
ccss save minimax
ccss use guodaxia
ccss use settings.minimax.json
ccss current
```

## Release

Push a tag like `v0.1.0` and GitHub Actions will publish a release with assets.

## How it works

- Profiles: `~/.claude/settings.<name>.json`
- Active live file: `~/.claude/settings.json` (symlink)
- Active pointer: `~/.claude/settings.active` (plain text)

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=weykon/cc-simple-switch&type=Date)](https://www.star-history.com/#weykon/cc-simple-switch&Date)
