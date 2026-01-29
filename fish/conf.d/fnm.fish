if type -q fnm
  fnm env \
    --use-on-cd \
    --version-file-strategy=recursive \
    --shell=fish \
    | source
end
