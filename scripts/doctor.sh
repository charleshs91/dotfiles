#!/bin/bash

set -euo pipefail

source "$(dirname "$0")/lib/common.sh"

ROOT="$(repo_root)"

info "Checking required commands"
for cmd in git stow zsh nvim; do
  require_cmd "$cmd"
done

info "Checking optional commands"
for cmd in fzf bat eza zoxide atuin thefuck mise; do
  if command -v "$cmd" >/dev/null 2>&1; then
    info "Found optional command: $cmd"
  else
    warn "Missing optional command: $cmd"
  fi
done

info "Checking Oh My Zsh"
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  info "Found: $HOME/.oh-my-zsh"
else
  warn "Missing: $HOME/.oh-my-zsh"
fi

info "Checking stow packages"
[[ -d "$ROOT/macos" ]] || { error "Missing macos/"; exit 1; }
[[ -d "$ROOT/neovim" ]] || { error "Missing neovim/"; exit 1; }

info "Doctor check complete"
