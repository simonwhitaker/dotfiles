set __brew_paths /opt/homebrew /home/linuxbrew/.linuxbrew
for path in $__brew_paths
    set brew "$path/bin/brew"
    if test -e $brew
        eval "$($brew shellenv fish)"
        return
    end
end
