#!/bin/bash
# ──────────────────────────────────────────────────────────────────────────── #
# link_install.sh
# This program links the config files from .dotfiles directory to the
# relevant folder in the HOME directory
# ──────────────────────────────────────────────────────────────────────────── #

printf "\nThis script links the config files to the HOME folder\n"

# ──────────────────────── cloning the .dotfiles repo ──────────────────────── #
[ -d $HOME/.dotfiles ] && \
	printf "\n.dotfiles directory already exists. Skipping...\n \n" || \
	printf "\n[+] Cloning the .dotfiles repo\n" \
	git clone https://github.com/wayanlw/.dotfiles

# ────────────── Linking the files in the ~/.dotfiles directory ────────────── #

function link_file{
	# creates parent directories if they don't exist
	mkdir -p "${1%/*}"
	# if the file exists in the .dotfiles link it to the correct file in HOME directory
	ln -sf "$HOME/.dotfiles/$1" "$HOME/$1" && echo "- $1 is linked" || echo "Error: Couldnt link $1"
}

echo "[+] Linking dot files -------------"
link_file .Xmodmap
link_file .bash_aliases
link_file .config/alacritty/alacritty.yml
link_file .config/autokey/data/capsy
link_file .config/herbstluftwm/autostart
link_file .config/herbstluftwm/panel.sh
link_file .config/i3/config
link_file .config/i3status/config
link_file .config/kitty/kitty.conf
link_file .config/openbox/rc.xml
link_file .config/picom/picom.conf
link_file .config/rtv/rtv.conf
link_file .config/sxhkd/sxhkdrc
link_file .config/tint2/tint2rc
link_file .newsboat/config
link_file .newsboat/urls
link_file .tmux.conf
link_file .vimrc
link_file .vimrc
link_file .zshrc

# ────────────────────────── Linking Fonts directory ───────────────────────── #
printf "\n\n[+] Linking the .fonts directory -------------\n"
link_file .fonts
fc-cache -f -v




####################################################################################################


# ───────────────────────────────── OBSOLETE ───────────────────────────────── #
# OBSOLETE : linking the .bash files in home directory
# bashfilelist=$(ls -a $HOME/.dotfiles/ | grep ^.bash*)
# for i in $bashfilelist; do
# 	echo "linking $i to $HOME directory"
# 	ln -sf $HOME/.dotfiles/$i $HOME/$i
# done

#================================= OBSOLETE ================================
# OBSOLETE : Linking other config files
# [[ -f $HOME/.dotfiles/.vimrc ]] && ln -sf $HOME/.dotfiles/.vimrc $HOME/.vimrc && echo "####### .vimrc linked" || echo ".vimrc not available in ~/.dotfiles"
# [[ -f $HOME/.dotfiles/.Xmodmap ]] && ln -sf $HOME/.dotfiles/.Xmodmap $HOME/.Xmodmap && echo "####### .Xmodmap linked" || echo ".Xmodmap not available in ~/.dotfiles"
# [[ -f $HOME/.dotfiles/.Xmodmap ]] && ln -sf $HOME/.dotfiles/.Xmodmap $HOME/.Xmodmap && echo "####### .Xmodmap linked" || echo ".Xmodmap not available in ~/.dotfiles"

