#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload mainbar-i3 -c ~/.config/polybar/config &
  done
else
polybar --reload mainbar-i3 -c ~/.config/polybar/config &
fi
