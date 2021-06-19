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
		dmenu \
		rofi \
		htop \
		chromium \
		ttf-roboto \
		tex-gyre-fonts \
		ttf-ubuntu-font-family \
		ttf-anonymous-pro \
		ttf-cascadia-code \
		xdg-user-dirs \ 
		xdg-utils
		
#yay -S --noconfirm \
#		autokey-gtk \
#		alttab-git
		
echo "enabling lightdm..."
sudo systemctl enable lightdm

echo "adding i3 to xinitrc..."
echo "exec i3" > /home/suadmin/.xinitrc
