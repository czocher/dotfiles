#!/bin/bash


rm -rf ~/.vim
rm -rf ~/.vimrc
rm -rf ~/.bashrc

ln -s $PWD/.vimrc ~/.vimrc
ln -s $PWD/.vim ~/.vim
ln -s $PWD/.bashrc ~/.bashrc
