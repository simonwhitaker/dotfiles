eval (/usr/bin/python -m virtualfish ^ /dev/null)

# cd to project directory on activating a virtualenv
function switch_to_virtualenv_directory --on-event virtualenv_did_activate
    if test -f "$VIRTUAL_ENV/.project"
        cd (cat "$VIRTUAL_ENV/.project")
    end
end

function __sw_add_to_path
    if test -d $argv
        set PATH $argv $PATH
    end
end

set -gx EDITOR (type -p emacs)
set -gx DOTFILES $HOME/src/misc/dotfiles
set -gx GOPATH $HOME/src/go

set local_config ~/.config/fish/config.local.fish
if test -f $local_config
    . $local_config
end


__sw_add_to_path "$GOPATH/bin"
__sw_add_to_path "$HOME/.cargo/bin"
__sw_add_to_path "$HOME/src/3p/arcanist/bin"
__sw_add_to_path "$HOME/Library/Python/3.7/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/simon/Library/Developer/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/simon/Library/Developer/google-cloud-sdk/path.fish.inc'; else; . '/Users/simon/Library/Developer/google-cloud-sdk/path.fish.inc'; end; end
