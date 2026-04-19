#!/bin/bash

set -euo pipefail

source "$(dirname "$0")/lib/common.sh"

require_cmd stow
require_cmd git

ROOT="$(repo_root)"
TARGET="$HOME/.config/nvim"

if is_existing_non_symlink_dir "$TARGET"; then
  error "$TARGET exists as a real directory. Refusing to overwrite it."
  error "Move it aside manually, then rerun."
  exit 1
fi

if is_symlink "$TARGET"; then
  info "Removing existing symlink: $TARGET"
  unlink "$TARGET"
fi

info "Stowing neovim config"
cd "$ROOT"
stow --restow -S neovim -t "$HOME"
