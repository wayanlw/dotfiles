#!/bin/bash

# parcellite &
xbindkeys &
sxhkd -c ~/.config/sxhkd/sxhkdrc &
# ─────────────────────────── Linux Capsy ─────────────────────────── #
#setxkbmap
# [[ -f $HOME/.Xmodmap ]] && xmodmap $HOME/.Xmodmap
# autokey-gtk &

# dex is a autorun runner and craetor
# dex -ae i3

#sleep 5
## Setup onedrive sync with rclone tool
#if [ -d ~/Onedrive ]
#then
#	sh -c "rclone --vfs-cache-mode writes mount onedrive:Notes ~/Onedrive"
#fi

notify-send "autostart.sh completed"
