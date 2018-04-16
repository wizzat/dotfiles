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

mkdir -p ~/.config/nvim/init.vim
replace ~/work/dotfiles/init.vim ~/.config/nvim/init.vim
