#!/bin/zsh

#Swap caplocks and ctrl
/usr/bin/setxkbmap -option "ctrl:swapcaps"

#Set capslock to be esc if short tap
/usr/bin/xcape -e 'Control_L=Escape'

#Spawn daemons
ibus-daemon &

#Init xmonad
/usr/bin/xmonad-session
