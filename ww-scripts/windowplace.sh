IFS='x' read screenWidth screenHeight < <(xdpyinfo | grep dimensions | grep -o '[0-9x]*' | head -n1)

width=$(xdotool getactivewindow getwindowgeometry --shell | head -4 | tail -1 | sed 's/[^0-9]*//')
height=$(xdotool getactivewindow getwindowgeometry --shell | head -5 | tail -1 | sed 's/[^0-9]*//')

newPosX=$((screenWidth/2-width/2))
newPosY=$((screenHeight/2-height/2))

case $1 in
    1) # maximize the window 
        wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
        xdotool getactivewindow windowmove 0 0 windowsize "$((screenWidth))" "$((screenHeight-50))";;
    2) # left half of the screen
        wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
        xdotool getactivewindow windowmove 0 0 windowsize "$((screenWidth/2))" "$((screenHeight-50))";;
    3) # Right half of the screen
        wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
        xdotool getactivewindow windowmove "$((screenWidth/2))" 0 windowsize "$((screenWidth/2))" "$((screenHeight-50))";;
    4)
        xdotool getactivewindow windowmove "$newPosX" "$newPosY";;
    *)
        exit;;
esac
