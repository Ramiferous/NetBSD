#!/bin/sh

MUTE=$(mixerctl outputs.master3.mute | sed 's/^outputs.master3.mute=//')

if [ "${MUTE}" = "off" ]; then
    RUN='mixerctl -w outputs.master3.mute=on'
else
    RUN='mixerctl -w outputs.master3.mute=off'
fi

exec "$RUN"
