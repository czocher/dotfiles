#!/bin/bash

dnf install yubikey-personalization-gui gimp libreoffice git yakuake vim vim-X11 meld xclip python3-ipython python-ipython python-devel python3-devel cmake gcc gcc-c++ python-trollius python3-trollius kdiff3 zsh util-linux-user

dnf -y install dnf-plugins-core
dnf -y copr enable dperson/neovim
dnf -y install neovim
dnf -y install python3-neovim python3-neovim-gui python-neovim python-neovim-gui
dnf -y install https://prerelease.keybase.io/keybase_amd64.rpm
run_keybase

curl https://sh.rustup.rs -sSf | sh
rustup component add rust-src

curl https://www.folkswithhats.org/installer | sudo bash

chsh -s /bin/zsh
