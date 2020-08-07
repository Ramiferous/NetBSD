#!/bin/sh
#
# ~/.config/spectrwm/.baraction.sh

## Echo battery status at regular intevals
while :; do
# Uncomment the following line to remove the decimal place
    BAT_PERC="$(envstat -s acpibat0:charge | tail -1 | sed -e 's,.*(\([ ]*[0-9]*\)\..*,\1,g')"
    
# Battery Charging State
    BAT_STATE="$(envstat -d acpibat0 | awk 'FNR == 10 {print $2}')"

# State detection
if [ "${BAT_STATE}" = "TRUE" ]; then
	STATE='Charging'
else
	STATE='Discharging'
fi

# Network
    NETSTAT="$(netstat -I iwn0 -b -h | awk 'FNR == 2 {print $5,$6}')"

# Master Volume
    VOL="$(mixerctl outputs.master | sed -e 's|.*,||g')" # | expr \( $VOL \* 100 \) / 254)"
    LEVEL="$name $(expr \( $VOL \* 100 \) / 254)"
    # MUTE_STATE=$(amixer scontents | awk 'NR==5 {print $6}')

# Weather
    #set -g status-interval 60 
    WEATHER="$(curl -s wttr.in/-37.731678,144.995142?format='%C+%t\n')"

# Packages
    PKGS="$(pkg_info | wc -l | sed -e 's/^[ \t]*//')"

# Print Variables
    echo "$STATE $BAT_PERC% | Vol$LEVEL% | $NETSTAT | $PKGS | $WEATHER" 
    #echo "$WEATHER | $PKGS | $STATE $BAT_PERC% | Vol$LEVEL%"
    sleep 1
done

exit 0
