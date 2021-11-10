#!/usr/bin/env bash

# ────────────────────────── install zsh and ohmyzsh ───────────────────────── #
printf '\n>>>>>>> installing zsh\n'
sudo pacman -Sy zsh
chsh -s "$(which zsh)"

[[ -f $HOME/.dotfiles/.zshrc ]] && ln -sf $HOME/.dotfiles/.zshrc $HOME/.zshrc && echo "####### .zshrc linked" || echo ".zshrc not available in ~/.dotfiles"

# ───────────────────────────── install oh-my-zsh ──────────────────────────── #
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp $HOME/.dotfiles/.zshrc $HOME/

printf '\n>>>>>>> installing oh-my-zsh plugins\n'
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting


# ──────────────────────────── downloading vmiplug ─────────────────────────── #
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
