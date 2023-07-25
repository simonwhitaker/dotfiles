#!/bin/bash

# Get absolute path to dotfiles dir (see http://stackoverflow.com/q/242538/263871; readlink -f doesn't work on OSX)
pushd "$(dirname "$0")" > /dev/null || exit 1
DOTFILES_DIR=$(pwd -L)
popd > /dev/null || exit 1


link() {
  ln_source_relative=$1
  ln_source="$DOTFILES_DIR/$1"
  ln_target="$2"
  if [ -L "$ln_target" ]
  then
    echo "🆗 $ln_source_relative -> $ln_target, target symlink already exists"
  else
    echo "✅ $ln_source_relative -> $ln_target"
    if [ -e "$ln_target" ]
    then
      mv -f "$ln_target" "$ln_target.orig"
    fi
    mkdir -p "$(dirname "$ln_target")"
    ln -s "$ln_source" "$ln_target"
  fi
}

# Emacs
link emacs/init.el "$HOME"/.emacs.d/init.el

# Fish
link fish/config.fish "$HOME"/.config/fish/config.fish

for f in fish/functions/*.fish
do
  link "$f" "$HOME"/.config/fish/functions/"$(basename "$f")"
done

for f in fish/conf.d/*.fish
do
  link "$f" "$HOME"/.config/fish/conf.d/"$(basename "$f")"
done

# Git
link git/gitconfig "$HOME"/.gitconfig
# From https://git-scm.com/docs/gitignore:
#
#   Patterns which a user wants Git to ignore in all situations (e.g., backup or
#   temporary files generated by the user’s editor of choice) generally go into
#   a file specified by core.excludesFile in the user’s ~/.gitconfig. Its
#   default value is $XDG_CONFIG_HOME/git/ignore. If $XDG_CONFIG_HOME is either
#   not set or empty, $HOME/.config/git/ignore is used instead.
git_config_dir=${XDG_CONFIG_HOME:-"$HOME"/.config}
link git/gitignore "$git_config_dir"/git/ignore
link lazygit/config.yml "$HOME/Library/Application Support/lazygit/config.yml"

# Vim
mkdir -p "$HOME"/.vim/backup
mkdir -p "$HOME"/.vim/temp
link vim/vimrc "$HOME"/.vimrc

# Zsh
link zsh/zprofile "$HOME"/.zprofile
link zsh/zsh-completions "$HOME"/.zsh-completions
link zsh/zsh-plugins "$HOME"/.zsh-plugins
link zsh/zshenv "$HOME"/.zshenv
link zsh/zshrc "$HOME"/.zshrc
