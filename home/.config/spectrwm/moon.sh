#!/bin/sh                                                      
#relies on curl
#recommend putting this script in a cron job that runs at least once a day.
curl wttr.in/Melbourne?format=%m | sed 30q > ~/.config/spectrwm/moon.txt
