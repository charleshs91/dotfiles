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
