#!/bin/bash
set -uo pipefail

# https://snapcraft.io/docs/installing-snap-on-fedora
sudo dnf install snapd
sudo ln -s /var/lib/snapd/snap /snap

# spotify
sudo snap install spotify
# Visual Studio Code
sudo snap install code --classic