#!/usr/bin/env bash

DEFAULT_COLORIZE=true
DEFAULT_PANE_SIZE=55
DEFAULT_SPLIT_DIRECTION="vertical"
DEFAULT_SHOW_COPY_MODE_HELP=true

# Function accepts 2 arguments
# param 1: the variable to fetch
# param 2: the default value if not exists
getTmuxOption () {
  local option=`tmux show-option -gqv "$1"`
  option=${option:-$2}
  echo "$option"
}

COLORIZE=$(getTmuxOption "@greppage-colorize" $DEFAULT_COLORIZE)
if [ "$COLORIZE" == true ] ; then
  COLORIZE="-c"
else
  COLORIZE=""
fi

PANE_SIZE=$(getTmuxOption "@greppage-pane-size" $DEFAULT_PANE_SIZE)

SPLIT_DIRECTION=$(getTmuxOption "@greppage-split-direction" $DEFAULT_SPLIT_DIRECTION)
if [ "$SPLIT_DIRECTION" == "horizontal" ] ; then
  SPLIT_DIRECTION="-v"
else
  SPLIT_DIRECTION="-h"
fi

COPY_MODE_HELP=$(getTmuxOption "@greppage-show-copy-mode-help" $DEFAULT_SHOW_COPY_MODE_HELP)
if [ "$COPY_MODE_HELP" == true ] ; then
  COPY_MODE_HELP="Shortcuts \=\>  Copy Mode:\"<Prefix>+[\", Select:V, Yank:y, Paste:\"<Prefix>+]\""
else
  COPY_MODE_HELP=""
fi
tmux command-prompt -p search_topic "split-window ${SPLIT_DIRECTION} -l ${PANE_SIZE} 'grepg ${COLORIZE} -t %1 ; echo ${COPY_MODE_HELP} ; read'"

