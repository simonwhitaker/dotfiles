
# Enable zmv for pattern-based renaming. Run zmv without args for docs
autoload -U zmv
# alias for zmv for no quotes
# mmv *.c.orig orig/*.c
alias mmv='noglob zmv -W'

# Add some useful aliases
alias ll='ls -l'
alias ls='ls -G' # enable colorized output
alias history='fc -l 1'
alias httphere='python -m SimpleHTTPServer'
