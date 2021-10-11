#!/bin/bash
clipmenud &
dunst &
alttab -d 1 &
nm-applet &
pkill volumeicon; sleep 1; volumeicon &
feh --bg-scale --randomize ~/Pictures/wallpapers/*
sxhkd -c ~/.dotfiles/.config/sxhkd/sxhkdrc &
pkill tint2; sleep 1;tint2 &

#runs the Linux Capsy
setxkbmap
xmodmap ~/.Xmodmap
autokey-gtk &

# when there is no desktop environment this enables a polkit
lxpolkit &

# dex is a autorun runner and craetor
# dex -ae i3

notify-send "autostart.sh completed"
