#!/bin/zsh
# Visual candy
feh --bg-fill ~/dotfiles/wallpapers/Pictures/Wallpapers/wallpaper4.jpg
picom -b
# Keyboard layout 
fcitx -d
# Screenshot program
flameshot &
# Switch Caps Lock and Escape keys
setxkbmap -option caps:swapescape
# Notification daemon
dunst &
# Hotkey daemon
sxhkd &
