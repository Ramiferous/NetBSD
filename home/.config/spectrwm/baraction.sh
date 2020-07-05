#!/bin/sh
#
# ~/.config/spectrwm/.baraction.sh

## Echo battery status at regular intevals
while :; do
    # Battery Percentage
    BAT_PERC="$(envstat -s acpibat0 | awk 'FNR==7 {print $6}' | tr -d '()')"

    # Battery Charging State
    BAT_STATE="$(envstat -d acpibat0 | awk 'FNR==10 {print $2}')"

# State detection
if [ "${BAT_STATE}" = "TRUE" ]; then
	Bat='charging'
else
	Bat='discharging'
fi

    # Master Volume
    # VOL=$(amixer scontents | awk 'NR==5 {print $4}')
    # MUTE_STATE=$(amixer scontents | awk 'NR==5 {print $6}')

    # Spotfiy Currently Playing Song and Artist
    #SPOT_INFO=$(python /home/isaac/.scripts/polybar-spotify/spotify_status.py -f '{artist}: {song}' -t 50)

    # Print Variables
    echo "$BAT_STATE $BAT_PERC |"
    sleep 30
done

exit 0
