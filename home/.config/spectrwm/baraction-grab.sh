#!/bin/bash

trap 'update_audio_write' 10
trap 'update_battery_write' 12
trap 'update_network_write' 5
trap 'cleanup' 2

function cleanup {
 pkill -9 baraction_timer_
 exit $?
}

function start_timers {
 /home/al/.inpath/baraction_timer_60.sh&
}

spacer="  "

function update_audio {
 audio_info="Speakers $(amixer get Master | awk '/Front Left:/{print $5}')${spacer}Mic $(amixer get Capture | awk '/Front Left:/{print $5}')"
}
function update_audio_write {
 update_audio
 write_buffer
}
function update_battery {
 bat_status=""
 battery_info="$(cat /sys/class/power_supply/BAT0/capacity)"
 bat_status=`cat /sys/class/power_supply/BAT0/status`
        if [[ $bat_status == "Discharging" ]]
        then
                bat_status="↓"
        elif [[ ${battery_info} != "100" ]]
        then
                bat_status="↑"
        else
                bat_status="✓"
        fi
 battery_info="Battery [${bat_status}${battery_info}%]"
}
function update_battery_write {
 update_battery
 write_buffer
}
function update_network {
 network_info=$(nmcli general status| awk '/abled/{print $1}')
 if [[ $network_info == "connected" ]]
 then
  network_info="Network [✓]"
 else
  network_info="Network [X]"
 fi
}
function update_network_write {
 update_network
 write_buffer
}
function update_all {
 update_network
 update_audio
 update_battery
}
function update_all_write {
 update_all
 write_buffer
}

function write_buffer {
 echo "${audio_info}${spacer}${network_info}${spacer}${battery_info}"
}

#/home/al/.inpath/baraction_timer_60.sh&
start_timers

update_all_write
while :;
do
 #kill $sleepid
 sleep 60&
 #sleepid=$!
 wait
done
