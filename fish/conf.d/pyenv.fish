if type -q pyenv
    set -gx PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
    pyenv init - | source

    if type -q pyenv-virtualenv
          pyenv virtualenv-init - | source
    end
end
