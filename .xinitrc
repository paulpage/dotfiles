#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
[ -f $sysresources ] && xrdb -merge $sysresources
[ -f $sysmodmap ] && xmodmap $sysmodmap
[ -f "$userresources" ] && xrdb -merge "$userresources"
[ -f "$usermodmap" ] && xmodmap "$usermodmap"

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Disable terminal bell
xset -b

# Natural scrolling for the touchpad only
#
# You may have to set this differently in the future.
# `xinput list` will show your devices, find your touchpad and note the id.
# `xinput list-props {device id} | grep "Scrolling Distance"`, note the id in parentheses
# and the values set for it.
# The final command is `xinput set-prop {device id} {property id} -{value} -{value} ...`
# xinput set-prop 17 287 1
# xinput set-prop 17 288 1

# Caps lock to escape
setxkbmap -option caps:escape 

# picom &
sxhkd &

exec i3
