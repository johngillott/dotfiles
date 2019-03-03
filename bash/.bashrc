#!/bin/bash

if [ -x .bash_aliases ]; then
    # shellcheck disable=SC1090
    . ~/.bash_aliases
fi

GIT_PROMPT_ONLY_IN_REPO=1
if [ -x ~/.bash-git-prompt/gitprompt.sh ]; then
    # shellcheck disable=SC1090
    . ~/.bash-git-prompt/gitprompt.sh
fi

export EDITOR=vim

# init Go environment
export GOPATH=$HOME/johngillott/Go
export PATH=$GOPATH/bin:$PATH
mkdir -p "$GOPATH"
