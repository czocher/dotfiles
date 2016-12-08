#!/bin/bash

echo "Removing old configs"
rm -rf ~/.bashrc
rm -rf ~/.gitconfig
rm -rf ~/.config/nvim
rm -rf ~/.gnupg/gpg.conf ~/.gnupg/gpg-agent.conf

echo "Installing new config"
ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.bash ~/.bash
mkdir -p ~/.gnupg
ln -s $PWD/.gnupg/gpg.conf ~/.gnupg/gpg.conf
ln -s $PWD/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.gitmessage ~/.gitmessage
ln -s $PWD/nvim ~/.config/nvim
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Set ownership to your own user and primary group
chown -R "$USER:$(id -gn)" ~/.gnupg
# Set permissions to read, write, execute for only yourself, no others
chmod 700 ~/.gnupg
# Set permissions to read, write for only yourself, no others
chmod 600 ~/.gnupg/*

git config --global commit.template ~/.gitmessage

echo "Finished"
