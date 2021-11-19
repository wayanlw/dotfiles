#!/bin/bash
# SEL=$(xclip -out -selection clipboard)
# notify-send $SEL
# xclip -i -selection clipboard $(xsel)
MSG=$(xsel)
echo $MSG | xclip -i -sel clip
# sleep 2
xdotool type --window 77594630 "$MSG"

# xsel --clipboard
# notify-send $MSG