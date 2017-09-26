#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shutdown
while pgrep -x polybar >/dev/null; do sleep 1; done

for monitor in $(xrandr -q | grep -e "\sconnected\s" | cut -d' ' -f1); do
  if [ "$(xrandr -q | grep -e "\sconnected\s" | grep $monitor | grep -c primary)" == "1" ]; then
    MONITOR=$monitor polybar mainwithtray &
  else
    MONITOR=$monitor polybar main &
  fi
done

echo "Bar launched..."
