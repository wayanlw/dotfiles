#!/bin/bash

g_url='https://google.com/search?q='
gi_url='https://www.google.com/search?tbm=isch&q='
ddg_url='https://duckduckgo.com/?q='
yt_url='https://www.youtube.com/results?search_query='


#QUERY=$(echo '' | dmenu -p "Search:" -fn "-xos4-terminus-medium-r-*-*-14-*" -b)
QUERY=$(echo -e "g - google\ngi - google images\nddg - duckduckgo\nu - youtube" | dmenu -l 4 -p "Search: ")
FIRSTWORD=$(echo $QUERY | cut  -d " " -f1)
SEARCH_ITEM=$(echo $QUERY | awk 'NF{$1=x; sub(/^ /,x)}1')
if [ -n "$QUERY" ]; then
    case $FIRSTWORD in 
    "g")
        xdg-open "${g_url}${SEARCH_ITEM}" 2>/dev/null
        break;;
    "gi")
        xdg-open "${gi_url}${SEARCH_ITEM}" 2>/dev/null
        break;;
    "ddg")
        xdg-open "${ddg_url}${SEARCH_ITEM}" 2>/dev/null
        break;;
    "u")
        xdg-open "${yt_url}${SEARCH_ITEM}" 2>/dev/null
        break;;
    *)
        echo "invalid option";;
    esac
        #xdg-open "${URL}${QUERY}" 2> /dev/null
        #exec i3-msg [class="^Firefox$"] focus
fi
