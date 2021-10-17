#!/bin/bash
curDesktop=$(wmctrl -d | awk '{ if ($2 == "*") print $1}')
nxtDesktop=$((curDesktop+1))
prevDesktop=$((curDesktop-1))


case $1 in 
    "next")
        wmctrl -r :ACTIVE: -t $nxtDesktop; wmctrl -s $nxtDesktop;;
    "prev")
        wmctrl -r :ACTIVE: -t $prevDesktop; wmctrl -s $prevDesktop;; 
    "next-noSwitch")
        wmctrl -r :ACTIVE: -t $nxtDesktop;;
    "prev-noSwitch")
        wmctrl -r :ACTIVE: -t $prevDesktop;; 
    *)
        exit;;
esac
