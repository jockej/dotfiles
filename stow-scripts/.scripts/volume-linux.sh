#!/bin/sh

case "$1" in
  "up")
    amixer -q set Master 2dB+ unmute
    ;;
  "down")
    amixer -q set Master 2dB- unmute
    ;;
  "mute")
    amixer -q set Master toggle
    ;;
  *)
    echo "Unrecognized argument!"
    exit 1
    ;;
esac
exit 0
