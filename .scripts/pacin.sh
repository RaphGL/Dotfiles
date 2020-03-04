#!/bin/env bash
pacman --needed -S \
	adobe-source-han-sans-jp-fonts adobe-source-code-pro-fonts obs-studio thunderbird cmus cmake gimp w3m libnotify dunst \
	gnome-font-viewer lxappearance code telegram-desktop nemo neofetch neovim npm python-pip rofi feh sxhkd mpv tldr hub \
	xorg-xrandr xorg-xdpyinfo fcitx fcitx-im fcitx-mozc sxiv ranger pass xclip gscan2pdf youtube-dl picom kdenlive libreoffice-still \
	zsh flameshot qtile surf xdotool stow kitty zathura zathura-pdf-mupdf curl git calcurse anki imagemagick pulseaudio pulseaudio-alsa
	alsa-utils pamixer \

pip install pynvim
npm install -g neovim
./~/dotfiles/.scripts/vscode_extin.sh
