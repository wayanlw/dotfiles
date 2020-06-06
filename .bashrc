#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


#add my scripts to the path
PATH=$PATH:~/.dotfiles/scripts


#lww Aliases file
[ -e $HOME/.bash_aliases ] && source $HOME/.bash_aliases || ln -sf $HOME/.dotfiles/.bash_aliases $HOME/.bash_aliases && source $HOME/.bash_aliases

