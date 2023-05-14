#!/bin/bash

# Get absolute path to dotfiles dir (see http://stackoverflow.com/q/242538/263871; readlink -f doesn't work on OSX)
pushd "$(dirname "$0")" > /dev/null || exit 1
DOTFILES_DIR=$(pwd -L)
popd > /dev/null || exit 1


link() {
  ln_source="$DOTFILES_DIR/$1"
  ln_target="$HOME/$2"
  if [ -L "$ln_target" ]
  then
    echo "[Skipping] $ln_source -> $ln_target, target symlink already exists"
  else
    echo "[Installing] $ln_source -> $ln_target"
    mkdir -p "$(dirname "$ln_target")"
    ln -sf "$ln_source" "$ln_target"
  fi
}

# Emacs
link emacs/init.el .emacs.d/init.el

# Fish
link fish/config.fish .config/fish/config.fish
link fish/functions/ .config/fish/functions

# Git
link git/gitconfig .gitconfig

# Vim
mkdir -p "$HOME"/.vim/backup
mkdir -p "$HOME"/.vim/temp
link vim/vimrc .vimrc

# Zsh
link zsh/zprofile .zprofile
link zsh/zsh-completions .zsh-completions
link zsh/zsh-plugins .zsh-plugins
link zsh/zshenv .zshenv
link zsh/zshrc .zshrc
