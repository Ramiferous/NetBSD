#!/bin/sh
#
# batstate
#
# Simple battery detection tool for NetBSD

# Define variables
charge_state="$(envstat -d acpibat0 | awk 'FNR == 10 {print $2}')"
bat_perc="$(envstat -d acpibat0 | awk 'FNR == 7 {print $6}' | tr -d '()')"

# State detection
if [ "${charge_state}" = "TRUE" ]; then
	Bat='charging'
else
	Bat='discharging'
fi

# Output
cat <<EOF
${Bat} ${bat_perc}
EOF
