alias c=clear
alias code=codium
alias gdu=gdu-go
alias lg=lazygit
alias v=vim
alias vim=nvim
FZF_OPTS="--height 40% --reverse --preview 'bat --color=always {}' --preview-window '~3'"
alias vv="fd --type f --hidden --exclude .git | fzf $FZF_OPTS | xargs nvim"

# git
alias gs="git status --short --branch"
alias gfz="git fuzzy"

# --- Global Aliases - Use Anywhere in Commands --- #
# Redirect stderr to /dev/null
alias -g NE='2>/dev/null'

# Redirect stdout to /dev/null
alias -g NO='>/dev/null'

# Redirect both stdout and stderr to /dev/null
alias -g NUL='>/dev/null 2>&1'

# Pipe to jq
alias -g J='| jq'

# Copy output to clipboard (macOS)
alias -g C='| pbcopy'

# --- Suffix Aliases - Open Files by Extension --- #
# Just type the filename to open it with the associated program
alias -s json='bat -l json'
alias -s md=bat
alias -s go='$EDITOR'
alias -s rs='$EDITOR'
alias -s txt=bat
alias -s log=bat
alias -s py='$EDITOR'
alias -s js='$EDITOR'
alias -s ts='$EDITOR'
alias -s html=open
