#!/bin/bash

set -euo pipefail

source "$(dirname "$0")/lib/common.sh"

require_cmd stow

ROOT="$(repo_root)"
cd "$ROOT"

info "Dry-run check for macOS stow package"
stow -n -v -S macos -t "$HOME"

info "Dry-run check for Neovim stow package"
stow -n -v -S neovim -t "$HOME"
