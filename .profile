#!/usr/bin/env bash

export EDITOR="$(if [[ -n $DISPLAY ]]; then echo 'gedit'; else echo 'vim'; fi)"
export VISUAL="nvim"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

export PATH=$PATH:/usr/local/go/bin

# alias utility
alias pmem="/usr/bin/procs --sortd mem"

