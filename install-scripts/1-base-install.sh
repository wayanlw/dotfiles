#!/bin/bash

ln -sf /usr/share/zoneinfo/Australia/Melbourne /etc/localtime
hwclock --systohc
sed -i '177s/.//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "arch" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | chpasswd


sudo timedatectl set-ntp true
sudo hwclock --systohc

# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S --noconfirm  --needed \
		linux-headers \
		base-devel \
		grub \
		os-prober \
		networkmanager \
		network-manager-applet \
		git \
		acpi \
		acpi_call \
		alsa-utils \
		arandr \
		firefox \
		gvim \
		bluez \
		bluez-utils \
		dosfstools \
		mlocate \
		ntfs-3g \
		openssh \
		pulseaudio \
		xdg-user-dirs \
		xdg-utils \

# ─────────────────────────────── video Drivers ────────────────────────────── #
pacman -S --noconfirm --needed xf86-video
pacman -S --noconfirm --needed xf86-video-vesa
# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

# ────────────────────────────── installing grub ───────────────────────────── #
grub-install --target=i386-pc /dev/sda # replace sdx with your disk name, not the partition
grub-mkconfig -o /boot/grub/grub.cfg
echo "GRUB_DISABLE_OS_PROBER=false" >> etc/default/grub
update-grub

# ─────────────────────── adding users and sudo config ─────────────────────── #
useradd -mG wheel suadmin
echo suadmin:password | chpasswd
#usermod -aG libvert suadmin
echo "suadmin ALL=(ALL) ALL" >> /etc/sudoers.d/suadmin

# ───────────────────────────── enabling services ──────────────────────────── #
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable fstrim.timer
#systemctl enable firewalld
systemctl enable acpid


printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"