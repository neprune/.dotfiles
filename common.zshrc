# ZSH settings
ZSH_THEME="blinks"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

# ZSH plugins
plugins=(git history-substring-search autojump vi-mode kubectl)

# Set-up editor
export EDITOR='nvim'

#APT aliases
if type "apt" > /dev/null; then
  alias grab="sudo apt install"
  alias ungrab="sudo apt remove"
fi

# Brew aliases
if type "brew" > /dev/null; then
  alias grab="brew install"
  alias ungrab="brew uninstall"
fi

# General aliases
alias v="nvim"
alias untar="tar -xzvf"
alias al="alias | grep"
alias t="tree"

# Search aliases
alias gels="grep -rnw . -e"

# Config editing aliases
alias zc="$EDITOR ~/.dotfiles/common.zshrc"
alias zlc="$EDITOR ~/.zshrc"
alias vc="$EDITOR ~/.dotfiles/init.vim"
alias vlc="$EDITOR ~/.config/nvim/local.vim"
alias zr="source ~/.zshrc"

# Kubernetes aliases
alias kx="kubectx"
alias ke="kubens"
alias k9="k9s"
alias kgj="kubectl get jobs"
alias kgc="kubectl get configmaps"
alias kdj="kubectl describe job"
alias kdc="kubectl describe configmap"
alias kd="kubectl describe"
alias kg="kubectl get"

# Git aliases
alias gcme="git commit -m"
alias gcmn="git commit --no-verify -m"
alias gcob="git checkout -b"
alias gpn="git push --no-verify"
alias gpsupn="gpsup --no-verify"
alias gprune="git branch --merged >/tmp/merged-branches && v /tmp/merged-branches && xargs git branch -d </tmp/merged-branches"
