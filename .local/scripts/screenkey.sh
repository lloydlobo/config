#!/usr/bin/env bash

while [ : ]; do
    /usr/bin/screenkey --geometry 710x900+1712+551 -s medium --opacity 0.4
    pid=$!
    sleep 10
    kill $pid
done

# https://github.com/ThePrimeagen/.dotfiles/blob/master/bin/.local/scripts/screenkey
