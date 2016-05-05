#!/bin/bash

echo "Removing old configs"
rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.bashrc
rm -rf ~/.gitconfig

echo "Installing new config"
ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/.vim ~/.vim
mkdir ~/.vim/undo/
ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.bash ~/.bash
ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.gitmessage ~/.gitmessage

git config --global commit.template ~/.gitmessage

echo "Finished"

echo "Do you want to install rust? (y/n)"
read response

if [ response='y' ]
then
  curl https://sh.rustup.rs -sSf | sh
fi
