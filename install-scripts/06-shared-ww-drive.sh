#!/bin/bash
# ww: this script links the xdg directories in the home folder to the shared drive folder in $SharedDir

SharedDir="/home/ww-drive"
if [ ! -d $SharedDir ]; then
    echo "The shared directory $SharedDir doesn't exist"
    exit 1
fi

HomeDirList=(
	$HOME/Music
	$HOME/Videos
	$HOME/Downloads
	$HOME/Pictures
	$HOME/Desktop
	$HOME/Documents
)
for i in ${HomeDirList[@]}; do
	dir="${i##*/}"
    # Check if destination directory exists. If not create directory
    if [ ! -d $SharedDir/$dir ]; then 
        echo "[!] Note : Destination Directory $i doesn't exist.Creating $SharedDir/$dir"
        sudo mkdir $SharedDir/$dir
    fi
    # Check if the source directory has a link
	if [ -L $i ]; then
        CUR_LINK=$(readlink "$i")
        # Compare the current link to the required link and if the link is correct OK. else 
        if [ $CUR_LINK != "${SharedDir}/${dir}" ];then 
            echo "[#] $i link exists. Please check the link" 
        else 
            echo " [ OK ] Already linked" 
        fi
	elif [ -d $i ]; then
		if [ -z "$(ls -A $i)" ]; then
            rmdir $i
            ln -sf $SharedDir/$dir $i
            echo "[ OK ] Success: $i linked"
        else
        echo "[-] Failed: Directory $i is not empty"
        fi
	else
		echo $dir
            ln -sf $SharedDir/$dir $i
		echo "[ OK ] Success: $i linked to $SharedDir/$dir"
	fi
done
