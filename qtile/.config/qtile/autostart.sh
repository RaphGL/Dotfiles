#!/usr/bin/env sh
# Set wallpaper
feh --bg-fill ~/Pictures/Wallpapers/arch.png
# Compositor
picom -b --experimental-backends
# Swap Escape and Caps Lock
setxkbmap -option caps:swapescape
# Hotkey daemon
sxhkd &
# Screenshot program
flameshot &
# Notification daemon
dunst &
# Input bus
ibus-daemon -d -x
# Custom scripts
sh -c ~/dotfiles/.scripts/cmus_daemon.sh &
# Polkit
lxqt-policykit-agent &
# Bluetooth manager
blueman-applet &
# set ibus tray to blue color
gsettings set org.freedesktop.ibus.panel xkb-icon-rgba '#8be9fd' &
