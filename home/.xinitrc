#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

mkdir /tmp/${USER}-runtime && chmod -R 0700 /tmp/${USER}-runtime

export XDG_RUNTIME_DIR=/tmp/${USER}-runtime

xrdb -merge ~/.Xresources && setxkbmap us

xset b off #&&
#xsetroot -solid darkgrey 
#xsetroot -mod 8 8 -bg midnightblue 
#xpmroot ~/Pictures/walls/tiles/zwEQ.xpm
feh --bg-fill "/home/${USER}/Pictures/walls/animegirls.png"

sleep 2 && redshift -c ~/.config/redshift/redshift.conf &

#sleep 1 && xearth -pos moon -rot galactic -mag 0.9 -nomarkers -starfreq 0.001 -gamma 0.9 &

exec spectrwm
