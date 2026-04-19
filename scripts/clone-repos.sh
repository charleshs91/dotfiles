#!/bin/bash

set -euo pipefail

source "$(dirname "$0")/lib/common.sh"

require_cmd git

ROOT="$(repo_root)"
cd "$ROOT"

clone_if_missing() {
  local dir="$1"
  local url="$2"

  if [[ -d "$dir" ]]; then
    info "Already present: $dir"
  else
    info "Cloning $dir"
    git clone "$url" "$dir"
  fi
}

clone_if_missing "delta" "https://github.com/dandavison/delta.git"
clone_if_missing "git-fuzzy" "https://github.com/bigH/git-fuzzy.git"
