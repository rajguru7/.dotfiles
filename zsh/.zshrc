#run-help config for getting documentation on zsh builtins. Refer below link.
#https://stackoverflow.com/questions/4405382/how-can-i-read-documentation-about-built-in-zsh-commands
unalias run-help
autoload run-help

#Env config
#export PATH="/usr/local/opt/node@16/bin:$PATH"
export PATH="/usr/local/opt/echidna-test:$PATH"
export WK="/Users/saurabhrajguru/Downloads/workspace"

#Prompt config
autoload colors
colors
setopt PROMPT_SUBST
setopt promptsubst
#PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[green]%}%~%{$reset_color%} $ '
#PS1='%{$fg_bold[blue]%}${PWD/$HOME/~}%{$reset_color%} $ '
PS1='%{$fg_bold[blue]%}%~%{$reset_color%} $ '

# FZF config
export FZF_DEFAULT_COMMAND='fd -H --color=never'   # -H is for hidden files
export FZF_DEFAULT_OPTS='--no-height'

export FZF_CTRL_T_COMMAND='fd -H . /Users/saurabhrajguru/Documents /Users/saurabhrajguru/Downloads /Users/saurabhrajguru/Desktop --color=never'
export FZF_ALT_C_COMMAND='fd -H . $DOCS --type d --color=never'
export FZF_ALT_C_OPTS="--preview 'tree -CL 2 {}' --keep-right --preview-window right,30"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#alias
alias tt="tree -CL 2"
