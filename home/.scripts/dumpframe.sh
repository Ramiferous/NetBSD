#!/bin/sh
DIR=$HOME/Pictures/dumps
ID=$(xprop -root 32x '\t$0' _NET_ACTIVE_WINDOW | awk {'print $2'})
xwd -silent -id $ID | xwdtopnm | pnmtopng > $DIR/"$(echo frame.$(date +'%d-%m-%Y.%H:%M'))".png
