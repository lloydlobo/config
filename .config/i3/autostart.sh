#!/bin/sh

# compositor
killall picom
while pqrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config ~/.config/picom/picom.conf --experimental-backends --vsync &

~/.config/polybar/launch.sh &

# Remaps the menu button (Alt_R and Control_R to Super)
xmodmap ~/.Xmodmap &
xrdb ~/.Xresources &

# Fit the VM Virtual Machine display to fullscreen
xrandr -s 1920x1080 &

# background
~/.fehbg &
# clipmenud &
# dunst &
autotiling &
# pcloud &


setxkbmap -option ctrl:nocaps &
#setxkbmap -layout colemak &

# [ ~ -s ~/.config/mpd/pid ] && mpd &
# /usr/lib/polkit-1/polkitd &


# sxhkd
# sxhkd -x ~/.config/i3/sxhkd/sxhkdrc &
