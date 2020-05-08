#!/bin/bash

read -p "Are you sure? [y/N]" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
	echo "Your .bash files will be moved to $HOME/lwwbackups directory"
	[ -d ~/lwwbackups ] || mkdir ~/lwwbackups

	subs=`ls -a ~ | grep .bash`
	echo $subs
for i in $subs ; do
	cp ~/$i ~/lwwbackups/$i
	mv ~/lwwbackups/$i ~/lwwbackups/$(date +%y%m%d_%H%M%S)_${i}
	echo "new file create $(date +%y%m%d_%H%M%S)_${i}"

done
fi

echo "Your lwwbackup folder contains `ls -a | wc -l` files. "
read -p "Do you want to delete some files? [y/N]:  " -n 1 -r rep1 
echo
if [[ $rep1 =~ ^[Yy]$ ]]
then
	read -p "How many minutes back? :  " age
	echo
	read -p "Do you want to delete files more than $age minutes old [y/N]: " -n 1 -r rep3  
	echo
		if [[ $rep3 =~ ^[Yy]$ ]] 
then 
			rm -rf $(readlink -f $(find ~/lwwbackups -maxdepth 1 -mmin +$age))
		fi
fi
