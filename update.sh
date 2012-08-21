#!/bin/sh
set -eu

[ -r $PWD/$0 ] &&
  dir=$(dirname $PWD/$0) ||
  dir=$(dirname $0)

link() { rm -rf $HOME/.$1; ln -s $dir/$1 $HOME/.$1; }
copy() { rm -rf $HOME/.$1; cp -p $dir/$1 $HOME/.$1; }

set -x
# ssh,gdb hate symlinks
cp $dir/ssh_config   $HOME/.ssh/config
chmod 644 $HOME/.ssh/config
copy gdbinit

# these guys are fine with symlinks
link xinitrc
link bashrc
link bash_profile
link screenrc
link emacs
link elisp
link eshell
link gitconfig
link vimrc
