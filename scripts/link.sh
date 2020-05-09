#!/bin/bash

#symlinking i3
[ -d ~/.config/i3 ] && ln -sf ~/.dotfiles/.config/i3/config ~/.config/i3/config && i3-msg reload


#linking the .bash files in home directory
bashfilelist=$(ls -a $HOME/.dotfiles/ | grep ^.bash*)
for i in $bashfilelist; do
	echo "linking $i to $HOME directory"
	mv $HOME/$i $HOME/.dotfiles/$i
	ln -sf $HOME/.dotfiles/$i $HOME/$i
done

