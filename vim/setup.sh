#!/bin/bash

# Find the location of the script on disk (which is also the repo location)
SCRIPTSRC="${BASH_SOURCE[0]}"
SCRIPTDIR="$(cd "$(dirname $SCRIPTSRC)" && pwd )"

# Install Colour profiles. Current favourite is Solarized dark
# https://github.com/altercation/vim-colors-solarized

VIMDIR="$HOME/.vim"
VIMCOLORS="$VIMDIR/colors"
COLORNAME='solarized.vim'

if [ ! -d $VIMCOLORS ]; then
    mkdir -p $VIMCOLORS
fi

if [ ! -e "$VIMCOLORS/$COLORNAME" ]; then
    curl 'https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim' > "$VIMCOLORS/$COLORNAME"
fi

# (re)create symlink from vimrc in here to dotfile in home dir
VIMRC="$HOME/.vimrc"
if [ ! -e $VIMRC ] && [ ! -h $VIMRC ]; then
    ln -s "$SCRIPTDIR/vimrc" $VIMRC
elif [ -h $VIMRC ]; then
    unlink $VIMRC
    ln -s "$SCRIPTDIR/vimrc" $VIMRC
fi
