#!/bin/bash

cd ~/.dotfiles
git add $(ls -A)
git commit -m "$(date)"
git push origin master
