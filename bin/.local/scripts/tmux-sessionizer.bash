#!/usr/bin/env bash

# My code below
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(fd . ~ ~/workspace ~/Documents ~/Downloads ~/Desktop --exact-depth 1 --color never --type d | fzf) 
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

if [[ -z $selected ]]; then
        exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

# [[true]] is exit status 0 , TMUX is set when inside tmux session.
if [[ -z $TMUX ]] || [[ -z $tmux_running ]]; then           #Changed && to || to allow using script when tmux is running but 
        tmux new-session -s $selected_name -c $selected     #not currently in session.
            exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
        tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
