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

xset b off #&& feh --bg-fill "/home/${USER}/Wallpapers/wall.png"

exec spectrwm
