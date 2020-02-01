#!/bin/bash
cd $HOME
mkdir -p ~/.zsh-plugins
# Installing Vim-Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Installing "Oh-My-Zsh!" and Syntax Highlighting
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.zsh-plugins/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-plugins/zsh-syntax-highlighting

# Installing dotfiles
rm -rf .bashrc .vimrc .Xresources .zshenv .zshrc .config/rofi/config.rasi .config/mimeapps.list 
cd $HOME/dotfiles
mkdir -p .temp/
mv -t .temp *.png *.md
stow --adopt *
mv .temp/* $HOME/dotfiles/
rmdir .temp/

chsh -s $(which zsh)
