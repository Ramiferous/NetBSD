#!/bin/sh
#
# ~/.config/spectrwm/.baraction.sh

## Echo battery status at regular intevals
while :; do
# Battery Percentage (two decimal places)
    #BAT_PERC="$(envstat -s acpibat0:charge | awk 'FNR==3 {print $6}' | tr -d '()')"
# Uncomment the following line to remove the decimal place
    BAT_PERC="$(envstat -s acpibat0:charge | tail -1 | sed -e 's,.*(\([ ]*[0-9]*\)\..*,\1,g')"
    
# Battery Charging State
    BAT_STATE="$(envstat -d acpibat0 | awk 'FNR==10 {print $2}')"

# State detection
if [ "${BAT_STATE}" = "TRUE" ]; then
	STATE='Charging'
else
	STATE='Discharging'
fi

# Master Volume
    VOL="$(mixerctl outputs.master | sed -e 's|.*,||g')" # | expr \( $VOL \* 100 \) / 254)"
    LEVEL="$name $(expr \( $VOL \* 100 \) / 254)"
    # MUTE_STATE=$(amixer scontents | awk 'NR==5 {print $6}')

# Print Variables
    echo "$STATE $BAT_PERC% | Vol$LEVEL% |"
    sleep 1
done

exit 0
