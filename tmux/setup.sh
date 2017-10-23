#!/bin/bash

# Find the location of the script on disk (which is also the repo location)
SCRIPTSRC="${BASH_SOURCE[0]}"
SCRIPTDIR="$(cd "$(dirname $SCRIPTSRC)" && pwd )"

# (re)create symlink from config file in here to dotfile in home dir
TMUXCONF="$HOME/.tmux.conf"
if [ ! -e $TMUXCONF ] && [ ! -h $TMUXCONF ]; then
    ln -s "$SCRIPTDIR/tmux.conf" $TMUXCONF
elif [ -h $TMUXCONF ]; then
    unlink $TMUXCONF
    ln -s "$SCRIPTDIR/tmux.conf" $TMUXCONF
fi
