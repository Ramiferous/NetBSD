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

xrdb -merge ~/.Xresources && setxkbmap us

xautolock -time 5 -locker slock &	# lock screen
xset s off				# disable saver (using slock)
xset b off				# mute bell
xset +dpms				# powersaving
xset dpms 1200 1500 1800		# screen blanking
xset r rate 200 50			# faster keypress
xset m 55/20 4				# mouse acceleration
xsetroot -cursor_name gumby		# stupid cursor
xsetroot -solid "#84998F"		# set wallpaper
sh /home/dave/.scripts/weather.sh &	# get weather for bar
intel_backlight 20			# set brightness
#sleep 2; ubar | unibar uni &		# start unibar
#feh --bg-scale "/home/${USER}/Pictures/walls/tokyo.jpg"

exec sdorfehs
