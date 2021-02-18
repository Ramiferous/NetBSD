#!/bin/sh

while true; do
# Uptime
UP="$(uptime | awk -F, '{sub(".*up ",x,$1);print $1}' | sed -e 's/^[ \t]*//')"

# Packages
PKGS="$(pkg_info | wc -l | sed -e 's/^[ \t]*//')"

# Volume
LEV="$(mixerctl outputs.master | sed -e 's|.*,||g')"
VOL="$((( $LEV ) * 100 / 254))"
MUTESTATE=$(mixerctl outputs.master3.mute | sed 's/^outputs.master3.mute=//')

if [ "${MUTESTATE}" = "on" ]; then
    MUTE='[^fg(red)shhh^fg()]'
else
    MUTE=''
fi

# Bettery
BAT_PERC="$(envstat -s acpibat0:charge | tail -1 | sed -e 's,.*(\([ ]*[0-9]*\)\..*,\1,g')%"

BAT_STATE="$(envstat -d acpibat0 | awk 'FNR == 10 {print $2}')"

if [ "${BAT_STATE}" = "TRUE" ]; then
    STATE='^fg(green)+^fg()'
else
    STATE='^fg(red)-^fg()'
fi

# Date
D="$(date '+%a %d %b %I:%M')"

# WS
AWS="$(xprop -root '\t$0' _NET_CURRENT_DESKTOP | cut -f 2)"
WS="$name $(expr \( $AWS + 1 \))"
NWS="$(xprop -root '\t$0' _NET_NUMBER_OF_DESKTOPS | cut -f 2)"

# Weather
WTTR="$(cat $HOME/.scripts/weather.txt)"

# Moon phase
MOON="$(cat $HOME/.scripts/moon.txt)"

# Pipe
PIPE="|"

# Print
echo "$D ^fg(#808080)~^fg() $WTTR [$PKGS#][$VOL%]$MUTE[$STATE$BAT_PERC]" > ~/.config/sdorfehs/bar

sleep 1
done
exit 0

