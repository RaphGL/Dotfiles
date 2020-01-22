#!/bin/env bash
# Downloading Packages
pacman --needed -S gnome-font-viewer ibus ibus-anthy lxappearance code telegram-desktop thunar neofetch neovim npm python-pip rofi \
	zsh flameshot qtile yay nitrogen surf stow rxvt-unicode zathura zathura-pdf-mupdf curl git calcurse anki imagemagick feh xorg-xrandr xorg-xdpyinfo

# Setting up "Oh my Zsh!"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

#Symlinking dotfiles
rm -f .bash_profile .bashrc .Xresources .zshrc .zshenv 
cd $HOME/dotfiles/
mkdir .temp
mv README.md .temp && mv *.png .temp/
stow --adopt *
cd .temp/
mv * ..
cd ..
rmdir .temp/
cd $HOME

# Setting up Vim-plug for Vim and Neovim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Installing screenlocker
git clone https://github.com/pavanjadhaw/betterlockscreen
cd betterlockscreen
mv betterlockscreen $HOME/.local/bin/
cd .. & rm -r betterlockscreen/

env zsh | chsh
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
