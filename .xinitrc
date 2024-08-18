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

# Natural scrolling for the touchpad
touchpad_query="Touchpad"
# touchpad_query="Synaptics TM3512-001"
device_id=$(xinput list | grep "$touchpad_query" | sed 's/.*id=\([0-9]*\).*/\1/')
property_id=$(xinput list-props "$device_id" | grep 'Natural Scrolling Enabled (' | sed 's/.*(\([0-9]*\)).*/\1/')
xinput set-prop "$device_id" "$property_id" 1

# Caps lock to escape
setxkbmap -option caps:escape 
xrandr --auto

# Background Services
sxhkd &
unclutter --hide-on-touch &
# picom &
bluetoothctl power on

exec i3
