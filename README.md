# Dotfiles

When jumping between multiple machines (real and virtual) it is nice to make them more homely.
This repo contains some of my dotfiles and a few scripts to set the lot up on a new machine.

I'm not a Vim Wizard or a tmux Ninja but these seem to work for me. These will almost certainly
change over time as I learn more and the collection of dotfiles will grow as an when I have time
to audit/tidy up more of the things that make my machine feel like home.

I'd advise against stealing someone else's dotfiles because that's what I did for the first few
years of my Linux journey and it resulted in a lack of understanding of the tools that I was using.
However, if you really want to use these, clone the repo somewhere and then run the `setup_machine.sh`
script. This will `apt-get install` the following:

- [curl](https://curl.haxx.se/)
- [vim](http://www.vim.org/)
- [tmux](https://github.com/tmux/tmux/wiki)
- [git](https://git-scm.com/)

It will then create symlinks for the dotfiles in your home directory. If I update the dotfiles and you
want the changes, do a `git pull` and you should be good to go. If I've added any new dotfiles, run the
`setup_machine.sh` script again after pulling the changes.

That's all folks!
