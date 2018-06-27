eval (/usr/bin/python -m virtualfish ^ /dev/null)

# cd to project directory on activating a virtualenv
function switch_to_virtualenv_directory --on-event virtualenv_did_activate
    if test -f "$VIRTUAL_ENV/.project"
        cd (cat "$VIRTUAL_ENV/.project")
    end
end

set __sw_cargo_bin "$HOME/.cargo/bin"
if test -d $__sw_cargo_bin
   set PATH $__sw_cargo_bin $PATH
end

set -gx EDITOR (type -p emacs)

set -gx DOTFILES $HOME/src/misc/dotfiles

alias gb='git branch'
alias gcm='git checkout master'
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git pull'
alias gla='git log --graph --pretty=format:"%C(yellow)%h%Creset%C(cyan)%d%Creset %s %C(green)(%an, %cr)%Creset" --all'
alias gll='git log --graph --pretty=format:"%C(yellow)%h%Creset%C(cyan)%d%Creset %s %C(green)(%an, %cr)%Creset"'
alias gp='git push'
alias gst='git status'

# Relies on git-sl being installed and aliased to `git sl`
# https://bitbucket.org/facebook/hg-experimental/src/f20ef49301c4436a0f7a4d11de65697a5f8e5ab4/contrib/git-sl?at=default&fileviewer=file-view-default
alias gsl='git sl'