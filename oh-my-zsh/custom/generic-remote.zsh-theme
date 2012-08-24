PROMPT=$'%{$fg_bold[red]%}%n@%m %{$fg[green]%}%1~%{$reset_color%}$(git_prompt_info) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" ("
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}) %{$fg_bold[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"

# Use standard directory listing colours
export LSCOLORS="exfxcxdxbxegedabagacad"

