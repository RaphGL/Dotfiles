#!/bin/env bash
pacman --needed -S \
	adobe-source-han-sans-jp-fonts adobe-source-code-pro-fonts obs-studio thunderbird cmus cmake gimp w3m libnotify dunst \
	gnome-font-viewer lxappearance code telegram-desktop nemo neofetch neovim npm python-pip rofi feh sxhkd mpv tldr \
	xorg-xrandr xorg-xdpyinfo fcitx fcitx-im fcitx-mozc sxiv ranger pass xclip gscan2pdf youtube-dl picom kdenlive \
	zsh flameshot qtile yay surf xdotool stow kitty zathura zathura-pdf-mupdf curl git calcurse anki imagemagick \

./~/dotfiles/.scripts/vscode_extin.sh
pip install pynvim
npm install -g neovim
