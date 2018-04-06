#!/bin/bash

if [[ $(id -u) -eq 0 ]] ; then echo "Please run as non-root" ; exit 1 ; fi

echo "Removing old configs"
rm -rf ~/.bashrc
rm -rf ~/.zshrc
rm -rf ~/.gitconfig
rm -rf ~/.config/nvim
rm -rf ~/.gnupg/gpg.conf ~/.gnupg/gpg-agent.conf
rm -rf ~/.vimrc
rm -rf ~/.vim
rm -rf ~/.config/yakuakerc
rm -rf ~/.config/konsolerc

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
ln -s $PWD/other/yakuakerc ~/.config/yakuakerc
ln -s $PWD/other/konsolerc ~/.config/konsolerc
ln -s $PWD/other/czocher.profile ~/.local/share/konsole/czocher.profile
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Downloading powerline fonts"
git clone https://github.com/powerline/fonts.git && cd fonts && ./install.sh && cd .. && rm -rf fonts/
echo "Configure the terminal to use powerline fonts"

echo "Downloading FiraCode"
mkdir -p ~/.local/share/fonts
for type in Bold Light Medium Regular Retina; do
  wget -O ~/.local/share/fonts/FiraCode-${type}.ttf "https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true";
done
fc-cache -f

echo "Downloading git-aware-prompt"
git clone git://github.com/jimeh/git-aware-prompt.git .bash
ln -s $PWD/.bash ~/

echo "Downlading rust"
curl https://sh.rustup.rs -sSf | bash -s -- -y
rustup component add rust-src

echo "Configuring gpg"
# Set ownership to your own user and primary group
chown -R "$USER:$(id -gn)" ~/.gnupg
# Set permissions to read, write, execute for only yourself, no others
chmod 700 ~/.gnupg
# Set permissions to read, write for only yourself, no others
chmod 600 ~/.gnupg/*

echo "Configuring git"
git config --global commit.template ~/.gitmessage

echo "Provide the user email for git: "
read email
git config --global user.email "$email"

echo "Finished"
