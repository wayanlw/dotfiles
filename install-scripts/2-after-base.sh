echo "Setting timedatectl..."
sudo timedatectl set-ntp true
sudo hwclock --systohc

# echo "Setting up reflector..."
# sudo reflector -c Australia -a 12 --sort rate --save /etc/pacman.d/mirrorlist

# ───────────────────────── Installing basic packages ──────────────────────── #
echo "installing packages..."
sudo pacman -S --noconfirm --needed \
		dmenu \
		rofi \
		fzf \
		i3-gaps \
		i3status \
		kitty \
		lightdm \
		lightdm-gtk-greeter \
		ttf-dejavu \
		xdg-user-dirs \
		xdg-utils \
		xorg \
		xorg-xinit \
        arc-gtk-theme \
        i3lock \
        lxappearance \
        lxsession \
        pcmanfm \
        ttf-font-awesome
		mtools \
		rsync \
		python \

# ──────────────────────────────── install yay ─────────────────────────────── #
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

yay -S --noconfirm \
		autokey-gtk \
		alttab-git

echo "enabling lightdm..."
sudo systemctl enable lightdm

echo "adding i3 to xinitrc..."
echo "exec i3" > /home/suadmin/.xinitrc
