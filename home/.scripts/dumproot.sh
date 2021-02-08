#!/bin/sh
DIR=$HOME/Pictures/dumps
sleep 5; xwd -silent -root | xwdtopnm | pnmtopng > $DIR/"$(date +"root.%d-%m-%Y.%H:%M")".png
