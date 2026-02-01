#!/usr/bin/sh

GetMode ()
{
  echo $(cat /sys/devices/system/cpu/cpu10/cpufreq/scaling_governor)
}

SetMode(){
  mode=$1
  currmode=$(GetMode)
  if [ mode != currmode ]
  then
    i=0;
    cpu="/sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor"
    while [ -f $cpu ]; do
      echo $mode > $cpu 
      i=$(($i+1))
      cpu="/sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor"
    done
    
  fi
}

if [ $USER != "root" ]; then
  echo "user not root! quitting" 
  exit 1
fi

if [ $1 = "powersave" ] || [ $1 = "performance" ]
then
  SetMode $1
  echo "mode set to -> "$(GetMode)
  exit 0
else
  echo "no valid argument was given"
  exit 1
fi
