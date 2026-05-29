# Repository Guidelines

## Layout

Dotfiles managed with GNU Stow. `macos/` and `neovim/` are Stow packages mirroring `$HOME`; other top-level dirs are automation or external tools.

- `macos/`: shell, Git, tmux, WezTerm, Homebrew, and zsh config.
- `neovim/`: config at `neovim/.config/nvim/`; core in `lua/config/`, plugins in `lua/plugins/`.
- `scripts/`: Bash automation; shared helpers in `scripts/lib/common.sh`.
- Treat `delta/` and `git-fuzzy/` as external unless explicitly changing them.

## Commands

- `make help`: list targets.
- `make setup`: clone external repos.
- `make neovim`: install/link Neovim config.
- `make macos`: setup + Neovim + macOS Stow links.
- `make doctor`: check required/optional tools.
- `make check`: dry-run Stow.

Manual Stow: `stow -d ./macos -t "$HOME" -S .`; unstow with `-D`.

## Style

Follow `.editorconfig`: UTF-8, LF, final newline, trimmed trailing whitespace, 2-space indent; Makefile recipes use tabs. Bash: `#!/bin/bash`, `set -euo pipefail`, lowercase functions, helpers from `scripts/lib/common.sh`. Keep Neovim core in `lua/config/` and plugin specs in `lua/plugins/`.

## Validation

No formal tests. Run `make doctor` and `make check`. For Neovim, open `nvim` and verify Lazy/plugin changes. For shell, test in a fresh/disposable zsh.

## Commits/PRs

Use concise imperative commits, preferably `feat(scope): ...`, `fix(scope): ...`, or area prefixes like `zsh: ...`. PRs should list affected dotfiles, validation commands, and any manual UI/terminal checks.

## Security

Do not commit secrets, tokens, private hostnames, or machine-local files. Use `.stow-local-ignore` for files that should not be symlinked. Run `make check` before install targets on new machines.
