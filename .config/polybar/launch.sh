#!/usr/bin/env bash

# https://github.com/folke/dot/blob/master/config/polybar/launch.sh

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
# polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

echo "Polybars killed..."

# Wal Color Generator
#python ~/.config/polybar/scripts/colors.py > ~/.config/polybar/colors.ini
#echo "Colors generated..."

# ## polybar -r -c ~/.config/polybar/config.ini main &
# ## 
# ## exit
# ## 
# ## # Launch bar1 and bar2
# ## polybar -r -c ~/.config/polybar/config.ini ws &
# ## polybar -r -c ~/.config/polybar/config.ini music &
# ## polybar -r -c ~/.config/polybar/config.ini tray &
# ## 
# ## mpid=
# ## 
# ## while true; do
# ##   # check whether the polybar is still running
# ##   kill -0 "$mpid" 2> /dev/null || mpid=
# ## 
# ##   if playerctl status 2> /dev/null; then
# ##     echo "[debug] music player running"
# ##     if [ -z "$mpid" ]; then
# ##       echo "[debug] starting music polybar"
# ##       polybar -r -c ~/.config/polybar/config.ini music &
# ##       mpid=$!
# ##     fi
# ##   else
# ##     echo "[debug] music player not running"
# ##     if [ -n "$mpid" ]; then
# ##       echo "[debug] killing music polybar"
# ##       kill "$mpid"
# ##       while kill -0 "$mpid" 2>/dev/null; do sleep 1; done
# ##     fi
# ##   fi
# ##   sleep 1
# ## done


# ###########################################################
# ###########################################################
# ###########################################################

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
