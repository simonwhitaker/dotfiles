#!/bin/bash

# Get absolute path to dotfiles dir (see http://stackoverflow.com/q/242538/263871; readlink -f doesn't work on OSX)
pushd $(dirname "$0") > /dev/null
DOTFILES_DIR=$(pwd -L)
popd > /dev/null


link() {
  ln_source="$DOTFILES_DIR/$1"
  ln_target="$HOME/$2"
  if [ -L $ln_target ]
  then
    echo [Skipping] $ln_source -\> $ln_target, target symlink already exists
  else
    echo [Installing] $ln_source -\> $ln_target
    ln -sf $ln_source $ln_target
  fi
}

link emacs/init.el .emacs.d/init.el
link git/gitconfig .gitconfig
link git/gitignore .gitignore
link lldb/lldbinit .lldbinit
link vim/vimrc .vimrc
link zsh/zprofile .zprofile
link zsh/zsh-plugins .zsh-plugins
link zsh/zshenv .zshenv
link zsh/zshrc .zshrc

# Create the directories that .vimrc relies on
mkdir -p $HOME/.vim/backup
mkdir -p $HOME/.vim/temp
