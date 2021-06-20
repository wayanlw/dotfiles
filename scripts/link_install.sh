#!/bin/bash
#This first installs i3 and link the i3 config to the relevant file
#Then link all bashrc files to the home directory. Then restart bash
#Link the Xresources file. Creates i3 entry in .xinitrc



echo "this script links the config files of below packages to the HOME folder"
printf "i3, all bash files\n"


#installs main programs
sudo pacman -Sy --needed - < ~/.dotfiles/scripts/lwwappslist.txt


#symlinking i3
[ -d ~/.config/i3 ] && ln -sf ~/.dotfiles/.config/i3/config ~/.config/i3/config && i3-msg reload

#linking tint2
[ -d ~/.config/tint2 ] && ln -sf ~/.dotfiles/.config/tint2/tint2rc ~/.config/tint2/tint2rc

#linking the .bash files in home directory
bashfilelist=$(ls -a $HOME/.dotfiles/ | grep ^.bash*)
for i in $bashfilelist; do
	echo "linking $i to $HOME directory"
	ln -sf $HOME/.dotfiles/$i $HOME/$i
done


#linking other dotfiles
echo "Linking dot files"
[[ -f $HOME/.dotfiles/.Xresources ]] && ln -sf $HOME/.dotfiles/.Xresources $HOME/.Xresources && echo "####### .Xresources linked" || echo ".Xresources not available in ~/.dotfiles"
[[ -f $HOME/.dotfiles/.vimrc ]] && ln -sf $HOME/.dotfiles/.vimrc $HOME/.vimrc && echo "####### .vimrc linked" || echo ".vimrc not available in ~/.dotfiles"
[[ -f $HOME/.dotfiles/.Xmodmap ]] && ln -sf $HOME/.dotfiles/.Xmodmap $HOME/.Xmodmap && echo "####### .Xmodmap linked" || echo ".Xmodmap not available in ~/.dotfiles"


echo "Linking the .fonts directory"
ln -sf $HOME/.dotfiles/.fonts $HOME/.fonts
fc-cache -f -v


#sourcing bashrc
source ~/.bashrc

#adding i3 to xinitrc
echo "exec i3" >> $HOME/.xinitrc

