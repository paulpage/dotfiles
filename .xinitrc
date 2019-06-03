# Disable terminal bell
xset -b

# Natural scrolling for the touchpad only
#
# You may have to set this differently in the future.
# `xinput list` will show your devices, find your touchpad and note the id.
# `xinput list-props {device id} | grep "Scrolling Distance"`, note the id in parentheses
# and the values set for it.
# The final command is `xinput set-prop {device id} {property id} -{value} -{value} ...`
xinput set-prop 13 299 1
xinput set-prop 13 291 1

# Set background
feh --bg-scale ~/Pictures/wallpapers/wallpaper.jpg

sxhkd &
slstatus &

exec dwm
