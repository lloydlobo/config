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

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# CLI tool to redo spelling errors in commands
eval "$(thefuck --alias)"
eval "$(thefuck --alias oops)"

# NEOFETCH MACCHINA SYS INFO
# neofetch
macchina

