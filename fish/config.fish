eval (python -m virtualfish)

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
