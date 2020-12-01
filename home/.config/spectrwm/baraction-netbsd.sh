#!/bin/sh

Volume() {
    VolInf="$(mixerctl outputs.master | sed -e 's|.*,||g')"
    echo "$name $(expr \( $VolInf \* 100 \) / 254)%"
}

#BcklInf() {
#    echo "Bckl $(xbacklight -get | awk '{print int($1+0.5)}' | sed 's/\..*//')%"
#}

Battery() {
    Capacity="$(envstat -s acpibat0:charge | tail -1 | sed -e 's,.*(\([ ]*[0-9]*\)\..*,\1,g')%"
    State="$(envstat -d acpibat0 | awk 'FNR == 10 {print $2}')"

    if [ "${State}" = "TRUE" ]; then
        echo '' ${Capacity}
    else
        echo '' ${Capacity}
    fi
}

Weather() {
    echo "$(cat /home/$USER/.config/spectrwm/weather.txt)"
}

Pkgs() {
    echo "$(pkg_info | wc -l | sed -e 's/^[ \t]*//')"
}

Uptime() {
    echo "$(uptime | awk -F, '{sub(".*up ",x,$1);print $1}' | sed -e 's/^[ \t]*//')"
}

Update() {
    echo \
	"  $(Weather)     $(Uptime)     $(Pkgs)    $(Battery)   $(Volume)" &
    wait
}

trap true USR1

while :
do
    Update;
    sleep 2 &
    wait $!
done
