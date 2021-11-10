# ─────────────────────────────── Package list ─────────────────────────────── #
pacman_array=(\
	# ───────────────────────────────── terminals ──────────────────────────────── #
	alacritty \
	kitty \
	# terminator
	zsh #download ohmyzsh too \
	tmux \
	# ──────────────────────────── terminal utilities ──────────────────────────── #
	tree \
	sudo \
	which \
	# ──────────────────────────────── monitor mgt ─────────────────────────────── #
	arandr \
	# lxrandr \
	# ────────────────────────────────── themes ────────────────────────────────── #
	arc-gtk-theme \
	# ───────────────────────────── system cleansing ───────────────────────────── #
	bleachbit \
	# ───────────────────────────────── bluetooth ──────────────────────────────── #
	blueman \
	bluez \
	bluez-utils \
	# ──────────────────────────── clipboard managers ──────────────────────────── #
	parcellite \
	#clipmenu \
	xclip \
	xsel \
	# ───────────────────────── autostart and session mgt ──────────────────────── #
	lxsession #lxsession-xdg-autostart \
	xdg-utils #xdg-open to open with default program \
	dex # can use to generate *.desktopfiles  in ~/.config/autostart/ and simulate autorstart // dex -create ww-autostart.sh -target-directory ~/.config/autostart // dex --autostart --dry-run --enfironment i3 \
	xdg-user-dirs # creating of user directories \
	# ───────────────────────────────── launcher ───────────────────────────────── #
	dmenu # dmenu_run -i -lines 10 \
	rofi \
	# ulauncher \
	# ──────────────────────── taskbar and desktop related ─────────────────────── #
	plank \
	# lxpanel \ # there is a memoryleaak in lxpanel \
	tint2 \
	# ──────────────────────────── system notification ─────────────────────────── #
	dunst \
	# ──────────────────────────────── wallpapers ──────────────────────────────── #
	feh  # feh feh --bg-scale --randomize ~/Pictures/wallpapers/* \
	nitrogen \
	# variety # Variety comsumes a lot of resources \
	# ────────────────────────────────── search ────────────────────────────────── #
	fsearch \
	mlocate \
	fzf \
	# ──────────────────────────────────── pdf ─────────────────────────────────── #
	qpdfview \
	zathura \
	zathura-pdf-mupdf \
	# ──────────────────────────────────── git ─────────────────────────────────── #
	git \
	#git-lfs \
	# ──────────────────────────────── OS Related ──────────────────────────────── #
	gnome-keyring \
	# ───────────────────────────── dropdown terminal ──────────────────────────── #
	tilda \
	#guake \
	# ─────────────────────────────── text editors ─────────────────────────────── #
	gvim \
	code \
	notepadqq \
	#geany \
	#neovim \
	# ───────────────────────────── window management ──────────────────────────── #
	xdotool \
	wmctrl \
	# ────────────────────────────────── network ───────────────────────────────── #
	networkmanager \
	network-manager-applet \
	# ─────────────────────────────────── sound ────────────────────────────────── #
	pulseaudio \
	pulseaudio-alsa \
	pulseaudio-bluetooth \
	pavucontrol \
	volumeicon \
	# ─────────────────────────────────── video ────────────────────────────────── #
	mpv \
	#vlcplayer \
	youtube-dl \
	ueberzug  # required for youtubdl thumbnail display \
	# ────────────────────────────────── images ────────────────────────────────── #
	sxiv \
	# ─────────────────────────────── screen capture ────────────────────────────── #
	flameshot \
	peek \
	# ──────────────────────────────── Cloud Sync ──────────────────────────────── #
	megasync \
	dropbox \
	# ───────────────────────────────── rssreader ──────────────────────────────── #
	newsboat \
	# ────────────────────────────────── reddit ────────────────────────────────── #
	rtv \
	# ─────────────────────────────── filemanagers ─────────────────────────────── #
	pcmanfm \
	ranger \
	ncdu \
	#nnn \
	#vifm
	# ─────────────────────────────── lx utilities ─────────────────────────────── #
	lxappearance \
	lxinput \
	lxsession \
	# ────────────────────────────── task management ───────────────────────────── #
	lxtask \
	htop \
	# ──────────────────────────────── filesystem ──────────────────────────────── #
	os-prober \
	ntfs-3g \
	udisks2 \
	udiskie \
	#usbutils \
	# ──────────────────────────────── ssh and vpn ─────────────────────────────── #
	openssh \
	openvpn \
	# ───────────────────────────────── compsitor ──────────────────────────────── #
	picom \
	# ──────────────────────── file syncing and cloning ──────────────────────── #
	rclone \
	rsync \
	clonezilla \
	# ──────────────────────────── keyboard automation ─────────────────────────── #
	autokey-gtk # install using yay
	sxhkd \
	# ─────────────────────────────────── fonts ────────────────────────────────── #
	ttf-anonymous-pro \
	ttf-cascadia-code \
	ttf-dejavu \
	ttf-font-awesome \
	ttf-roboto \
	# ───────────────────────────────── downloads ──────────────────────────────── #
	curl \
	aria2 \
	uget \
	wget \
	# ────────────────────────────── virtualization ────────────────────────────── #
	virtualbox \
	virtualbox-guest-iso \
	docker \
	# archiving \
	p7zip \
	xarchiver \
	# ────────────────────────────── window managers ───────────────────────────── #
	i3-gaps \
	i3lock \
	i3status \
	openbox \
	menumaker # menumaker for openbox mmaker -vf
	obconf # appearance config for openbox
	herbstluftwm \
	dzen2 \
	lightdm \
	lightdm-gtk-greeter \
	lightdm-gtk-greeter-settings \
)

yay_array=( \
	autokey-gtk \
	rtv \
	stacer \
	dropbox \
	visual-studio-code-bin \
	fsearch \
	ulauncher \
	alttab-git
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

printf "\n\n\n[+] >>>>>> Installing Pacman Packages\n "

for name in ${pacman_array[@]}; do
	printf "[+] Installing $name -------------------------\n"
	sudo pacman -S --noconfirm --needed $name
done

printf "\n\n\n[+] >>>>>> Installing Yay Packages\n "

for name in ${yay_array[@]}; do
	printf "[+] Installing $name -------------------------\n"
	sudo yay -S --noconfirm --needed $name
done