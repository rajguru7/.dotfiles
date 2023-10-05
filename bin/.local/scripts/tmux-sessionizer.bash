#!/usr/bin/env bash


if [[ $OSTYPE == "linux-gnu"* ]]; then
    FD=$'fdfind' #fd alias doesn't work in fzf config strings, hence used variable
elif [[ $OSTYPE == "darwin"* ]]; then
    FD=$'fd'
fi



# My code below
if [[ $# -eq 1 ]]; then
    selected=$1
else
    if [[ $OSTYPE == "linux-gnu"* ]]; then
        selected="$($FD . ~ ~/work ~/personal ~/finance ~/rough ~/notes/docs ~/learn -H --exact-depth 1 --color never --type d | fzf)" 
    elif [[ $OSTYPE == "darwin"* ]]; then
        selected="$($FD . ~ ~/work ~/personal ~/finance ~/Documents ~/rough ~/notes/docs ~/learn -H --exact-depth 1 --color never --type d | fzf)" 
    fi
fi

#selected_base=$(basename $selected | tr . _)
#
#if [[ $(tmux list-sessions | grep $selected_base -c) -eq 0 ]]; then
#    tmux new -ds $selected_base -c $selected
#fi
#
#tmux switch-client -t $selected_base

################################################################################
#Primeagen code below: https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/tmux-sessionizer
#Have edited it a bit as his script was not working properly.

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# [[true]] is exit status 0 , TMUX is set when inside tmux session.
if [[ -n $tmux_running ]]; then          
    if ! tmux has-session -t=$selected_name 2> /dev/null; then
        tmux new-session -ds $selected_name -c $selected
    fi
    if [[ -n $TMUX ]]; then
        tmux switch-client -t $selected_name
    else
        tmux attach-session -t $selected_name
    fi
else
    tmux new-session -s $selected_name -c $selected
fi
