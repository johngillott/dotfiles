#!/bin/bash

if [ -x .bash_aliases ]; then
    # shellcheck disable=SC1090
    . ~/.bash_aliases
fi

export EDITOR=vim

# init Go environment
export GOPATH=$HOME/johngillott/Go
export PATH=$GOPATH/bin:$PATH
mkdir -p "$GOPATH"
