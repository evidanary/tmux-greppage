tmux-greppage
===

The tmux plugin for summoning grepg

Troubleshooting
--
Make sure you can copy in TMUX.
For OSX users `brew install reattach-to-user-namespace` and add the following lines in your `.tmux.conf`

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

