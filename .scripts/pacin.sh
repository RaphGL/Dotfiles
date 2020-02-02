#!/bin/env bash
pacman --needed -S gnome-font-viewer lxappearance code telegram-desktop thunar neofetch neovim npm python-pip rofi \
	zsh flameshot qtile yay nitrogen surf stow rxvt-unicode zathura zathura-pdf-mupdf curl git calcurse anki imagemagick feh \
	xorg-xrandr xorg-xdpyinfo fcitx fcitx-im fcitx-mozc sxiv ranger pass xclip gscan2pdf youtube-dl picom \
	adobe-source-han-sans-jp-fonts adobe-source-code-pro-fonts obs-studio thunderbird cmus

pip install pynvim
npm install -g neovim
