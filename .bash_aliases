#lww Aliases
alias brightness="xrandr --output VGA-1 --brightness "
alias lcmd="cat ~/.dotfiles/lwwcommands"
alias lwwdir="cd ~/.dotfiles/"
alias ll="ls --human-readable --size -1 --classify"
alias lla="ls -A --human-readable --size -1 --classify"

function weather(){ 
        [[ $1 = "" ]] && curl wttr.in/?FA || curl wttr.in/$1?0FT 
}

# Reloads the bashrc file
alias bashreload="source ~/.bashrc && echo Bash config reloaded"

# Open nano and make backup of original file. Useful for config files and things you don't want to edit the original
function vimbk() {
    echo "You are making a copy of $1 before you open it. Press enter to continue."
    read nul
    cp $1 $1.bak
    vim $1
}

# Make some of the file manipulation programs verbose
alias mv="mv -v"
alias rm="rm -vi"
alias cp="cp -v"

# Prints disk usage in human readable form
alias du="du -sh *| sort -h"

# GREP Motifications
alias grep="grep --color=auto"

alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

alias cd="cl"

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
