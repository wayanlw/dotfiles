#!/bin/bash

#symlinking i3
[ -d ~/.config/i3 ] && ln -sf ~/.dotfiles/.config/i3/config ~/.config/i3/config && i3-msg reload


#linking the .bash files in home directory
bashfilelist=$(ls -a $HOME | grep ^.bash*)
echo $bashfilelist
for i in $bashfilelist; do
	mv $HOME/$i $HOME/.dotfiles/$i
	ln -sf $HOME/.dotfiles/$i $HOME/$i
done

