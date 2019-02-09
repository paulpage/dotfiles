#!/bin/sh
xrandr --query | grep "\bconnected\b" | awk '{print $1}'
