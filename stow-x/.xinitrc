#!/bin/sh

xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr
SYS=`uname`
if [ "$SYS" == "Linux" ]; then
  feh --bg-scale ~/Arch_Linux_Wallpaper.jpg
elif [ "$SYS" == "OpenBSD" ]; then
  feh --bg-scale ~/OpenBSD_Wallpaper.jpg
elif [ "$SYS" == "FreeBSD" ]; then
  feh --bg-scale ~/FreeBSD_Wallpaper.jpg
fi
urxvtd -q -f -o
setxkbmap -option "" -layout "us,se" -option ctrl:swapcaps
killall pwld
pwld -l us,se -d
i3
