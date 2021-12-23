#!/bin/bash
set -uo pipefail


# Check for GNU stow and attempt to install if it doesn't exist
stow --version >/dev/null 2>&1
if [ $? -gt 0 ]; then
    if [[ "$OSTYPE" == "linux-gnu" ]]; then
        if dnf --version >/dev/null 2>&1; then
            # package manager for Red Hat distros i.e. Fedora
            echo "installing: stow via dnf"
            sudo dnf install stow
        elif apt >/dev/null 2>&1; then
            # package manager for other linux distros i.e. Ubuntu
            echo "installing: stow via apt"
            sudo apt update
            sudo apt install stow
        else
            >&2 echo "unable to determine linux distribution package manager"
            exit 4
        fi
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "installing: homebrew"
        mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
        echo "installing: stow"
        brew install stow
    else
        echo 'GNU Stow must be installed...'
        exit 127
    fi
fi

git submodule init
git submodule update

for f in */; do
    dir="${f/\//}"
    if [[ -x "./$dir/init.sh" ]]; then
        echo "Running script: $dir"
        "./$dir/init.sh"
    fi
    echo "Running stow: $dir"
    stow --ignore='^init.sh$' "$dir"
done;
