#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

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
xinput set-prop 17 287 1
xinput set-prop 17 288 1

# Caps lock to escape
xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'


sxhkd &
# slstatus &
picom &
$HOME/.local/bin/lemonbar.sh | lemonbar &


exec bspwm
