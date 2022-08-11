#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias config='/usr/bin/git --git-dir=/home/ll/.cfg/ --work-tree=/home/ll'
# eval "$(navi widget bash)"
neofetch
# macchina
