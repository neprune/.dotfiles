# Init pyyenv
pyenv init - | source

# Autojump
[ -f /opt/homebrew/share/autojump/autojump.fish ]; and source /opt/homebrew/share/autojump/autojump.fish

# Pyenv virtualenv auto-activate.
status --is-interactive; and pyenv virtualenv-init - | source

# Perlbrew setup
. ~/perl5/perlbrew/etc/perlbrew.fish
