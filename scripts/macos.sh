#!/bin/bash

set -euo pipefail

source "$(dirname "$0")/lib/common.sh"

require_cmd stow
require_cmd git

ROOT="$(repo_root)"

info "Stowing macOS config"
cd "$ROOT"
stow --restow -S macos -t "$HOME"
