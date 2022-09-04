#!/bin/bash
# ww: this script links the xdg directories in the home folder to the shared drive folder in $SharedDir

SharedDir="/home/ww-drive"
if [ -d $SharedDir ]; then
    echo "The shared directory $SharedDir doesn't exist"
    exit 1
fi

HomeDirList=(
	$HOME/Music
	$HOME/Videos
	$HOME/Downloads
	$HOME/Pictures
	$HOME/Desktop
)
for i in ${HomeDirList[@]}; do
	dir="${i##*/}"
	if [ -L $i ]; then
		echo "[#] $i link exists. Please check the link"
	elif [ -d $i ]; then
		if [ -z "$(ls -A $i)" ]; then
			rmdir $i
			ln -sf $SharedDir/$dir $i
			echo "[+] Success: $i linked"
		else
			echo "[-] Failed: Directory $i is not empty"
		fi
	else
		echo $dir
		ln -sf $SharedDir/$dir $i
		echo "[+] Success: $i linked"
	fi
done
