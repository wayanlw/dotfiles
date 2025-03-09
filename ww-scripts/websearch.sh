#!/bin/bash

g_url='https://google.com/search?q='
gi_url='https://www.google.com/search?tbm=isch&q='
ddg_url='https://duckduckgo.com/?q=\'
yt_url='https://www.youtube.com/results?search_query='


#QUERY=$(echo '' | dmenu -p "Search:" -fn "-xos4-terminus-medium-r-*-*-14-*" -b)
QUERY=$(echo -e "\
g - google\n\
o - open url\n\
x - more search engines\n\
b - bookmarks\n\
gi - google images\n\
d - duckduckgo\n\
u - youtube\n\
uv - ytfzf video\n\
ua -ytfzf audio\n\
uh - ytfzf history" \
| dmenu -l 7 -p "Search: ")
# | wmenu -p "Search >  " -i -l 8 )
#| fuzzel -d -p "Search >  " -i -l 8 --width 50  --inner-pad 10 --font mono:size=10)


FIRSTWORD=$(echo $QUERY | cut  -d " " -f1)
SEARCH_ITEM=$(echo $QUERY | awk 'NF{$1=x; sub(/^ /,x)}1')

function BrowserOpen(){
    # this was introduced because in KDE xdg-open is not working
    xdg-open "$1"
    # brave-browser "$1"
    # firefox "$1"
}


if [ -n "$QUERY" ]; then
    case $FIRSTWORD in
    "g")
        BrowserOpen "${g_url}${SEARCH_ITEM}" 2>/dev/null
        ;;
    "gi")
        BrowserOpen "${gi_url}${SEARCH_ITEM}" 2>/dev/null
        ;;
    "d")
        BrowserOpen "${ddg_url}${SEARCH_ITEM}" 2>/dev/null
        ;;
    "o")
        BrowserOpen "https://${SEARCH_ITEM}" 2>/dev/null
        ;;
    "u")
        BrowserOpen "${yt_url}${SEARCH_ITEM}" 2>/dev/null
        ;;
    "x")
        "$HOME/.dotfiles/ww-scripts/dm-websearch" 2>/dev/null
        ;;
    "b")
        "$HOME/.dotfiles/ww-scripts/dm-bookmarks" 2>/dev/null
        ;;
    "uv")
        link=$(ytfzf -DL ${SEARCH_ITEM})
        echo -n $link | xclip -sel clip
        # BrowserOpen "${link}" 2>/dev/null
        pkill mpv
        mpv --ytdl-format='bestvideo[height<=?480]+bestaudio' $link > /dev/null 2>&1
        ;;
    "ua")
        link=$(ytfzf -DL ${SEARCH_ITEM})
        echo -n $link | xclip -sel clip
        pkill mpv
        mpv --ytdl-format='bestaudio' $link > /dev/null 2>&1
        ;;
    "uh")
        notify-send test
        link=$(ytfzf -HDL)
        echo -n $link | xclip -sel clip
        pkill mpv
        mpv --ytdl-format='bestvideo[height<=?480]+bestaudio' $link > /dev/null 2>&1
        ;;
    *)
        BrowserOpen "${g_url}${QUERY}" 2>/dev/null
        ;;
        # notify-send "invalid option";;
    esac
        #xdg-open "${URL}${QUERY}" 2> /dev/null
        #exec i3-msg [class="^Firefox$"] focus
fi
