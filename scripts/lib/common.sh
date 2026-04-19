#!/bin/bash

set -euo pipefail

info() {
  printf '[INFO] %s\n' "$*"
}

warn() {
  printf '[WARN] %s\n' "$*" >&2
}

error() {
  printf '[ERROR] %s\n' "$*" >&2
}

require_cmd() {
  local cmd="$1"
  if ! command -v "$cmd" >/dev/null 2>&1; then
    error "Required command not found: $cmd"
    exit 1
  fi
}

repo_root() {
  git rev-parse --show-toplevel
}

is_symlink() {
  [[ -L "$1" ]]
}

is_existing_non_symlink_dir() {
  [[ -d "$1" && ! -L "$1" ]]
}
