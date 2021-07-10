echo "Setting timedatectl..."
sudo timedatectl set-ntp true
sudo hwclock --systohc

echo "Setting up reflector..."
sudo reflector -c Australia -a 12 --sort rate --save /etc/pacman.d/mirrorlist


echo "installing packages..."
sudo pacman -S --noconfirm --needed \
		xorg \
		xorg-xinit \
		alacritty \
		lightdm \
		lightdm-gtk-greeter \
		lightdm-gtk-greeter-settings \
		i3-gaps \
		ttf-dejavu \
		i3status \
        i3lock \
		dmenu \
		rofi \
		htop \
		firefox \
		ttf-roboto \
		tex-gyre-fonts \
		ttf-ubuntu-font-family \
		ttf-anonymous-pro \
		ttf-cascadia-code \
		xdg-user-dirs \
		xdg-utils \
		fzf \
        polkit \
        lxsession \
        pcmanfm \
        ranger \
        lxappearance \
        arc-gtk-theme \
        ttf-font-awesome

		
#install yay	
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

#yay -S --noconfirm \
#		autokey-gtk \
#		alttab-git
		
echo "enabling lightdm..."
sudo systemctl enable lightdm

echo "adding i3 to xinitrc..."
echo "exec i3" > /home/suadmin/.xinitrc
