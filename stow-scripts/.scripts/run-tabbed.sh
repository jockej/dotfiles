#!/bin/sh

XIDFILE="/tmp/.tabbed.xid"

start_tabbed()
{
  tabbed -c -d -n Tabbed > "$XIDFILE" 2> /dev/null
}

if [ ! -r "$XIDFILE" ]; then
  start_tabbed
else
  # If the file $XIDFILE exists, check if there is a window with that id
  xprop -id `cat "$XIDFILE` &> /dev/null
  if [ $? -gt 0 ]; then
    # There is no window with this id
    start_tabbed
  else
    # If there was already a window, return 1
    exit 1
  fi
fi
exit 0
