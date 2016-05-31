tmux-greppage
===

tmux-greppage is a TMUX plugin for querying your [ GrepPage ](https://www.greppage.com) cheatsheets. It acts as a simple wrapper around [grepg](https://github.com/evidanary/grepg) commandline client.

![tmux-greppage](http://i.imgur.com/C1XInnc.gif)

# Usage
`Prefix + g` will prompt you to enter a search string. After entering the string, a new vertical split will be created with relevant search results from your cheatsheet.

Search string needs to have title of the cheatsheet (partial strings are allowed) optionally followed by `-s token_to_search`. For example, to search how to bold text in markdown (assuming you have a cheatsheet with name `Markdown`) type `mark -s bold`.

To copy/paste the cheat enter TMUX copy mode (defaults to `Prefix + [` and paste `Prefix + ]`)

# Requirements
 - bash
 - [grepg](https://github.com/evidanary/grepg) 0.0.4+
 - tmux 2.1+

# Installation and Update

## Using [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)

Add the following to your list of TPM plugins in `.tmux.conf`:

```
set -g @plugin 'evidanary/tmux-greppage'
```

Hit `Prefix + I` to fetch and source the plugin. You should now be able to use the plugin!

**NOTE**: To update your plugin hit `Prefix + U`. This project is expected to go through heavy changes, so periodic updates may be necessary.

# Configuration
You can set the following options in the ~/.tmux.conf file to customize.

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

# Vi Style Key Bindings
If you prefer to user Vim-style key bindings in Tmux copy mode, add this:

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

# Troubleshooting
*Tmux doesn't copy to my OSX system clipboard. What do I do?*
For accessing OSX's clipboard from tmux run `brew install reattach-to-user-namespace` and add the following lines in your `.tmux.conf`

```
set-option -g default-command "reattach-to-user-namespace -l zsh"
```

