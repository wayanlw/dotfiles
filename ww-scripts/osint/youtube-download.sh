#!/usr/bin/env bash

# ─────────────────────────────────── info ─────────────────────────────────── #
# download only the  auto generated subs
# youtube-dl --write-auto-sub --skip-download https://www.youtube.com/watch\?v\=aQLY8GsXDqs -o text.txt
#
#
#
#
#
# ───────────────────────────────── end info ───────────────────────────────── #


# ─────────────────────── dl without quality selection ─────────────────────── #
# timestamp=$(date +%Y¥-%m-%d:%H:%M)
# url=$(zenity --entry --title "Video Downloader" --text "Target URL: (File saved to ~/Videos")
# [ -z "$url" ] && notify-send "ERROR: Empty URL" && exit
# # dir=$(zenity --file-selection --directory)

# youtube-dl "Surl" -o ~/Videos/Youtube-DL/"Stimestamp% (title)s.% (ext)s"
# -i --all-subs| zenity --progress --pulsate --no-cancel --auto-close --
# title="Video Downloader" --text="Video being saved to ~/Videos/Youtube-
# DL/"

# xdg-open "~/Videos/"

# exit


# ────────────────────────── With quality selection ────────────────────────── #
#!/usr/bin/env bash

opt1="Best Quality"
opt2="Maximum 480p"

timestamp=$(date +%Y-%m-%d:%H:%M)
videodownloadmenu=$(zenity --list --title "Video Downloader" --text "Choose Quality" \
	--radiolist --column "" --column "" TRUE "$opt1" FALSE "$opt2")

case $videodownloadmenu in

	$opt1)
		url=$(zenity --entry --title "Best Quality" --text "Enter target URL")
		[ -z "$url" ] && notify-send "ERROR: Empty URL" && exit
		youtube-dl "$url" -o ~/Videos/Youtube-DL/"$timestamp%(title)s.%(ext)s" \
			-i --all-subs | zenity --progress --pulsate --no-cancel --auto-close \
			--title="Video Downloader" --text="Video being saved to ~/Videos/Youtube-DL/"
		xdg-open ~/Videos/
		exit;;

	$opt2)
		url=$(zenity --entry =--title "Maximum 480p" --text "Enter target URL")
		[ -z "$url" ] && notify-send "ERROR: Empty URL" && exit
		youtube-dl "$url" -o ~/Videos/Youtube-DL/"$timestamp%(title)s.%(ext)s" \
			-i -f 'bestvideo[height<=720]+bestaudio' --all-subs | \
			zenity --progress --pulsate --no-cancel --auto-close --title="Video Downloader" \
			--text="Video being saved to ~/Videos/Youtube-DL/"
		xdg-open ~/Videos/
		exit;;

esac