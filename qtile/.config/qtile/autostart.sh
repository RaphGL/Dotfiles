#!/usr/bin/env sh
# Set wallpaper
feh --bg-fill ~/Pictures/Wallpapers/arch.png
# Compositor
picom -b --experimental-backends
# Swap Escape and Caps Lock
setxkbmap -option caps:swapescape
# Screenshot program
flameshot &
# Notification daemon
dunst &
# Hotkey daemon
sxhkd &
# Input bus
ibus-daemon -d -x
# Custom scripts
sh -c ~/dotfiles/.scripts/cmus_daemon.sh &
# Polkit
lxqt-policykit-agent &
