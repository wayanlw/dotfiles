#!/bin/bash

cd ~/.dotfiles
git add $(ls -A)
read -p "[+] enter your commit message: " COMMIT
git commit -m "$COMMIT"
git push origin master
