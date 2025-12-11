# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USER}.zsh" ]]; then
  # shellcheck disable=SC1090
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${USER}.zsh"
fi

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# change the path for zsh completion dumps
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# eza options
source "$HOME/.config/zsh/eza.options.sh"

# oh-my-zsh plugins
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(alias-finder brew eza fzf git mise)

# enable zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# enable zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Initialize Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

# history setup
HISTFILE="$HOME/.zhistory"
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# alias-finder
zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
zstyle ':omz:plugins:alias-finder' longer yes   # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes    # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes  # disabled by default

# mise
eval "$($HOME/.local/bin/mise activate zsh)"

# Use 'bat' as pager if it's installed.
if [[ -x "$(command -v bat)" ]]; then
  export PAGER="bat"
  export MANPAGER="bat"
fi

# zoxide (better cd)
if [[ -x "$(command -v zoxide)" ]]; then
  eval "$(zoxide init zsh --cmd z)"
fi

# Set up fzf key bindings and fuzzy completion
if [[ -x "$(command -v fzf)" ]]; then
  source <(fzf --zsh)
fi

# thefuck
if [[ -x "$(command -v thefuck)" ]]; then
  eval "$(thefuck --alias)"
fi

# aliases
source "$HOME/.config/zsh/aliases.sh"

# Java for Android Studio
export JAVA_HOME="$HOME/Applications/Android Studio.app/Contents/jbr/Contents/Home"
case :$PATH: in
*":$JAVA_HOME/bin:"*) ;;
*) export PATH="$PATH:$JAVA_HOME/bin" ;;
esac

# Android SDK
export ANDROID_HOME="$HOME/Library/Android/sdk"
ANDROID_SDK_PATHS="$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools"
case :$PATH: in
*":$ANDROID_SDK_PATHS:"*) ;;
*) export PATH="$PATH:$ANDROID_SDK_PATHS" ;;
esac

# pnpm
export PNPM_HOME="/Users/charleshs/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
