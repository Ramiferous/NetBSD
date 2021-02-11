#!/bin/sh
#relies on curl
#recommend putting this script in a cron job that runs at least once a day.
curl -s wttr.in/-37.731665,144.995026?format='%C+%t\n' | sed 30q > ~/.config/sdorfehs/weather.txt
