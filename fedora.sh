#!/bin/bash

dnf install yubikey-personalization-gui gimp libreoffice git yakuake rust vim vim-X11 meld xclip python3-ipython python-ipython

yum -y install epel-release
curl -o /etc/yum.repos.d/dperson-neovim-epel-7.repo https://copr.fedorainfracloud.org/coprs/dperson/neovim/repo/epel-7/dperson-neovim-epel-7.repo
yum -y install neovim
dnf -y install python3-neovim python3-neovim-gui python-neovim python-neovim-gui

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

bash -c 'su -c "curl http://folkswithhats.org/fedy-installer -o fedy-installer && chmod +x fedy-installer && ./fedy-installer"'
