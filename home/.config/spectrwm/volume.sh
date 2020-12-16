#!/bin/sh
if [[ "$1" == "output" ]]
then
 amixer set Master $2 #2>&1 > /dev/null
elif [[ "$1" == "input" ]]
then
 amixer set Capture $2 #2>&1 > /dev/null
fi
pkill -10 baraction3.sh
