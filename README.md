tmux-greppage
===

tmux-greppage is a TMUX plugin for calling [grepg](https://github.com/evidanary/grepg) - the command line client for GrepPage. Make sure you have grepg installed and running before you install tmux-greppage.

Demo
---
Demo goes here

Options
---
You can set the following options in the ~/.tmux.conf file to customize tmux-greppage

```
# this will produce a colorized output (defaults to true)
set -g @greppage-colorize true

# minimum size of the greppage pane (defaults to 55)
set -g @greppage-pane-size 55

# direction of split for the greppage pane (defaults to vertical)
set -g @greppage-split-direction vertical

# show copy mode shortcuts after each run (defaults to true)
set -g @greppage-show-copy-mode-help true

# Key used to invoke tmux-grepg (defaults to Prefix + g)
set -g @greppage-key g
```

Vi Style Key Bindings
---
Use the settings below to enable vim keybindings in tmux copy mode.

```
# Use vim keybindings in copy mode
setw -g mode-keys vi

# Setup 'v' to begin selection as in Vim
bind-key -t vi-copy v begin-selection
bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

# Update default binding of `Enter` to also use copy-pipe
unbind -t vi-copy Enter
bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"
```

Troubleshooting
---
For accessing OSX's clipboard from tmux run `brew install reattach-to-user-namespace` and add the following lines in your `.tmux.conf`

```
set-option -g default-command "reattach-to-user-namespace -l zsh"
```

