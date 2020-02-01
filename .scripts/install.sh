#!/bin/bash
cd $HOME
RED='\033[0;31m'
BLUE='\034[0;31m'
NC='\033[0m' # No Color
mkdir -p ~/.zsh-plugins
# Installing Vim-Plug
echo -e "${BLUE}Installing Vim-Plug...${NC}"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Installing "Oh-My-Zsh!" and Syntax Highlighting
echo -e "${BLUE}Setting up Zsh...${NC}"
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.zsh-plugins/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-plugins/zsh-syntax-highlighting

# Installing dotfiles
echo -e "\033[0;34m Setting up dotfiles...${NC}"
rm -rf .bashrc .vimrc .Xresources .zshenv .zshrc .config/rofi/config.rasi .config/mimeapps.list 
cd $HOME/dotfiles
mkdir -p .temp/
mv -t .temp *.png *.md
stow --adopt *
mv .temp/* $HOME/dotfiles/
rmdir .temp/

echo -e "${RED}Warning: Check your .Xresources and change it to appropriate fonts${NC}"
chsh -s $(which zsh)
