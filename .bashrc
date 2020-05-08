#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export PS1="\[$(tput bold)\]\[\033[38;5;11m\]\[\033[48;5;17m\]\u\[$(tput sgr0)\]\[\033[38;5;17m\]\[\033[48;5;11m\]@\w\[$(tput sgr0)\] \[$(tput bold)\]\[$(tput sgr0)\]\[\033[38;5;11m\]▶ \[$(tput sgr0)\]"


#add my scripts to the path
PATH=$PATH:~/.dotfiles/scripts
