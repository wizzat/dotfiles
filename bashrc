#!/bin/bash
. /etc/profile
. ~/work/shell/cdots.sh
. ~/work/shell/checkpoints.sh

export PAGER='less -R'
export RIMCMD='mvim'
export VIMSERVER='vim'
export PYENV_ROOT=~/.pyenv

export PATH=/usr/local/bin:$PATH
export PATH=~/work/shell:$PATH
export PATH=~/bin:$PATH

alias testdb='psql -U pyutil -d pyutil_testdb -h localhost'

alias s3ls='s3cmd ls'
alias ls='ls -G'
alias ll='ls -Glah'
alias rm='rm -i'
alias vim="vim --servername $VIMSERVER --remote"

export PS1="\\W \$ "

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
fortune
