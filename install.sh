#!/usr/bin/env bash
set -euo pipefail

# One-shot installer for ccss.
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/<OWNER>/<REPO>/main/install.sh | bash
#   # or pin a repo:
#   CCSS_REPO=owner/repo curl -fsSL https://raw.githubusercontent.com/owner/repo/main/install.sh | bash

REPO="${CCSS_REPO:-weykon/cc-simple-switch}"
BRANCH="${CCSS_BRANCH:-main}"
PREFIX="${CCSS_PREFIX:-$HOME/.local/bin}"

mkdir -p "$PREFIX"

url="https://raw.githubusercontent.com/${REPO}/${BRANCH}/ccss"

dst="$PREFIX/ccss"

if command -v curl >/dev/null 2>&1; then
  curl -fsSL "$url" -o "$dst"
elif command -v wget >/dev/null 2>&1; then
  wget -qO "$dst" "$url"
else
  echo "need curl or wget" >&2
  exit 1
fi

chmod +x "$dst"

echo "installed: $dst"
if ! command -v ccss >/dev/null 2>&1; then
  echo "note: ensure '$PREFIX' is in PATH, e.g.:" >&2
  echo "  echo 'export PATH=\"$PREFIX:\$PATH\"' >> ~/.zshrc" >&2
fi
