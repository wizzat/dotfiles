#!/bin/bash
echo ". ~/work/dotfiles/bashrc" >> ~/.bashrc
function replace {
    if [ ! -e $2 ]; then
        ln -s $1 $2
    fi
}

(cd ~/work && git clone https://github.com/wizzat/shell.git)

replace ~/work/dotfiles/gitignore_global ~/.gitignore_global
replace ~/work/dotfiles/gitconfig ~/.gitconfig
replace ~/work/dotfiles/ackrc ~/.ackrc
replace ~/work/dotfiles/psqlrc ~/.psqlrc
replace ~/work/dotfiles/config ~/.config
replace ~/work/dotfiles/screenrc ~/.screenrc
replace ~/work/dotfiles/vimrc ~/.vimrc

mkdir -p ~/.config/nvim
replace ~/work/dotfiles/init.vim ~/.config/nvim/init.vim
replace ~/work/dotfiles/config/pep8 ~/.config/pep8

echo <<HERE
An ubuntu setup generally requires:
./fix_kb_repeat.sh
sudo apt install git screen tmux neovim python3-pip build-essential cmake python-dev python3-dev rustc cargo mono-xbuild
sudo pip3 install neovim-remote
HERE
