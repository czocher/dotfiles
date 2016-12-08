#!/bin/bash

dnf install yubikey-personalization-gui gimp libreoffice git yakuake rust vim vim-X11 meld xclip python3-ipython python-ipython

dnf -y install dnf-plugins-core
dnf -y copr enable dperson/neovim
dnf -y install neovim
dnf -y install python3-neovim python3-neovim-gui python-neovim python-neovim-gui

bash -c 'su -c "curl http://folkswithhats.org/fedy-installer -o fedy-installer && chmod +x fedy-installer && ./fedy-installer"'
