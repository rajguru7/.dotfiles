# set -o vi

#Env config
#export PATH="/usr/local/opt/node@16/bin:$PATH"
#export PATH="/Users/saurabhrajguru/.local/scripts/:/usr/local/opt/echidna-test:$PATH"
export PATH="$HOME/.local/scripts/:$PATH"

if [[ $OSTYPE == "linux-gnu"* ]]; then
    alias fd=fdfind
    alias bat=batcat
    source /usr/share/doc/fzf/examples/completion.zsh
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    FD=$'fdfind' #environment variables work in the sourced fzf scripts
    BAT=$'batcat'
elif [[ $OSTYPE == "darwin"* ]]; then
    # [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
    source /usr/local/opt/fzf/shell/completion.zsh
    source /usr/local/opt/fzf/shell/key-bindings.zsh
    unalias run-help
    autoload run-help
    FD=$'fd'
    BAT=$'bat'
fi

# Taken from kali zshrc
#WORDCHARS=${WORDCHARS//\/} # Don't consider certain characters part of the word
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# kali syntax highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
ZSH_HIGHLIGHT_STYLES[default]=none
ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[path]=bold
ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[command-substitution]=none
ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[process-substitution]=none
ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[assign]=none
ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
ZSH_HIGHLIGHT_STYLES[named-fd]=none
ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout

# kali completion features
# removed 


#Prompt config
#autoload colors && colors
#setopt PROMPT_SUBST
#setopt promptsubst
#PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[green]%}%~%{$reset_color%} $ '
#PS1='%{$fg_bold[blue]%}${PWD/$HOME/~}%{$reset_color%} $ '
#PS1='%{$fg_bold[blue]%}%~%{$reset_color%} $ '

# FZF config
export FZF_DEFAULT_COMMAND="$FD -H"   # -H is for show hidden files
export FZF_DEFAULT_OPTS="--no-height --preview '$BAT -n --color=always {}'"

export FZF_CTRL_T_COMMAND="$FD -H"
export FZF_ALT_C_COMMAND="$FD -H --type d"
export FZF_ALT_C_OPTS="--preview 'tree -CL 2 {}' --keep-right --preview-window right,30"


#alias
alias ts="tmux-sessionizer.bash"
alias tt="tree -CL 2"
openv() {
    source openv.bash
}
if [[ -d "$HOME/.pyenv" ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

