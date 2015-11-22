#!/bin/sh

xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr
feh --bg-scale ~/Arch_Linux_Wallpaper.jpg
urxvtd -q -f -o
setxkbmap -option "" -layout "us,se" -option ctrl:swapcaps
killall pwld
pwld -l us,se -d
i3

