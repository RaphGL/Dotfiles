#!/bin/bash
cd $HOME
RED='\033[0;31m'
BLUE='\033[0;31m'
NC='\033[0m' # No Color

# Installing Vim-Plug
echo -e "${BLUE}Installing Vim-Plug...${NC}"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Installing "Oh-My-Zsh!" and Syntax Highlighting
echo -e "${BLUE}Setting up Zsh...${NC}"
mkdir -p ~/.zsh-plugins
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.zsh-plugins/.oh-my-zsh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-plugins/zsh-syntax-highlighting

# Installing dotfiles
echo -ne "${BLUE} Setting up dotfiles...${NC}"
if [ ${1:-"first_time"} ]
then 
	rm -rf .bashrc .vimrc .Xresources .zshenv .zshrc .config/rofi/config.rasi .config/mimeapps.list .config/nvim/init.vim
fi
cd $HOME/dotfiles
mkdir -p .temp/
mv -t .temp *.png *.md
stow --adopt *
mv .temp/* $HOME/dotfiles/
rmdir .temp/
feh --bg-fill ${HOME}/dotfiles/wallpapers/Pictures/Wallpapers/wallpaper2.jpg
echo -e "${BLUE}done${NC}"

# Changing default shell
chsh -s $(which zsh)
