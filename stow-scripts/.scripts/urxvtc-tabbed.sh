#!/bin/sh

XIDFILE="/tmp/.tabbed.xid"

urxvtc -embed `cat $XIDFILE`
