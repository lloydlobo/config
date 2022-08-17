#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log
# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log

polybar i3-bar 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar bar2 2>&1 | tee -a /tmp/polybar2.log & disown
echo "Bars launched"

# https://gitlab.com/dwt1/dotfiles/-/blob/master/.config/polybar/launch.sh
# # Wait until the processes have been shut down
# while pgrep -u $UID -x polybar >/dev/null; do : ; done
# for m in $(polybar --list-monitors | cut -d":" -f1); do
# 	WIRELESS=$(ls /sys/class/net/ | grep ^wl | awk 'NR==1{print $1}') MONITOR=$m polybar --reload mainbar-i3 &
# done
# echo "Bars launched..."
