#!/bin/bash
# clipmenud &
parcellite &
pkill tint2; sleep 1;tint2 &
sxhkd -c ~/.config/sxhkd/sxhkdrc &
dunst &
picom &
alttab -d 1 &
nm-applet &
pkill volumeicon; sleep 1; volumeicon &
feh --bg-scale --randomize ~/Pictures/wallpapers/*

# ─────────────────────────── Linux Capsy ─────────────────────────── #
#setxkbmap
#[[ -f $HOME/.Xmodmap ]] && xmodmap $HOME/.Xmodmap
autokey-gtk &

# lxsession & || gnome-polkit &
lxpolkit &

# when there is no desktop environment this enables a polkit

# dex is a autorun runner and craetor
# dex -ae i3

#sleep 5
## Setup onedrive sync with rclone tool
#if [ -d ~/Onedrive ]
#then
#	sh -c "rclone --vfs-cache-mode writes mount onedrive:Notes ~/Onedrive"
#fi


notify-send "autostart.sh completed"
