#!/usr/bin/env bash

set -euo pipefail

###################################
# Setup Ubuntu defaults
###################################

mkdir -p "$HOME"

if ! grep -q '^export EDITOR=nvim$' "$HOME/.zshrc" 2>/dev/null; then
  cat >> "$HOME/.zshrc" <<'EOF'

# Dev setup defaults
export EDITOR=nvim
export VISUAL=nvim
export GIT_EDITOR=nvim
alias vi='nvim'
alias vim='nvim'
EOF
fi

# Ensure Git uses Neovim as its editor globally.
git config --global core.editor nvim
