#!/bin/bash

step=5

if [[ $# -eq 1 ]]; then
  case $1 in
    "up")
      #amixer set Master $step+ unmute;;
      #sh -c "pactl set-sink-mute @DEFAULT_SINK@ false ; pactl set-sink-volume @DEFAULT_SINK@ +${step}%"
      sh -c "pactl set-sink-mute @DEFAULT_SINK@ false ; pactl set-sink-mute 0 false ; pulseaudio-ctl up"
      ;;
    "down")
      #amixer set Master $step- unmute;;
      #sh -c "pactl set-sink-mute @DEFAULT_SINK@ false ; pactl set-sink-volume @DEFAULT_SINK@ -${step}%"
      sh -c "pactl set-sink-mute @DEFAULT_SINK@ false ; pactl set-sink-mute 0 false ; pulseaudio-ctl down"
      ;;
    "toggle")
#      amixer set Master toggle
      sh -c "pactl set-sink-mute @DEFAULT_SINK@ toggle ; pactl set-sink-mute 0 toggle"
      ;;
    *)
      echo "Invalid option";;
  esac
fi
