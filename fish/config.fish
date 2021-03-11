# This config is used across all my machines, synced via my dotfiles git repo.
#
# To add config for the local machine only, add a file to ~/.config/fish/conf.d,
# e.g. ~/.config/fish/conf.d/local.fish

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

fish_add_path "$HOME/.cargo/bin"
fish_add_path "$DOTFILES/bin"
fish_add_path /usr/local/sbin
