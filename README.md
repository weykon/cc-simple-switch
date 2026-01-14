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

# import an existing json into a profile
ccss add minimax /path/to/settings.json
# or infer name from filename
ccss add /path/to/settings.minimax.json
# overwrite existing profile
ccss add minimax /path/to/settings.json --force

ccss use evolink
ccss use settings.minimax.json
ccss current
```

Notes:
- If `python3` exists, `ccss add` validates the JSON before copying.
- If you run `ccss add` / `ccss remove` without required args in a TTY, it will prompt you interactively.

## Release

Push a tag like `v0.1.0` and GitHub Actions will publish a release with assets.

## How it works

ccss keeps multiple **profile files** and makes Claude Code read the *active one* by swapping a symlink.

- Profiles: `~/.claude/settings.<name>.json`
- Active live file Claude reads: `~/.claude/settings.json` (symlink → one profile)
- Active pointer (for humans): `~/.claude/settings.active` (plain text)

```mermaid
flowchart TD
  A[settings.&lt;name&gt;.json profiles\n~/.claude/settings.*.json] -->|ccss use &lt;name&gt;| B[settings.json\n~/.claude/settings.json\n(symlink)]
  B --> C[Claude Code reads settings.json]
  A -->|ccss list/show/remove| A
  D[settings.active\n~/.claude/settings.active] <-->|ccss current/use| B
```

## TODO

- [ ] Add `ccss add` enhancements: support stdin (`ccss add <name> -`) and schema-aware validation.

## Star History

[![Star History Chart](https://api.star-history.com/svg?repos=weykon/cc-simple-switch&type=Date)](https://www.star-history.com/#weykon/cc-simple-switch&Date)
