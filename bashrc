#!/bin/bash
. /etc/profile
. ~/work/shell/cdots.sh
. ~/work/shell/checkpoints.sh

alias testdb='psql -U pyutil -d pyutil_testdb -h localhost'

# Detect the platform (similar to $OSTYPE)
OS="`uname`"
case $OS in
  'Linux')
    OS='Linux'
    alias rm='rm -i'
    export RIMCMD='vim'
    ;;
  'FreeBSD')
    OS='FreeBSD'
    alias ls='ls -G'
    ;;
  'WindowsNT')
    OS='Windows'
    ;;
  'Darwin') 
    OS='Mac'
    alias rm='rm -i'
    alias ls='ls -G'
    alias ll='ls -Glah'
    export PATH=/usr/local/bin:$PATH
    export RIMCMD='mvim'
    ;;
  *) ;;
esac

alias s3ls='s3cmd ls'

export PAGER='less -R'
export VIMSERVER='vim'
export PYENV_ROOT=~/.pyenv

export PATH=/usr/local/bin:$PATH
export PATH=~/work/shell:$PATH
export PATH=~/bin:$PATH
export PATH=~/.local/bin:$PATH
export NVIM_LISTEN_ADDRESS='/tmp/nvimsocket'

alias testdb='psql -U pyutil -d pyutil_testdb -h localhost'

alias s3ls='s3cmd ls'
alias ls='ls --color'
alias ll='ls -Glah'
alias rm='rm -i'
alias vim="vim --servername $VIMSERVER --remote"

export PS1="\\W \$ "
if [[ "x$DISPLAY" == "x" ]]; then
    export DISPLAY=:0
fi

if command -v pyenv 2>&1 > /dev/null; then eval "$(pyenv init -)"; fi
if command -v fortune 2>&1 > /dev/null; then fortune; fi
