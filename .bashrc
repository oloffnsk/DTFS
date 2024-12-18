#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='C:${PWD//\//\\\\}> '

echo -e "Microsoft Windows [Version 6.1.7600]\nCopyright (c) 2009 Microsoft Corporation.  All rights reserved.\n"


export PATH="$HOME/Scripts:$PATH"

export LANG=ja_JP.UTF-8

if [[ $(tty) == /dev/tty* ]]; then
    export LANGUAGE=en_US:en
    export LC_ALL=en_US.UTF-8
fi
