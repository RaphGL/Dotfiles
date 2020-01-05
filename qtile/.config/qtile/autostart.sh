#!/bin/zsh
nitrogen --restore &
picom &
ibus-daemon -d
ibus restart
sudo protonvpn c NL-FREE#2 -p UDP &
setxkbmap -option caps:swapescape
