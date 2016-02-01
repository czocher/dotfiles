#!/bin/bash

echo "Removing old configs"
rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.bashrc
rm -rf ~/.gitconfig

echo "Installing new config"
ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/.vim ~/.vim
ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.bash ~/.bash
ln -s $PWD/.gitconfig ~/.gitconfig

echo "Finished"
