# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# shellcheck disable=SC2296
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # shellcheck disable=SC1090
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# change the path for zsh completion dumps
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# oh-my-zsh plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
  brew
  eza
  fzf
  git
  mise
)
# enable zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# enable zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# history setup
HISTFILE="$HOME/.zhistory"
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# eza options
source "$HOME/.config/zsh/eza.options.sh"

# Initialize Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

# aliases
source "$HOME/.config/zsh/aliases.sh"

# --- Edit Command Buffer --- #
# Open the current command in your $EDITOR (e.g., neovim)
# Press Ctrl+X followed by Ctrl+E to trigger
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

# --- Custom widgets --- #
# Clear screen but keep current command buffer
function clear-screen-and-scrollback() {
  echoti civis >"$TTY"
  printf '%b' '\e[H\e[2J\e[3J' >"$TTY"
  echoti cnorm >"$TTY"
  zle redisplay
}
zle -N clear-screen-and-scrollback
bindkey '^Xl' clear-screen-and-scrollback

# mise
eval "$($HOME/.local/bin/mise activate zsh)"

# Use 'bat' as pager if it's installed.
if [[ -x "$(command -v bat)" ]]; then
  # export PAGER="bat"
  # export MANPAGER="bat"
fi

# zoxide (better cd)
if [[ -x "$(command -v zoxide)" ]]; then
  eval "$(zoxide init zsh --cmd j)"
fi

# Set up fzf key bindings and fuzzy completion
if [[ -x "$(command -v fzf)" ]]; then
  source <(fzf --zsh)
fi

# atuin
export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"
# bindkey '^r' _atuin_search_widget
bindkey '^r' atuin-up-search-viins

# thefuck
if [[ -x "$(command -v thefuck)" ]]; then
  eval "$(thefuck --alias)"
fi

# oh-my-pi completions
eval "$(omp completions zsh)"

# bun completions
[ -s "/Users/charleshs/.bun/_bun" ] && source "/Users/charleshs/.bun/_bun"

# Branchlet setup: added on 2026-09-04
_branchlet() {
  local -a commands
  commands=(
    'create:Create a new worktree'
    'list:List all worktrees'
    'delete:Delete a worktree'
    'settings:Manage configuration'
  )
  _arguments -C \
    '(-h --help)'{-h,--help}'[Show help]' \
    '(-v --version)'{-v,--version}'[Show version]' \
    '(-m --mode)'{-m,--mode}'[Set mode]:mode:(menu create list delete settings)' \
    '--from-wrapper[Called from shell wrapper]' \
    '1:command:->command'
  case "$state" in
    command)
      _describe -t commands 'branchlet commands' commands
      ;;
  esac
}
compdef _branchlet branchlet
branchlet() {
  if [ $# -eq 0 ]; then
    local dir=$(FORCE_COLOR=3 command branchlet --from-wrapper)
    if [ -n "$dir" ]; then
      builtin cd "$dir" && echo "Branchlet: Navigated to $(pwd)"
    fi
  else
    command branchlet "$@"
  fi
}
# End Branchlet setup
