#!/usr/bin/env bash

sessions=$(tmux list-sessions -F "#{session_name}" 2>/dev/null)

if [[ -z "$sessions" ]]; then
    echo "No active tmux sessions found."
    exit 1
fi

selected=$(echo "$sessions" | fzf --prompt="Switch to tmux session: ")

[[ -z "$selected" ]] && exit 0

tmux switch-client -t "$selected"
