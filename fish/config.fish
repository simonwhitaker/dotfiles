eval (python -m virtualfish)

set __sw_cargo_bin "$HOME/.cargo/bin"
if test -d $__sw_cargo_bin
   set PATH $__sw_cargo_bin $PATH
end
