#!/bin/zsh
nitrogen --restore &
picom &
ibus-daemon -d
ibus restart
setxkbmap -option caps:swapescape
