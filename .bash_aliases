

#
# .bash_alisasses
#

alias brightness="xrandr --output VGA1 --brightness"
alias lcmd="cat $HOME/.bash_aliases| grep alias | grep -v '^#' | sed  's/^\w*\ *//'"
alias lks="cat .config/sxhkd/sxhkdrc | grep -v '#' | grep -v '^ $' | grep -v '^$'"
alias lwwdir="cat .config/sxhkd/sxhkdrc | grep -v '#' | grep -v '^ $' | grep -v '^$'"
alias ll='ls --human-readable --size -1 --classify'
alias lla='ls -A --human-readable --size -1 --classify'
# alias rm='mv -t /root/MyTrash/'

alias findpkg='pacman -Qq | grep'
alias paci='sudo pacman -S'
alias pacu='sudo pacman -Runs'
alias pacs='pacman -Ss'
alias pacclean='sudo pacman -Runs $(pacman -Qqdt)'
alias paclist="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less),ctrl-y:execute(echo -n {}|xclip -sel clip)'"
alias pacorder='ls -ltr /var/lib/pacman/local'
alias pacall="pacman -Slq | fzf --preview 'pacman -Si {}' --layout=reverse --bind 'ctrl-i:execute(sudo pacman -S {})+abort,enter:execute(pacman -Si {} | less)'"
alias yayall="yay -Slq | fzf --preview 'yay -Si {}' --layout=reverse --bind 'ctrl-i:execute(yay -S {})+abort,enter:execute(yay -Si {} | less)'"
alias yayi='yay -S'
alias yays='yay -Ss'
alias yayu='yay -Runs'

alias hbc='vim ~/.config/herbstluftwm/autostart'
alias i3config='vim ~/.config/i3/config'
alias sxc='vim ~/.config/sxhkd/sxhkdrc'

alias ars='setxkbmap us'
alias asd='setxkbmap us -variant colemak'

#changing folders
alias dl='cd ~/Downloads'
alias cfg='cd ~/.config'

# Downloading with aria2c
alias download='aria2c -x 16 -s 16' # x - number of connections per server, s - splits

# Git Commands
function gpush(){
    git add $(ls -A)
    git commit -m "$(date)"
    git push origin master
}

alias cd='cl'
alias cdf='cd $(find . -maxdepth 4 -type d 2>/dev/null | ff)'
alias cdr='cd $(find / -maxdepth 4 -type d 2>/dev/null | ff)'
alias .='cd ..'
alias ..='cd ../..'
alias ...='cd ../../..'

alias ff='fzf --height 50% -m --layout=reverse --border'
alias vif='vim $(find . -maxdepth 4 -type f | ff)'

alias grep="grep --color=auto"

alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

alias cp='cp -v'
alias mv='mv -v'

# ---------------------------------------------------------------------------- #
#                                   FUNCTIONS                                  #
# ---------------------------------------------------------------------------- #

# ───────────────────────────── find with locate ───────────────────────────── #
function fnd(){
    locate $1 | fzf
}

#preview and edit a file in a given path using vim
function vil(){
    find $1 -maxdepth 4 -type f 2>/dev/null| fzf --height 50% --reverse --border --preview "cat {}" --bind "enter:execute(vim {})"
}


function weather(){
        [[ $1 = "" ]] && curl 'wttr.in/?FA' || curl "wttr.in/$1?0FT"
}

function cheat(){
        [[ $1 = "" ]] && curl cheat.sh/ || curl cheat.sh/$1
}


# Open nano and make backup of original file. Useful for config files and things you don't want to edit the original
function vimbk() {
    echo "You are making a copy of $1 before you open it. Press enter to continue."
    read nul
    cp $1 $1.bak
    vim $1
}

# function rm(){
#     if [ -d $HOME/recycle-bin ]; then
#         mv -t $HOME/recycle-bin "$@" 1> /dev/null
#     else
#         mkdir $HOME/recycle-bin
#         mv -t $HOME/recycle-bin "$@" 1> /dev/null
#     fi
# }


# ────────────────────────── Youtube Video and Audio ───────────────────────── #

# search and watch youtube videos from terminal youtube Video | Youtube Audio
function uv(){
    # link=$(ytfzf -L "'$*'")
    link=$(ytfzf -L -t --thumbnail-quality=0 "'$*'")
    echo -n $link | xclip -sel clip
    mpv --ytdl-format='bestvideo[height<=?720]+bestaudio' $link > /dev/null 2>&1

}
function ua(){
    link=$(ytfzf -L "'$*'")
    # link=$(ytfzf -L -t --thumbnail-quality=0 "'$*'")
    echo -n $link | xclip -sel clip
    mpv --ytdl-format='bestaudio' $link > /dev/null 2>&1 &
    echo "[+] To stop playing in background enter 'pkill mpv'"
}

# ─────────────────────────── pring ls at every cd ─────────────────────────── #
# Prints the ls command when cd
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

# ─────────── make directories if the parent folders doesnt exists ─────────── #
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

# ───────────────────────────── Terminal Googling ──────────────────────────── #
function goog(){
    q=""
    i=0

    for var in "$@"
    do
       if [ "$i" -eq "0" ]
       then
          q+=$var
       else
          q+="+"$var
       fi
       i+=1
    done

    xdg-open "http://www.google.com/search?q=$q" >/dev/null 2>&1
}
