

#
# .bash_alisasses
#

alias brightness="xrandr --output VGA1 --brightness"
#alias brightness="xrandr --output LVDS1 --brightness"
alias lcmd='cat ~/.dotfiles/lwwcommands'
alias lwwdir='cd ~/.dotfiles/'
alias ll='ls --human-readable --size -1 --classify'
alias lla='ls -A --human-readable --size -1 --classify'
alias inst='sudo pacman -S'
alias uninst='sudo pacman -Runs'
alias pacclean='sudo pacman -Runs $(pacman -Qqdt)'
alias pacsearch='pacman -Ss'
alias fs='find ~ | fzf'
alias paclist='pacman -Qq | fzf'
alias fpkg='pacman -Qq | grep'
alias i3config='vim ~/.config/i3/config'
alias bashreload='source ~/.bashrc && echo Bash config reloaded'

alias mv='mv -v'
alias rm='rm -vi'
alias cp='cp -v'

alias du='du -sh *| sort -h'

alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias grep='grep --color=auto'
alias cd='cl'



#---------------------------------check weather
function weather(){ 
        [[ $1 = "" ]] && curl wttr.in/?FA || curl wttr.in/$1?0FT 
}

#---------------------------------heck weather
function cheat(){ 
        [[ $1 = "" ]] && curl cheat.sh/ || curl cheat.sh/$1
}


#---------------------------------Open nano and make backup of original file. Useful for config files and things you don't want to edit the original
function vimbk() {
    echo "You are making a copy of $1 before you open it. Press enter to continue."
    read nul
    cp $1 $1.bak
    vim $1
}

#---------------------------------  Prints the ls command when cd
function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -F --color=auto
}
