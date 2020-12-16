#!/bin/sh

trap 'update_audio_write' 10
trap 'update_battery_write' 12
trap 'update_network_write' 5
trap 'cleanup' 2

# Bettery
    BAT_PERC="$(envstat -s acpibat0:charge | tail -1 | sed -e 's,.*(\([ ]*[0-9]*\)\..*,\1,g')%"
    
    BAT_STATE="$(envstat -d acpibat0 | awk 'FNR == 10 {print $2}')"

if [ "${BAT_STATE}" = "TRUE" ]; then
	STATE='Charging'
else
	STATE='Discharging'
fi

# Backlight
#    BAKL="Bakl $(xbacklight -get | awk '{print int($1+0.5)}' | sed 's/\..*//')%"

# Network traffic
#    NETSTAT="$(netstat -I iwn0 -b -h | awk 'FNR == 2 {print $5,$6}')"

# Volume
    VOL="$(mixerctl outputs.master | sed -e 's|.*,||g')"
    LEVEL="Vol $name $(expr \( $VOL \* 100 \) / 254)%"

# Weather
    #set -g status-interval 60 
    WEATHER="$(curl -s wttr.in/-37.731665,144.995026?format='%C+%t\n')"

# Packages
    PKGS="$(pkg_info | wc -l | sed -e 's/^[ \t]*//') pkgs"

# Print Variables
    echo "$WEATHER | $PKGS | $STATE $BAT_PERC | $LEVEL"
    
update_all_write
while :;
do
 sleep 60&
 wait
done
