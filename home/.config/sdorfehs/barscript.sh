#!/bin/sh

while true; do
# Uptime
UP="$(uptime | awk -F, '{sub(".*up ",x,$1);print $1}' | sed -e 's/^[ \t]*//')"

# Packages
PKGS="$(pkg_info | wc -l | sed -e 's/^[ \t]*//')"

# Volume
VOL="$(mixerctl outputs.master | sed -e 's|.*,||g')"
LEV="$name$(expr \( $VOL \* 100 \) / 254)"

# Bettery
BAT_PERC="$(envstat -s acpibat0:charge | tail -1 | sed -e 's,.*(\([ ]*[0-9]*\)\..*,\1,g')%"

BAT_STATE="$(envstat -d acpibat0 | awk 'FNR == 10 {print $2}')"

if [ "${BAT_STATE}" = "TRUE" ]; then
    STATE='Charging'
else
    STATE='Discharging'
fi

# Date
D="$(date '+%a %b %d %I:%M')"

# WS
AWS="$(xprop -root '\t$0' _NET_CURRENT_DESKTOP | cut -f 2)"
WS="$name $(expr \( $AWS + 1 \))"
NWS="$(xprop -root '\t$0' _NET_NUMBER_OF_DESKTOPS | cut -f 2)"

# Weather
WTTR="$(cat /home/$USER/.scripts/weather.txt)"

# Moon phase
MOON="$(cat /home/$USER/.config/spectrwm/moon.txt)"

# Pipe
PIPE="|"

# Print
echo "$D ~ $WTTR | $STATE $BAT_PERC" > ~/.config/sdorfehs/bar

sleep 1
done
exit 0

