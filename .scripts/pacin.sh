#!/bin/env bash
pacman --needed -S \
	adobe-source-code-pro-fonts adobe-source-han-sans-jp-fonts alsa-utils \
	base-devel cmake curl dunst feh adapta-gtk-theme git libnotify npm \
	pamixer pulseaudio pulseaudio-alsa python-pip qtile stow sxhkd xclip \
	xdotool xorg-xdpyinfo xorg-xrandr bspwm ttf-ubuntu-font-family \
	anki calcurse cmus code firefox flameshot gimp gnome-font-viewer gscan2pdf htop hub imagemagick \
	kdenlive alacritty libreoffice-still lxappearance mpv nemo neofetch neovim simplescreenrecorder \
	pass picom ranger rofi surf sxiv telegram-desktop thunderbird tldr w3m youtube-dl zathura \
	zathura-pdf-mupdf zsh clang \
	fcitx fcitx-im fcitx-mozc \

pip install pynvim msgpack-python jedi
npm install -g neovim
sh -c ~/dotfiles/.scripts/vscode_extin.sh
