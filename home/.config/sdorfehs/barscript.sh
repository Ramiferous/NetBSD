#!/bin/sh

set -eu
while :
do
	# Uptime
	UP="$(uptime | awk -F, '{sub(".*up ",x,$1);print $1}' | sed -e 's/^[ \t]*//')"

	# Packages
	PKGS=$(pkg_info | wc -l)
	PKGS=${PKGS##* }		# strip leading spaces

	# Volume
	VOL=$(mixerctl -n outputs.master)
	VOL=${VOL%,*}			# strip other channel
	VOL=$(( (VOL * 100) / 254 ))
	MUTE=$(mixerctl -n outputs.master3.mute)
	if [ $MUTE = on ]
	then	MUTE="[^fg(red)shhh^fg()]"
	else	MUTE=""
	fi

	# Battery
	O=$(envstat -s 'acpibat0:charge,acpibat0:charging,acpibat0:discharge rate')
	BAT_PERC=${O#*(}		# strip from beginning to '('
	BAT_PERC=${BAT_PERC%%.*}	# strip from first '.' to end
	BAT_DIS=${O#*discharge rate:}	# strip ^ -> 'discharge rate:' (incl.)
	BAT_DIS=${BAT_DIS%charg*}	# snag discharge rate, or "N/A"
	BAT_DIS=${BAT_DIS%W*}		#  " (contd.)
	BAT_STATE=${O#*charging:}	# snag charge state

	if [ $BAT_DIS != N/A ]		# note: do not quote any of these
	then	STATE="^fg(red)-^fg()"	# discharging
	elif [ $BAT_STATE = TRUE ]
	then	STATE="^fg(green)+^fg()" # charging
	else	STATE="^fg(green)=^fg()" # topped-up
	fi

	# Date
	D=$(date '+%a %d %b %I:%M')

	# Weather
	WTTR=$(cat $HOME/.scripts/weather.txt)

	# Moon phase
	MOON="$(cat $HOME/.scripts/moon.txt)"

	# Print
	echo "$D ~ $WTTR [$PKGS#][$VOL%]$MUTE[$STATE$BAT_PERC%]" > ~/.config/sdorfehs/bar

	sleep 1
done
