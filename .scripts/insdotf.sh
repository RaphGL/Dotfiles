#!/bin/env bash
# Setting up Vim-plug for Neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Installing screenlocker
git clone https://github.com/pavanjadhaw/betterlockscreen
cd betterlockscreen
mv betterlockscreen $HOME/.local/bin/
cd .. & rm -r betterlockscreen/

# Setting up "Oh my Zsh!"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
mkdir -p .zsh-plugins
mv -t $HOME/.zsh-plugins zsh-syntax-highlighting .oh-my-zsh
source $HOME/.zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#Symlinking dotfiles
rm -f .bash_profile .bashrc .vimrc .Xresources .zshrc .zshenv \
	.config/nvim/init.vim .config/picom.conf .config/qtile/config.py .config/rofi/config.rasi .config/mimeapps.list
cd $HOME/dotfiles/
mkdir .temp
mv README.md .temp && mv *.png .temp/
cd .temp/
mv * ..
cd ..
rmdir .temp/
cd $HOME/dotfiles && stow --adopt *

chsh -s $(which zsh)
