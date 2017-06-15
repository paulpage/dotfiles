#!/bin/bash

# disable terminal beep
xset -b

# set background
feh --bg-scale ~/path/to/image

# keyboard options
setxkbmap -option compose:ralt
setxkbmap -option caps:escape

# Reverse touchpad scrolling
xinput --set-prop "SynPS/2 Synaptics TouchPad" 283 1

# start window manager
exec i3
