# .dotfiles

Tuned for solarized dark but easily changed.

## Oh my zsh

Idea is that `.zshrc` contains PC specific stuff (e.g. adding things to path, gcloud set-up stuff) and `common.zshrc` is your cross platform stuff.

Prune your `.zshrc` and stick `source <path to repo>/common.zshrc` in it.

Requires [zinit](https://github.com/zdharma/zinit).

> Note: Edit common.zsh via `zc` and `.zshrc` via `zlc`. Reload via `zr`.

## Neovim

Symlink your neovim `init.vim` to this one (e.g. `ln -s <path to repo>/init.vim <path to home>/.config/nvim/init.vim` (use absolute paths; relative ones can be weird).

Requires [vim-plug](https://github.com/junegunn/vim-plug).

Open `nvim` (zsh alias `v`) and run `:source %` and `:PlugInstall` to download the plugins.
