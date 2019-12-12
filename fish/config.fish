eval (/usr/bin/python -m virtualfish ^ /dev/null)

# cd to project directory on activating a virtualenv
function switch_to_virtualenv_directory --on-event virtualenv_did_activate
    if test -f "$VIRTUAL_ENV/.project"
        cd (cat "$VIRTUAL_ENV/.project")
    end
end

function __sw_add_to_path
    if test -d $argv
        set -g fish_user_paths $argv $fish_user_paths
    end
end

set -gx EDITOR (type -p emacs)
set -gx DOTFILES $HOME/src/misc/dotfiles
set -gx GOPATH $HOME/src/go

set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"

# See `go help module-private`
set -gx GOPRIVATE "github.com/Synthace"

set local_config ~/.config/fish/config.local.fish
if test -f $local_config
    . $local_config
end


__sw_add_to_path "$GOPATH/bin"
__sw_add_to_path "$HOME/.cargo/bin"
__sw_add_to_path "$HOME/src/3p/arcanist/bin"
__sw_add_to_path "$HOME/Library/Python/3.7/bin"
__sw_add_to_path "/usr/local/sbin"
__sw_add_to_path "$DOTFILES/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/simon/Library/Developer/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/simon/Library/Developer/google-cloud-sdk/path.fish.inc'; else; . '/Users/simon/Library/Developer/google-cloud-sdk/path.fish.inc'; end; end
