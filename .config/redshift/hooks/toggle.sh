#!/bin/sh

# A simple script to handle these events can be written like this:
case $1 in
    period-changed)
        exec notify-send "Redshift" "Period changed to $3"
esac

# HOOKS
# Executables  (e.g.  scripts)  placed in folder ~/.config/redshift/hooks
# will be run when a certain event happens. The first  parameter  to  the
# script indicates the event and further parameters may indicate more de‐
# tails about the event. The event period-changed is indicated  when  the
# period  changes  (night,  daytime, transition). The second parameter is
# the old period and the third is the new period. The event is also  sig‐
# naled when Redshift starts up with the old period set to none. Any dot‐
# files in the folder are skipped.
