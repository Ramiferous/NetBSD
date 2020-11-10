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

XNOTIFY_FIFO="$HOME/.cache/xnotify$DISPLAY.fifo"
             export XNOTIFY_FIFO
             rm -f $XNOTIFY_FIFO
             mkfifo $XNOTIFY_FIFO
             xnotify <$XNOTIFY_FIFO 3<>$XNOTIFY_FIFO &


xset b off & #& feh --bg-scale "/home/${USER}/Pictures/walls/glitch.png"

#hashwall -f '#4E3034' -b '#2F1D20' -s 12 &   #burgandy
hashwall -f '#494561' -b '#252831' -s 12 &   #blue
#hsetroot -solid '#252831' & #darkblue 
#'#362124' & #burgandy
#xsetroot -bg \#362124 -mod 2 2

sleep 5 && /$HOME/.config/spectrwm/./weather.sh &

sleep 3 && skippy-xd --start-daemon &

sleep 2 && redshift -c ~/.config/redshift/redshift.conf &

sleep 1 && picom &

exec spectrwm
