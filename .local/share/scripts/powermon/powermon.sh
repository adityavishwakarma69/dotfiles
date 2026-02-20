#!/usr/bin/sh

reduce_refresh_rate () {
  if [ $XDG_CURRENT_DESKTOP = 'niri' ]
  then
    echo "reducing refresh rate for niri"
    niri msg output "eDP-1" mode "1920x1080@60.012"
  fi
}

increase_refresh_rate () {
  if [ $XDG_CURRENT_DESKTOP = 'niri' ]
  then
    echo "increasing refresh rate for niri"
    niri msg output "eDP-1" mode "1920x1080@120"
  fi
}

trap "echo Exiting; exit" INT TERM

notify-send "Monitoring Power ⚡" -e -t 3000

while true
do
    online=$(cat /sys/class/power_supply/AC/online)
    state=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor)
    if [ $online = "1" ]
    then
      if [ $state != "performance" ]
      then
        increase_refresh_rate
        notify-send "Plugged In" "Setting CPU governer to Performance" -e -t 1500
        routine-client Powersaveoff
      fi
    else
      if [ $state != "powersave" ]
      then
        reduce_refresh_rate
        notify-send "Plugged Out" "Setting CPU governer to Powersave" -e -t 1500
        routine-client Powersaveon
      fi
    fi
    sleep 5
done
