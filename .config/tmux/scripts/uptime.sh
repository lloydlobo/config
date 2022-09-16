#!/bin/bash
uptime | rev | cut -d":" -f1 | rev | sed s/,//g

# https://arcolinux.com/everything-you-need-to-know-about-tmux-status-bar/
# $ tmux set-option -ag status-right "#[fg=red,dim,bg=default]#(uptime | cut -f 4-5 -d ' ' | cut -f 1 -d ',') "
# set-option -ag status-right "#[fg=red,dim,bg=default]#(uptime | cut -f 4-5 -d ' ' | cut -f 1 -d ',') "
