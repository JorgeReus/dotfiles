#!/bin/bash

SINK=$( pactl list short sinks | sed -e 's,^\([0-9][0-9]*\)[^0-9].*,\1,' | head -n 1 )
function safe_up () {
declare -r NOW=$( pactl list sinks | grep '^[[:space:]]Volume:' | head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,' )
if [ $NOW -lt 100 ]; then
  let aux=${NOW}+$1
  if [ $aux -gt 100 ]; then 
    pactl set-sink-volume $SINK 100% #increase sound volume
  else
    pactl set-sink-volume $SINK +$1% #increase sound volume
  fi
fi

}

case $1 in
     up)      
          safe_up $2
          ;;
     down)      
          pactl set-sink-volume $SINK "-${2}%" #decrease sound volume
          ;;

      toggle-mute)      
          pactl set-sink-mute $SINK toggle
          ;;
     *)
          printf "Usage: up|down|toggle-mute [increment]\n"
          ;;
esac

