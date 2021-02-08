#!/bin/sh
DIR=$HOME/Pictures/dumps
sleep 5; xwd -silent -root | xwdtopnm | pnmtopng > $DIR/"$(echo root.$(date +'%d-%m-%Y.%H:%M'))".png
