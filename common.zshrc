# ZSH settings
ZSH_THEME="blinks"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

# ZSH plugins
plugins=(git history-substring-search autojump vi-mode kubectl)

# ZPlugins
zplugin light jonmosco/kube-ps1

# K8s prompt
RPROMPT='$(kube_ps1) '$RPROMPT
KUBE_PS1_CTX_COLOR=green

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
alias i3b="$EDITOR ~/.dotfiles/i3blocksconfig"
alias i3c="$EDITOR ~/.dotfiles/i3config"
alias zc="$EDITOR ~/.dotfiles/common.zshrc"
alias zlc="$EDITOR ~/.zshrc"
alias vm="$EDITOR ~/.dotfiles/init.vim"
alias zr="source ~/.zshrc"

# Kubernetes aliases
alias kx="kubectx"
alias ke="kubens"
alias k9="k9s"

# Git aliases
alias gcm="git commit -m"
