#!/bin/sh

XIDFILE="/tmp/.tabbed.xid"

zathura -e `cat $XIDFILE`
