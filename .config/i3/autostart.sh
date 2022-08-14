#!/bin/sh
# $HOME/.config/i3/autostart.sh

# Fit the VM Virtual Machine display to fullscreen
xrandr -s 1920x1080 &

# compositor
killall picom
while pqrep -u $UID -x picom >/dev/null; do sleep 1; done
picom --config ~/.config/picom/picom.conf --experimental-backends --vsync &

~/.config/polybar/launch.sh &

# Remaps the menu button (Alt_R and Control_R to Super)
# xmodmap ~/.Xmodmap &
# xrdb ~/.Xresources &

# background
~/.fehbg &
# clipmenud &
# dunst &
autotiling &
# pcloud &


# setxkbmap -option ctrl:nocaps &
# setxkbmap -layout colemak &

# [ ~ -s ~/.config/mpd/pid ] && mpd &
# /usr/lib/polkit-1/polkitd &
/usr/lib/polkit-1/polkit-agent-helper-1 &

# sxhkd
# sxhkd -c ~/.config/i3/sxhkd/sxhkdrc &
