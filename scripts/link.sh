#!/bin/bash
echo "this script links the config files of below packages to the HOME folder"
printf "i3, all bash files\n"

sudo pacman -Sy --needed i3 rofi dmenu

#symlinking i3
[ -d ~/.config/i3 ] && ln -sf ~/.dotfiles/.config/i3/config ~/.config/i3/config && i3-msg reload


#linking the .bash files in home directory
bashfilelist=$(ls -a $HOME/.dotfiles/ | grep ^.bash*)
for i in $bashfilelist; do
	echo "linking $i to $HOME directory"
	ln -sf $HOME/.dotfiles/$i $HOME/$i
done
source ~/.bashrc
echo "exec i3" $HOME/.xinitrc
