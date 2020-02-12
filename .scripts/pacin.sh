#!/bin/env bash
pacman --needed -S gnome-font-viewer lxappearance code telegram-desktop thunar neofetch neovim npm python-pip rofi \
	zsh flameshot qtile yay nitrogen surf stow rxvt-unicode zathura zathura-pdf-mupdf curl git calcurse anki imagemagick \
	xorg-xrandr xorg-xdpyinfo fcitx fcitx-im fcitx-mozc sxiv ranger pass xclip gscan2pdf youtube-dl picom kdenlive \
	adobe-source-han-sans-jp-fonts adobe-source-code-pro-fonts obs-studio thunderbird cmus cmake gimp w3m libnotify dunst \
	feh sxhkd

pip install pynvim
npm install -g neovim
