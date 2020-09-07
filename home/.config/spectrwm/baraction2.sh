#!/bin/sh

Volume() {
    VolInf="$(mixerctl outputs.master | sed -e 's|.*,||g')"
    echo "Vol $name $(expr \( $VolInf \* 100 \) / 254)%"
}

#BcklInf() {
#    echo "Bckl $(xbacklight -get | awk '{print int($1+0.5)}' | sed 's/\..*//')%"
#}

Battery() {
    Capacity="$(envstat -s acpibat0:charge | tail -1 | sed -e 's,.*(\([ ]*[0-9]*\)\..*,\1,g')%"
    State="$(envstat -d acpibat0 | awk 'FNR == 10 {print $2}')"

    if [ "${State}" = "TRUE" ]; then
        echo 'Charging' ${Capacity}
    else
        echo 'Discharging' ${Capacity}
    fi
}

Weather() {
    echo "$(curl -s wttr.in/-37.731665,144.995026?format='%C+%t\n')"
}

Pkgs() {
    echo "$(pkg_info | wc -l | sed -e 's/^[ \t]*//') pkgs"
}

Update() {
    echo \
	"$(Weather) | $(Pkgs) | $(Battery) | $(Volume)" &
    wait
}

trap true USR1

while :
do
    Update;
    sleep 60 &
    wait $!
done
