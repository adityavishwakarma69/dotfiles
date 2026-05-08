#!/bin/sh

menu="wofi --show dmenu --hide-search --hide-scroll --lines 8"
passmenu="wofi --show dmenu --password --height 1 --hide-scroll --prompt Password"
notify-send "Wifi" "fetching networks please wait..."
ssids=$(nmcli -t -f SSID dev wifi list --rescan yes | sort -u | grep -v "^$") 
ssid=$(echo "$ssids"| $menu)
if [ -z "$ssid" ]
then
  echo "nothing selected"
  notify-send "Wifi" "nothing selected"
  exit 1
fi
ssidsaved=$(nmcli -t -f NAME connection show | grep -Fx "$ssid")
if [ -z "$ssidsaved" ]
then
  echo "not saved"
  pass=$(echo "enter password for $ssid " | $passmenu)
  echo $pass
  if [ -z "$pass" ]
  then
    notify-send "Wifi" "No password was provided"
    exit 1
  fi
  nmcli dev wifi connect "$ssid" password "$pass"
  if [ $? != '0' ]
  then
    notify-send "Wifi" "Couldn't connect to $ssid deleting connection"
    nmcli connection delete "$ssid"
    exit 1
  fi
  notify-send "Wifi" "Successfully connected to $ssid"
else
  nmcli d wifi connect "$ssid"
  notify-send "Wifi" "Successfully connected to $ssid"
fi
