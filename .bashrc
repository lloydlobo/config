#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# eval "$(navi widget bash)"

# STARSHIP COMMAND PROMPT 
eval "$(starship init bash)"

# NEOFETCH MACCHINA SYS INFO
# neofetch
macchina
