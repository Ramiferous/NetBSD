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

xset b off & #& feh --bg-fill "/home/${USER}/Pictures/walls/cloudmoon.jpg"

hashwall -f '#4E3034' -b '#2F1D20' -s 12 &   #burgandy
#hashwall -f '#2b4507' -b '#121d03' -s 12 &   #olive green
#hsetroot -solid '#362124' &
#xsetroot -bg \#362124 -mod 2 2

sleep 3 && skippy-xd --start-daemon &

sleep 2 && redshift -c ~/.config/redshift/redshift.conf &

sleep 1 && picom &

exec spectrwm
