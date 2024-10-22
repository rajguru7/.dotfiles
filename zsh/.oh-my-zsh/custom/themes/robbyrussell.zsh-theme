PROMPT="%{$FG[069]%}%~%{$reset_color%} "'$(git_prompt_info)'"%(?:%{$fg_bold[green]%}$:%{$fg_bold[red]%}$) "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[069]%}[%{$FG[248]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[069]%}]%{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[069]%}]"
