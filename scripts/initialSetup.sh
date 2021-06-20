#!/usr/bin/env bash

#installs main programs
printf '\n>>>>>>> Installing the main programs\n'
# sudo pacman -Sy --needed - < ~/.dotfiles/scripts/lwwappslist.txt
sudo pacman -Sy --needed \
        alacritty \
        alsa-plugins \
        alsa-utils \
        arandr \
        curl \
        dmenu \
        pcmanfm \
        feh \
        firefox \
        fzf \
        geany \
        i3-gaps \
        i3status \
        i3lock \
        i3status \
        man \
        mlocate \
        mpv \
        networkmanager \
        p7zip \
        pulseaudio \
        pulseaudio-alsa \
        ranger \
        rofi \
        rsync \
        sudo \
        sxiv \
        tint2 \
        tree \
        vim \
        wget \
        which \
        xorg-server \
        xorg-xinit

#install yay
printf '\n>>>>>>> installing yay\n'
pacman -S --needed --noconfirm git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

# #install Paru
# sudo pacman -S --needed base-devel
# git clone https://aur.archlinux.org/paru.git
# cd paru
# makepkg -si
# cd

#symlinking i3
printf '\n>>>>>>> linking i3 config\n'
[ -d ~/.config/i3 ] && ln -sf ~/.dotfiles/.config/i3/config ~/.config/i3/config && i3-msg reload

#linking tint2
printf '\n>>>>>>> linking tint2rc\n'
[ -d ~/.config/tint2 ] && ln -sf ~/.dotfiles/.config/tint2/tint2rc ~/.config/tint2/tint2rc

#linking vimrc
printf '\n>>>>>>> linking vimrc and cloning vimplug\n'
[[ -f $HOME/.dotfiles/.vimrc ]] && ln -sf $HOME/.dotfiles/.vimrc $HOME/.vimrc && echo "####### .vimrc linked" || echo ".vimrc not available in ~/.dotfiles"
#downloading vimiplug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#linking the .Xmodmapfile
printf '\n>>>>>>> linking Xmodkey(direct version)...\n'
[[ -f $HOME/.dotfiles/.Xmodmap ]] && ln -sf $HOME/.dotfiles/.Xmodmap $HOME/.Xmodmap && echo "####### .Xmodmap linked" || echo ".Xmodmap not available in ~/.dotfiles"
# printf '\n>>>>>>> linking Xmodmap (Autokey Version\n'
# [[ -f $HOME/.dotfiles/autokey/.Xmodmap ]] && ln -sf $HOME/.dotfiles/.Xmodmap $HOME/.Xmodmap && echo "####### .Xmodmap linked" || echo ".Xmodmap not available in ~/.dotfiles"


#linking the fonts
echo "Linking the .fonts directory"
ln -sf $HOME/.dotfiles/.fonts $HOME/.fonts
fc-cache -f -v

#install zsh and ohmyzsh
printf '\n>>>>>>> installing zsh\n'
sudo pacman -Sy zsh
chsh -s "$(which zsh)"

printf '\n>>>>>>> installing oh-my-zsh\n'
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp $HOME/.dotfiles/.zshrc $HOME/
printf '\n>>>>>>> installing oh-my-zsh plugins\n'
git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
[[ -f $HOME/.dotfiles/.zshrc ]] && ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc && echo "####### .zshrc linked" || echo ".zshrc not available in ~/.dotfiles"

#install yay packages
printf '\n>>>>>>> installing yay packages\n'
yay -S alttab-git autokey-gtk


