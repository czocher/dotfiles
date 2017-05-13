#!/bin/bash

echo "Removing old configs"
rm -rf ~/.bashrc
rm -rf ~/.zshrc
rm -rf ~/.gitconfig
rm -rf ~/.config/nvim
rm -rf ~/.gnupg/gpg.conf ~/.gnupg/gpg-agent.conf
rm -rf ~/.vimrc
rm -rf ~/.vim

echo "Installing new config"
ln -s $PWD/.bashrc ~/.bashrc
ln -s $PWD/.zshrc ~/.zshrc
ln -s $PWD/.bash ~/.bash
mkdir -p ~/.gnupg
ln -s $PWD/.gnupg/gpg.conf ~/.gnupg/gpg.conf
ln -s $PWD/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

curl https://keybase.io/czocher/pgp_keys.asc | gpg --import

ln -s $PWD/.gitconfig ~/.gitconfig
ln -s $PWD/.gitmessage ~/.gitmessage
ln -s $PWD/nvim ~/.config/nvim
ln -s $PWD/nvim ~/.vimrc
ln -s $PWD/nvim/init.vim ~/.vimrc
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh && cd .. && rm -rf fonts/

echo "Configure the terminal to use powerline fonts"

# Set ownership to your own user and primary group
chown -R "$USER:$(id -gn)" ~/.gnupg
# Set permissions to read, write, execute for only yourself, no others
chmod 700 ~/.gnupg
# Set permissions to read, write for only yourself, no others
chmod 600 ~/.gnupg/*

git config --global commit.template ~/.gitmessage

echo "Provide the user email for git: "
read email
git config --global user.email "$email"

echo "Finished"
