#!/bin/bash
wmctrl -x -a "$1" || $1
# herbstclient jumpto urgent # required if running herbstluftwm
