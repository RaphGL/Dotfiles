#!/bin/zsh
# Visual candy
nitrogen --restore &
picom -b &
# Keyboard layout 
ibus-daemon -d
ibus restart
# Screenshot program
flameshot &
# Switch Caps Lock and Escape keys
setxkbmap -option caps:swapescape
