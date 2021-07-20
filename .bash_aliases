

#
# .bash_alisasses
#

alias brightness="xrandr --output VGA1 --brightness"
#alias brightness="xrandr --output LVDS1 --brightness"
alias lcmd="cat $HOME/.bash_aliases| grep alias | grep -v '^#' | sed  's/^\w*\ *//'"
alias lwwdir='cd $HOME/.dotfiles/'
alias ll='ls --human-readable --size -1 --classify'
alias lla='ls -A --human-readable --size -1 --classify'
alias paci='sudo pacman -S'
alias pacu='sudo pacman -Runs'
alias pacs='pacman -Ss'
alias pacclean='sudo pacman -Runs $(pacman -Qqdt)'
alias paclist='pacman -Qq | fzf'
alias pacorder='ls -ltr /var/lib/pacman/local'
alias yayi='yay -S'
alias yayu='yay -Runs'
alias yays='yay -Ss'
alias fs='find ~ | fzf'
alias fpkg='pacman -Qq | grep'
alias i3config='vim ~/.config/i3/config'
alias bashreload='source ~/.bashrc && echo Bash config reloaded'
alias rm='mv -t /root/MyTrash/'

alias mv='mv -v'
alias rm='rm -vi'
alias cp='cp -v'


alias more=less
alias du='du -sh *| sort -h'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB


alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias grep='grep --color=auto'
alias cd='cl'


alias i3config='vim ~/.config/i3/config'
alias vif='vim $(find . -maxdepth 4 -type f | ff)'
alias ff='fzf --height 50% -m --layout=reverse --border'
alias cdf='cd $(find . -maxdepth 4 -type d 2>/dev/null | ff)'
alias cdr='cd $(find / -maxdepth 4 -type d 2>/dev/null | ff)'

alias grep="grep --color=auto"
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
#alias cd="cl"

# ---------------------------------------------------------------------------- #
#                                   FUNCTIONS                                  #
# ---------------------------------------------------------------------------- #

#--------------------------------- find with locate
function fnd(){
    locate $1 | fzf
}

#preview and edit a file in a given path using vim
function vil(){
    find $1 -maxdepth 4 -type f | fzf --height 50% --reverse --border --preview "cat {}" --bind "enter:execute(vim {})"
}

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


function cpcd(){
    if [ -d "$2" ]; then
        ### Take action if $DIR exists ###
        echo "${2} exists and copying now"
        cp -v $1 $2
        else
        ###  Control will jump here if $DIR does NOT exists ###
        echo " ${2} not found. Creating directories now."
        mkdir -p $2
        cp -v $1 $2
    fi
}
