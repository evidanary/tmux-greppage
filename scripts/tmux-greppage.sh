#!/usr/bin/env bash

# Create a new split of size 20 % on the right of the screen

# send the grepg command and move focus to the split screen
tmux command-prompt -p search_string "split-window -h -p 20 'grepg -c evidanary %1 && read'"
#tmux send-keys -t 2 'grepg '
#tmux select-pane -t 2
