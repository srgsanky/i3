#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

POLYBAR_NAME=example
POLYBAR_CONFIG_FILE=~/.config/i3/polybar/config.ini


echo "---" | tee -a /tmp/polybar.log
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d " " -f1)
    do
        MONITOR=$m polybar --reload -c $POLYBAR_CONFIG_FILE $POLYBAR_NAME | tee -a /tmp/polybar.log & disown
    done
else
    polybar --reload -c $POLYBAR_CONFIG_FILE $POLYBAR_NAME | tee -a /tmp/polybar.log & disown
fi
echo "Polybars launched"

