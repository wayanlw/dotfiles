#!/bin/bash

ln -sf /usr/share/zoneinfo/Europe/Zurich /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=de_CH-latin1" >> /etc/vconsole.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | chpasswd


sudo timedatectl set-ntp true
sudo hwclock --systohc

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S --noconfirm  \
		grub \
		networkmanager \
		network-manager-applet \
		mtools \
		dosfstools \
		reflector \
		base-devel \
		linux-headers \
		bluez \
		bluez-utils \
		alsa-utils \
		pulseaudio \
		bash-completion \
		openssh \
		rsync \
		reflector \
		acpi \
		acpi_call \
		os-prober \
		ntfs-3g \
		mlocate \
		git

#install yay	
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd

#video Drivers
pacman -S --noconfirm --needed xf86-video
pacman -S --noconfirm --needed xf86-video-vesa
# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings
		
grub-install --target=i386-pc /dev/sdX # replace sdx with your disk name, not the partition
grub-mkconfig -o /boot/grub/grub.cfg

useradd -mG wheel suadmin
echo suadmin:password | chpasswd
usermod -aG libvert suadmin
echo "suadmin ALL=(ALL) ALL" >> /etc/sudoers.d/suadmin

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
	
		
pacman -S --noconfirm --needed  \
		grub \		networkmanager \		network-manager-applet \		dialog \		wpa_supplicant \		mtools \		dosfstools \		reflector \		base-devel \		linux-headers \		avahi \		xdg-user-dirs \		xdg-utils \		gvfs \		gvfs-smb \		nfs-utils \		inetutils \		dnsutils \		bluez \		bluez-utils \		cups \		hplip \		alsa-utils \		pulseaudio \		bash-completion \		openssh \		rsync \		reflector \		acpi \		acpi_call \		tlp \		virt-manager \		qemu \		qemu-arch-extra \		edk2-ovmf \		bridge-utils \		dnsmasq \		vde2 \		openbsd-netcat \		iptables-nft \		ipset \		firewalld \		flatpak \		sof-firmware \		nss-mdns \		acpid \		os-prober \		ntfs-3g \		terminus-font

systemctl enable NetworkManager
systemctl enable bluetooth

systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable reflector.timer
systemctl enable fstrim.timer
#systemctl enable libvirtd
#systemctl enable firewalld
systemctl enable acpid

