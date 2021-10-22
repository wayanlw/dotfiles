#!/bin/bash

#if there is single monitor you can use this
IFS='x' read screenWidth screenHeight < <(xdpyinfo | grep dimensions | grep -o '[0-9x]*' | head -n1)

width=$(xdotool getactivewindow getwindowgeometry --shell | head -4 | tail -1 | sed 's/[^0-9]*//')
height=$(xdotool getactivewindow getwindowgeometry --shell | head -5 | tail -1 | sed 's/[^0-9]*//')

newPosX=$((screenWidth/2-width/2))
newPosY=$((screenHeight/2-height/2))

# if there are multiple monitors have to use this use xrandr to identify the below parameters
# use xrandr | grep ' \connected\ ' to get these information 

# taskbar size
taskbar=50

# primary monitor
w2=1920
h2=1080

# seconday monitor
w1=1366
h1=768

# offset
xP=333
yP=1080


case $1 in
    1) # Primary full screen
        wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
        xdotool getactivewindow windowmove 0 0 
        xdotool getactivewindow windowsize "$((w1))" "$((h1-taskbar))"
        ;;
    2) # Primary left half
        wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
        xdotool getactivewindow windowmove 0 0 
        xdotool getactivewindow windowsize "$((w1/2))" "$((h1-taskbar))"
        ;;
    3) # Primary second half
        wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
        xdotool getactivewindow windowsize "$((w1/2))" "$((h1-taskbar))"
        xdotool getactivewindow windowmove "$((w1/2))" 0 
        ;;
    4) # secondary full screen
        wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
        xdotool getactivewindow windowsize "$((w2))" "$((h2-taskbar))"
        xdotool getactivewindow windowmove $xP $yP
        ;;
    5) # secondary first half
        wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
        # wmctrl -r :ACTIVE: -e 0,277,1080,$((w2/2)),750 
        # wmctrl -r :ACTIVE: -e 0,$xP,1080,$((w2/2)),$h2 
        xdotool getactivewindow windowmove --sync $xP $yP 
        xdotool getactivewindow windowsize --sync "$((w2/2))" "$((h2-taskbar))"
        ;;
    6) # Right half of the screen
        wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
        xdotool getactivewindow windowsize "$((w2/2))" "$((h2-taskbar))"
        xdotool getactivewindow windowmove $((xP +(w2/2))) $yP
        ;;
    7)
        xdotool getactivewindow windowmove "$newPosX" "$newPosY";;
    *)
        exit;;
esac
