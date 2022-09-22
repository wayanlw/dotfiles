#!/bin/bash
printf '\n\ninstalling yay  ===================================\n'
sudo pacman -S --needed --noconfirm git base-devel
mkdir -p $HOME/Downloads/
cd $HOME/Downloads
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd
