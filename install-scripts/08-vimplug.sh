#!/usr/bin/env bash

# ────────────────────────── install zsh and ohmyzsh ───────────────────────── #
printf '\n\nInstalling vimplug  =======================\n'
printf 'After install, inside vim run :PlugInstall\n'
# ──────────────────────────── downloading vmiplug ─────────────────────────── #

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
