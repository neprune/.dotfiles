# Theme stuff
ZSH_THEME="blinks"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

# ZSH plugins
plugins=(git history-substring-search autojump)

# Set-up editor
export EDITOR='nvim'
alias vim='nvim'
alias v="nvim"
alias untargz="tar -xzvf"

# Don't fuck up
alias rm="rm -i"
alias rm="rm -i"

# Config editing aliases
alias zc="$EDITOR ~/.dotfiles/common.zshrc"
alias zlc="$EDITOR ~/.zshrc"
alias vc="$EDITOR ~/.dotfiles/init.vim"
alias vlc="$EDITOR ~/.config/nvim/local.vim"
alias zr="source ~/.zshrc"
