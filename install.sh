#!/bin/bash

# Get absolute path to dotfiles dir (see http://stackoverflow.com/q/242538/263871; readlink -f doesn't work on OSX)
pushd $(dirname "$0") > /dev/null
DOTFILES_DIR=$(pwd -L)
popd > /dev/null


link() {
    ln -sf "$DOTFILES_DIR/$1" "$HOME/.$(basename $1)"
}

link git/gitconfig
link git/gitignore
link lldb/lldbinit
link vim/vimrc
link zsh/zshrc
link zsh/zsh-plugins

# Create the directories that .vimrc relies on
mkdir -p $HOME/.vim/backup
mkdir -p $HOME/.vim/temp
