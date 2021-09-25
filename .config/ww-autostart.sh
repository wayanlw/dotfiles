
clipmenud &
dunst &
lxpolkit &
alttab -d 1 &
nm-applet &
pkill volumeicon; sleep 1; volumeicon;
feh --bg-scale --randomize ~/Pictures/wallpapers/*
sxhkd -c ~/.dotfiles/.config/sxhkd/sxhkdrc &

#runs the Linux Capsy
setxkbmap
xmodmap ~/.Xmodmap
autokey-gtk &

# when there is no desktop environment this enables a polkit
lxpolkit &

# dex is a autorun runner and craetor
#dex -ae i3
