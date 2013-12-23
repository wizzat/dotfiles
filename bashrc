#!/bin/bash
. /etc/profile
. ~/work/shell/cdots.sh
. ~/work/shell/checkpoints.sh

export RIMCMD='mvim'
export VIMSERVER='vim'
export PYENV_ROOT=/usr/local/opt/pyenv
export PATH=/usr/local/bin:$PATH
export PATH=~/work/shell:$PATH
export PATH=~/bin:$PATH
export PATH=/Users/markroberts/perl5/bin:$PATH

export PERL_LOCAL_LIB_ROOT="/Users/markroberts/perl5:$PERL_LOCAL_LIB_ROOT";
export PERL_MB_OPT="--install_base "/Users/markroberts/perl5"";
export PERL_MM_OPT="INSTALL_BASE=/Users/markroberts/perl5";
export PERL5LIB="/Users/markroberts/perl5/lib/perl5:$PERL5LIB";

export GOVERSION="1.2"
export GOROOT=$(brew --prefix)/Cellar/go/$GOVERSION
export GOPATH=$(brew --prefix)/Cellar/go/$GOVERSION/bin

alias s3ls='s3cmd ls'
alias ls='ls -G'
alias ll='ls -Glah'
alias rm='rm -i'
alias vim="mvim --servername $VIMSERVER --remote"
export PS1="\\W \$ "

alias rdiff="rrun git diff --color | less -R"
alias rst="rrun git status --color"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
fortune
