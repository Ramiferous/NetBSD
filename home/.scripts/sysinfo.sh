#! /usr/bin/env bash
#
# Code from ufetch & screenfetch, modified to suit my NetBSD system

# Info
HOSTNAME=`uname -n`
ROOT=`df -h | grep wd0a | awk '{print "Size: "$2"  Used: "$3"  Free: "$4;}' | tr -d '\n'`
MACHINE=`sysctl -n machdep.dmi.system-version`
OS=`uname -sm`
KERNEL=`uname -v | awk '{print $2,$6,$7,$10}'`
CPU=`cat /proc/cpuinfo | grep 'model name' | uniq | sed 's/^.*: //;s/(R)//;s/(TM)//;s/CPU //'`
GPU=`glxinfo 2> /dev/null | awk '/OpenGL renderer string/ { sub(/OpenGL renderer string: /,""); print }' | sed 's/(R)//'`
SHELL=`basename "$SHELL"`
UPTIME=$(uptime | awk -F, '{sub(".*up ",x,$1);print $1}' | sed -e 's/^[ \t]*//')
PKGS=`pkg_info | wc -l | sed -e 's/^[ \t]*//'`
SWAP=`free -m | tail -n 1 | awk '{print $3" MB";}'`
TOTALMEM=`free -m | grep Mem | awk '{print $2" MB";}'`
MEMUSED=`free -m | grep Mem | awk '{print $3" MB";}'`
LOAD1=`cat /proc/loadavg | awk {'print $1'}`
LOAD5=`cat /proc/loadavg | awk {'print $2'}`
LOAD15=`cat /proc/loadavg | awk {'print $3'}`
VOLUME=$(mixerctl outputs.master | sed -e 's|.*,||g')
LEVEL=$name$(expr \( $VOLUME \* 100 \) / 254)
BACKLIGHT=$(intel_backlight | awk '{print $4}')
RESOLUTION=$(xdpyinfo | awk '/^ +dimensions/ {print $2}')
BATTERY=$(envstat -s acpibat0:charge | tail -1 | sed -e 's,.*(\([ ]*[0-9]*\)\..*,\1,g')%
CHARGE=$(envstat -d acpibat0 | awk 'FNR == 10 {print $2}')
if [ "${CHARGE}" = "TRUE" ]; then
    STATE='Charging'
else
    STATE='Discharging'
fi

## UI DETECTION

if [ -n "${DE}" ]; then
    UI="${DE}"
    UITYPE='DE'
elif [ -n "${WM}" ]; then
    UI="${WM}"
    UITYPE='WM'
elif [ -n "${XDG_CURRENT_DESKTOP}" ]; then
    UI="${XDG_CURRENT_DESKTOP}"
    UITYPE='DE'
elif [ -n "${DESKTOP_SESSION}" ]; then
    UI="${DESKTOP_SESSION}"
    UITYPE='DE'
elif [ -f "${HOME}/.xinitrc" ]; then
    UI="$(tail -n 1 "${HOME}/.xinitrc" | cut -d ' ' -f 2)"
    UITYPE='WM'
elif [ -f "${HOME}/.xsession" ]; then
    UI="$(tail -n 1 "${HOME}/.xsession" | cut -d ' ' -f 2)"
    UITYPE='WM'
else
    UI='unknown'
    UITYPE='UI'
fi

## COLOR BAR
COL=$(
        printf ''
    for i in 1 2 3 4 5 6; do
        printf '\033[9%sm▅▅' "$i"
    done
    printf '\033[0m\n'
)

# Define Colours
if [ -x `command -v tput` ]; then
    bold=`tput bold`
    black=`tput setaf 0`
    red=`tput setaf 1`
    green=`tput setaf 2`
    yellow=`tput setaf 3`
    blue=`tput setaf 4`
    magenta=`tput setaf 5`
    cyan=`tput setaf 6`
    white=`tput setaf 7`
    reset=`tput sgr0`
fi

bl="${reset}${bold}${blue}"
wt="${reset}${white}"
yl="${reset}${yellow}"
rd="${reset}${red}"
mg="${reset}${magenta}"
bk="${reset}${black}"
gr="${reset}${green}"
cy="${reset}${cyan}"

echo $""
echo $"${wt}                                       ✭ SYSTEM INFORMATION ✭"
echo $"${wt}                         ══════════════════════════════════════════════════"
echo $"${wt}                         ➭ ${yl}Machine........:" $MACHINE
echo $"${wt}        _..._            ➭ ${yl}OS.............:" $OS
echo $"${wt}      .'     '.      _   ➭ ${yl}Kernel.........:" $KERNEL
echo $"${wt}     /    .----\   _/ \  ➭ ${yl}Hostname.......:" $HOSTNAME
echo $"${wt}   .-|   /:.   |  |   |  ➭ ${yl}Uptime.........:" $UPTIME
echo $"${wt}   |  \  |:.   /.-'-./   ➭ ${yl}Shell..........:" $SHELL
echo $"${wt}   | .-'-;:__.'    =/    ➭ ${yl}Packages.......:" $PKGS
echo $"${wt}   .'=  *=|${bl}NASA${wt} _.='     ➭ ${yl}$UITYPE.............:" $UI
echo $"${wt}  /  _ .  |    ;         ➭ ${yl}GPU............:" $GPU
echo $"${wt} ;-.-'|    \   |         ➭ ${yl}Resolution.....:" $RESOLUTION
echo $"${wt}/   | \    _\  _\        ➭ ${yl}CPU............:" $CPU
echo $"${wt}\__/'._;.  ==' ==\       ➭ ${yl}CPU usage......:" $LOAD1, $LOAD5, $LOAD15 '(1, 5, 15 min)'
echo $"${wt}         \    \   |      ➭ ${yl}Memory used....:" $MEMUSED / $TOTALMEM
echo $"${wt}         /    /   /      ➭ ${yl}Swap in use....:" $SWAP
echo $"${wt}         /-._/-._/       ➭ ${yl}Volume.........:" $LEVEL%
echo $"${wt}         \    \  \       ➭ ${yl}Battery........:" $BATTERY $STATE
echo $"${wt}          '-._/._/       ➭ ${yl}Backlight......:" $BACKLIGHT
echo $"${wt}                         ➭ ${yl}Colours........:" $COL
echo $"${wt}                         ══════════════════════════════════════════════════"
echo $"${wt}"
