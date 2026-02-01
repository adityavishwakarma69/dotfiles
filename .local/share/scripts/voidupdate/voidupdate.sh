#!/usr/bin/sh

test_req () {
  which xbps-install >/dev/null
  if [ $? != '0' ]
  then
    echo "failed to find xbps" >&2
  fi
  which flatpak >/dev/null
  if [ $? != '0' ]
  then
    echo "failed to find flatpak" >&2
  fi
}

get_xbps () {
  updates=$(xbps-install --memory-sync --dry-run --update)
  if [ -z "$updates" ]
  then
    notify-send "XBPS" "no updates found"
  else
    echo "$updates"
    flag=$(notify-send "XBPS" "updates were found proceed?" -A Yes -A No)
    [ -z $flag ] || if [ $flag = "0" ]
    then
      pkexec xbps-install -Syu &>/dev/null
    fi
  fi
}

get_flatpak () {
  updates=$(flatpak remote-ls --updates)
  if [ -z "$updates" ]
  then
    notify-send "Flatpak" "no updates found"
  else
    echo "$updates"
    flag=$(notify-send "Flatpak" "updates were found proceed?" -A Yes -A No)
    [ -z $flag ] || if [ $flag = "0" ]
    then
      pkexec flatpak update -y &>/dev/null
    fi
  fi
}

test_req
get_flatpak
get_xbps
