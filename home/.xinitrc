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

#XNOTIFY_FIFO="$HOME/.cache/xnotify$DISPLAY.fifo"
#             export XNOTIFY_FIFO
#             rm -f $XNOTIFY_FIFO
#             mkfifo $XNOTIFY_FIFO
#             xnotify <$XNOTIFY_FIFO 3<>$XNOTIFY_FIFO &

#tiramisu -j | jq --raw-output --unbuffered '.summary + "\t" + .body' > $XNOTIFY_FIFO &

#xset s off				# disable saver (using xlock)
xset b off				# mute bell
xset +dpms				# powersaving
xset dpms 1200 1500 1800		# screen blanking
xset r rate 200 50			# faster keypress
xset m 55/20 4				# mouse acceleration
xsetroot -cursor_name gumby		# stupid cursor
xsetroot -solid "#84998F"		# set wallpaper
#feh --bg-scale "/home/${USER}/Pictures/walls/tokyo.jpg"
sh /home/dave/.scripts/weather.sh &	# get weather for bar
intel_backlight 20			# set brightness
#sleep 2; ubar | unibar uni &		# start unibar

exec sdorfehs
