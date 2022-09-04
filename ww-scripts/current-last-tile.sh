#!/bin/bash

# ─────────────────────────────── Requirements ─────────────────────────────── #
# Requirements: xdotool, wmctrl, rofi, sxhkd with sxhkdrc in ~/.dotfiles/
# Functionality: Script Arranges the current window either with the
#                previous window or a window selected with rofi, side by side.
# ──────────────────────────────────────────────────────────────────────────── #

#if there is single monitor you can use this
# IFS='x' read screenWidth screenHeight < <(xdpyinfo | grep dimensions | grep -o '[0-9x]*' | head -n1)
# newPosX=$((screenWidth/2-width/2))
# newPosY=$((screenHeight/2-height/2))

# if there are multiple monitors have to use this use xrandr to identify the below parameters
# use xrandr | grep ' \connected\ ' to get these information

# taskbar size
taskbar=65


# Monitor Dimensions
width=1600
height=900

case $1 in
    1) # Previously active windows tiled with the active windows
		wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
		xdotool getactivewindow windowmove 0 0
		xdotool getactivewindow windowsize "$((width/2))" "$((height-taskbar))"

		sleep 0.2

		wmctrl -i -a $(wmctrl -l | rofi -dmenu -i -p "window" | cut -d" " -f1)

		sleep 0.2

		wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
		xdotool getactivewindow windowsize "$((width/2))" "$((height-taskbar))"
		xdotool getactivewindow windowmove "$((width/2))" 0

		sleep 0.2

		xdotool key alt+Tab
		;;

    2) # Rofi selected window tiled with the active window
		wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
		xdotool getactivewindow windowmove 0 0
		xdotool getactivewindow windowsize "$((width/2))" "$((height-taskbar))"

		sleep 0.2

		xdotool key alt+Tab

		sleep 0.2

		wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz
		xdotool getactivewindow windowsize "$((width/2))" "$((height-taskbar))"
		xdotool getactivewindow windowmove "$((width/2))" 0

		sleep 0.2

		xdotool key alt+Tab
		;;
	*)
		exit;;
esac
