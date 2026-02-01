#!/usr/bin/sh

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
        notify-send "Plugged In" "Setting CPU governer to Performance" -e -t 1500
        routine-client Powersaveoff
      fi
    else
      if [ $state != "powersave" ]
      then
        notify-send "Plugged Out" "Setting CPU governer to Powersave" -e -t 1500
        routine-client Powersaveon
      fi
    fi
    sleep 5
done
