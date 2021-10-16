#!/bin/bash
wmctrl -i -r $(wmctrl -l | rofi -dmenu -i -p "window" | cut -d" " -f1) -t $(wmctrl -d | awk '{ if ($2 == "*") print $1}')
