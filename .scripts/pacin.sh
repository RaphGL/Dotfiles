#!/bin/env bash
pacman --needed -S \
	adobe-source-code-pro-fonts adobe-source-han-sans-jp-fonts alsa-utils anki \
	base-devel calcurse cmake cmus code curl dunst fcitx fcitx-im fcitx-mozc feh \
	adapta-gtk-theme firefox flameshot gimp git gnome-font-viewer gscan2pdf htop hub imagemagick \
	kdenlive alacritty libnotify libreoffice-still lxappearance mpv nemo neofetch neovim \
	npm simplescreenrecorder pamixer pass picom pulseaudio pulseaudio-alsa python-pip qtile ranger \
	rofi stow surf sxhkd sxiv telegram-desktop thunderbird tldr w3m xclip xdotool xorg-xdpyinfo \
	xorg-xrandr youtube-dl zathura zathura-pdf-mupdf zsh bspwm ttf-ubuntu-font-family
	
pip install pynvim msgpack-python jedi
npm install -g neovim
sh -c ~/dotfiles/.scripts/vscode_extin.sh
