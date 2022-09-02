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

set __preferred_editors emacs mg vim
for editor in $__preferred_editors
    if type -q $editor
        set -gx EDITOR (type -p $editor)
        break
    end
end

set -gx DOTFILES $HOME/src/misc/dotfiles

set -gx LDFLAGS "-L/usr/local/opt/openssl/lib"
set -gx CPPFLAGS "-I/usr/local/opt/openssl/include"

fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/go/bin"
fish_add_path "$HOME/.local/bin"
fish_add_path "$DOTFILES/bin"
fish_add_path "/usr/local/sbin"
fish_add_path "$HOME/.local/bin" # Used by poetry

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/simon/Library/Developer/google-cloud-sdk/path.fish.inc' ]; . '/Users/simon/Library/Developer/google-cloud-sdk/path.fish.inc'; end

if type -q pyenv
    set -gx PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
    pyenv init - | source
end

if type -q op
    op completion fish | source
end
