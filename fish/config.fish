# This config is used across all my machines, synced via my dotfiles git repo.
#
# To add config for the local machine only, add a file to ~/.config/fish/conf.d,
# e.g. ~/.config/fish/conf.d/local.fish

# cd to project directory on activating a virtualenv
function __switch_to_virtualenv_directory --on-event virtualenv_did_activate
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

set dotfiles_fishdir (dirname (realpath (status filename)))
set dotfiles (git -C "$dotfiles_fishdir" rev-parse --show-toplevel)
fish_add_path "$dotfiles/bin"

fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/go/bin"
fish_add_path "$HOME/.local/bin" # Used by poetry
fish_add_path "$HOME/.rye/shims"
fish_add_path "/opt/homebrew/bin"

if type -q pyenv
    set -gx PYENV_ROOT $HOME/.pyenv
    fish_add_path $PYENV_ROOT/bin
    pyenv init - | source

    if type -q pyenv-virtualenv
          pyenv virtualenv-init - | source
    end
end

# https://github.com/sharkdp/bat#customization
set -gx BAT_THEME "Monokai Extended Bright"

# Stop https://www.nltk.org/ from creating a directory in $HOME.
set -gx NLTK_DATA "$HOME/Library/Caches/nltk_data"

abbr -a bi 'brew install'
abbr -a bic 'brew install --cask'
abbr -a bo 'brew outdated'
abbr -a bs 'brew search'
abbr -a bsc 'brew search --cask'
abbr -a bu 'brew update'
abbr -a buo 'brew update && brew outdated'
abbr -a bup 'brew upgrade'
abbr -a c code
abbr -a c. 'code .'
abbr -a cdr 'cd (git rev-parse --show-toplevel)'
abbr -a cr 'code (git rev-parse --show-toplevel)'
abbr -a dcd 'docker compose down'
abbr -a dcl 'docker compose logs -f'
abbr -a dcr 'docker compose restart'
abbr -a dcu 'docker compose up -d'
abbr -a demo 'if set -q SW_SIMPLE_PROMPT; set -e SW_SIMPLE_PROMPT; else; set SW_SIMPLE_PROMPT 1; end'
abbr -a gb 'git branch'
abbr -a gcan 'git commit --amend --no-edit'
abbr -a gcm 'git checkout main'
abbr -a gcmm 'git checkout master'
abbr -a gco 'git checkout'
abbr -a gd 'git diff'
abbr -a gdc 'git diff --cached'
abbr -a gf 'git fetch'
abbr -a gfom 'git fetch origin main:main'
abbr -a gfomm 'git fetch origin master:master'
abbr -a gl 'git pull'
abbr -a gla 'git log --graph --all'
abbr -a glb 'git log --graph --branches'
abbr -a gll 'git log --graph'
abbr -a gmm 'git merge --no-edit main'
abbr -a gmmm 'git merge --no-edit master'
abbr -a gp 'git push'
abbr -a gpf 'git push --force'
abbr -a gpp 'git push --set-upstream origin HEAD'
abbr -a gpt 'git push --tags'
abbr -a gr 'git restore'
abbr -a grc 'git rebase --continue'
abbr -a gri 'git rebase -i'
abbr -a grim 'git rebase -i main'
abbr -a grimm 'git rebase -i master'
abbr -a grm 'git rebase main'
abbr -a grmm 'git rebase master'
abbr -a grr 'git restore --staged'
abbr -a gst 'git status'
abbr -a k kubectl
abbr -a lg lazygit
abbr -a r runny
abbr -a tf terraform
abbr -a top 'top -o cpu'
abbr -a za 'zellij attach'
