
# set -o vi

#Env config
#export PATH="/usr/local/opt/node@16/bin:$PATH"
if [[ $OSTYPE == "linux-gnu"* ]]; then
    export PATH="/home/killua/.local/scripts/:$PATH"
    source /usr/share/doc/fzf/examples/completion.zsh
    source /usr/share/doc/fzf/examples/key-bindings.zsh
elif [[ $OSTYPE == "darwin"* ]]; then
    export PATH="/Users/saurabhrajguru/.local/scripts/:/usr/local/opt/echidna-test:$PATH"
    # [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    source /usr/local/opt/fzf/shell/completion.zsh
    source /usr/local/opt/fzf/shell/key-bindings.zsh
    unalias run-help
    autoload run-help
fi

#autocomplete
autoload -U compinit && compinit

#Prompt config
autoload colors
colors
setopt PROMPT_SUBST
setopt promptsubst
#PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[green]%}%~%{$reset_color%} $ '
#PS1='%{$fg_bold[blue]%}${PWD/$HOME/~}%{$reset_color%} $ '
PS1='%{$fg_bold[blue]%}%~%{$reset_color%} $ '

# FZF config
export FZF_DEFAULT_COMMAND='fd -H --color=never'   # -H is for show hidden files
export FZF_DEFAULT_OPTS='--no-height'

export FZF_CTRL_T_COMMAND='fd -H --color=never'
export FZF_ALT_C_COMMAND='fd -H --type d --color=never'
export FZF_ALT_C_OPTS="--preview 'tree -CL 2 {}' --keep-right --preview-window right,30"


#alias
alias tt="tree -CL 2"
alias ts="tmux-sessionizer.bash"
