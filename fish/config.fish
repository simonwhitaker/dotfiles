# cd to project directory on activating a virtualenv
function switch_to_virtualenv_directory --on-event virtualenv_did_activate
    if test -f "$VIRTUAL_ENV/.project"
        cd (cat "$VIRTUAL_ENV/.project")
    end
end

set -gx EDITOR (type -p emacs)
set -gx DOTFILES $HOME/src/misc/dotfiles

set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"

set local_config ~/.config/fish/config.local.fish
if test -f $local_config
    source $local_config
end

fish_add_path "$HOME/.cargo/bin"
fish_add_path "$DOTFILES/bin"
fish_add_path /usr/local/sbin
