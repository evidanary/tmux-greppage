#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DEFAULT_GREPPAGE_KEY="g"
GREPPAGE_KEY=$(tmux show-option -gqv @greppage-key)
GREPPAGE_KEY=${GREPPAGE_KEY:-$DEFAULT_GREPPAGE_KEY}
tmux bind-key $GREPPAGE_KEY run-shell "$CURRENT_DIR/scripts/tmux-greppage.sh"
