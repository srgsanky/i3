#!/bin/bash

if type "xrandr"; then
    # Turn off all external displays
    for m in $(xrandr --listactivemonitors | grep DP- | grep -v eDP- | cut -f 6 -d ' ')
    do
        xrandr --output $m --off
    done

    # Use built-in laptop display as the primary display
    xrandr --output eDP-1 --auto --primary
fi

