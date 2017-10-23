#!/bin/bash

# Global setup. Install tools and setup my preferred configurations.
# First, a bit of installing.

install () {
    if [ ! -z "$1" ]; then
        sudo apt-get install --assume-yes "$1"
        return $?
    fi
    return 0
}

TOOLS=( "curl" "vim" "tmux" "git" )
sudo apt-get update
for t in "${TOOLS[@]}"; do
    if ! install "$t" ; then
        echo "Failed to install $t. Bye!"
        return $?
    fi
    echo "Installed $t"
done

# Go through directories in the repository and run each of their
# setup scripts.

# Find the location of the script on disk (which is also the repo location)
SCRIPTSRC="${BASH_SOURCE[0]}"
SCRIPTDIR="$(cd "$(dirname $SCRIPTSRC)" && pwd )"

for f in "$SCRIPTDIR"/* ; do
    if [ -d $f ] && [ -e "$f/setup.sh" ]; then
        echo "Running setup script in '$f'"
        source "$f/setup.sh"
    fi
done
