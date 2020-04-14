#!/usr/bin/env sh
# Eye candy
feh --bg-fill ~/dotfiles/wallpapers/Pictures/Wallpapers/wallpaper4.jpg
### Temporarily using picom-tryone-git ###
picom -b --experimental-backends
# Keyboard layout 
fcitx -d
# Screenshot program
flameshot &
# Notification daemon
dunst &
# Hotkey daemon
sxhkd &
# Custom scripts
sh -c ~/dotfiles/.scripts/cmus_daemon.sh &
