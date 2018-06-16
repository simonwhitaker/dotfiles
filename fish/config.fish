eval (/usr/bin/python -m virtualfish)

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
