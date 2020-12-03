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

tiramisu -j | jq --raw-output --unbuffered '.summary + "\t" + .body' > $XNOTIFY_FIFO &

xset b off & 
xset r rate 200 50 &
feh --bg-scale "/home/${USER}/Pictures/walls/stout.jpg"
skippy-xd --start-daemon &
ubar | unibar uni &
/$HOME/.config/spectrwm/./weather.sh &
picom &
sleep 2 && redshift -c ~/.config/redshift/redshift.conf &

exec frankenwm
