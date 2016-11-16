#!/bin/bash

echo "Removing old configs"
rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.bashrc
rm -rf ~/.gitconfig
rm -rf ~/.gnupg/gpg.conf ~/.gnupg/gpg-agent.conf

echo "Installing new config"
ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/.vim ~/.vim
mkdir ~/.vim/undo/
ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.bash ~/.bash
ln -s $PWD/.gnupg/gpg.conf ~/.gnupg/gpg.conf
ln -s $PWD/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.gitmessage ~/.gitmessage

# Set ownership to your own user and primary group
chown -R "$USER:$(id -gn)" ~/.gnupg
# Set permissions to read, write, execute for only yourself, no others
chmod 700 ~/.gnupg
# Set permissions to read, write for only yourself, no others
chmod 600 ~/.gnupg/*

git config --global commit.template ~/.gitmessage

echo "Finished"

echo "Do you want to install rust? (y/n)"
read response

if [ response='y' ]
then
  curl https://sh.rustup.rs -sSf | sh
fi
