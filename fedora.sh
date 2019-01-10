#!/bin/bash

if [[ $(id -u) -eq 0 ]] ; then echo "Please run as non-root" ; exit 1 ; fi

# Kill the whole script on CTRL+C
trap "exit" INT

sudo dnf install pam_ssh_agent_auth ncurses-compat-libs yubikey-personalization-gui gimp libreoffice git yakuake vim vim-X11 meld xclip python3-ipython python-ipython python-devel python3-devel cmake gcc gcc-c++ python-trollius python3-trollius kdiff3 zsh util-linux-user pinentry-qt java-1.8.0*

# https://unix.stackexchange.com/questions/37633/can-a-linux-user-change-their-password-without-knowing-the-current-password/60631#60631

echo "Installing pass"
sudo dnf -y install pass oathtool
git clone https://github.com/tadfisher/pass-otp
cd pass-otp
sudo make install
cd ..
rm -rf pass-otp

sudo dnf -y install dnf-plugins-core
sudo dnf -y copr enable carlwgeorge/ripgrep
sudo dnf -y install ripgrep
sudo dnf -y copr enable dperson/neovim
sudo dnf -y install neovim *-neovim
sudo dnf -y install https://prerelease.keybase.io/keybase_amd64.rpm
run_keybase

curl https://www.folkswithhats.org/installer | sudo bash
