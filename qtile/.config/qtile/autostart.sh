#!/usr/bin/env sh
# Eye candy
feh --bg-fill ~/dotfiles/wallpapers/Pictures/Wallpapers/wallpaper4.jpg
picom -b
# Keyboard layout 
fcitx -d
# Screenshot program
flameshot &
# Swap Caps Lock and Escape keys
setxkbmap -option caps:swapescape
# Notification daemon
dunst &
# Hotkey daemon
sxhkd &

# Custom scripts
sh -c ~/dotfiles/.scripts/cmus_daemon.sh &
