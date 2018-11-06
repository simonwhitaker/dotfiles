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

set -gx GOPATH $HOME/src/go
if test -d $GOPATH/bin
   set PATH $GOPATH/bin $PATH
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/simon/Library/Developer/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/simon/Library/Developer/google-cloud-sdk/path.fish.inc'; else; . '/Users/simon/Library/Developer/google-cloud-sdk/path.fish.inc'; end; end
