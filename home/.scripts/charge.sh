#!/bin/sh

battery="$(envstat -d acpibat0 | awk 'FNR == 10 {print $2}')"

if [ "${battery}" = "TRUE" ]; then
    state='Charging'
else
    state='Discharging'
fi

charge="$(envstat -s acpibat0:charge | tail -1 | sed -e 's,.*(\([ ]*[0-9]*\)\..*,\1,g')%"

cat <<EOF 
${charge} ${state}
EOF
