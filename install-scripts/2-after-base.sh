printf "\n\nSetting timedatectl  ===================================\n"
sudo timedatectl set-ntp true
sudo hwclock --systohc

# echo "Setting up reflector..."
# sudo reflector -c Australia -a 12 --sort rate --save /etc/pacman.d/mirrorlist

# ───────────────────────── Installing basic packages ──────────────────────── #

pacman_array=(\
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
)

# ───────────────────────────── Trapping Contrl+c ──────────────────────────── #
cleanup ()
{
# kill -s SIGTERM $!
echo "You've presed ctrl+c. Exiting"
exit 0
}

trap cleanup SIGINT SIGTERM

# ──────────────────────────────── installing ──────────────────────────────── #

printf "\n\n\n[+] >>>>>> Installing BASIC Pacman Packages\n "

for name in ${pacman_array[@]}; do
	printf "\n\n[+] Installing $name ===============================\n"
	sudo pacman -S --noconfirm --needed $name
done



# ──────────────────────────────── install yay ─────────────────────────────── #
printf '\n\ninstalling yay  ===================================\n'
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

echo "\n\nenabling lightdm  ===================================\n"
sudo systemctl enable lightdm

echo "\n\nadding i3 to xinitrc  ===================================\n"
echo "exec i3" > /home/suadmin/.xinitrc
