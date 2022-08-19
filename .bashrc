#
# ~/.bashrc
#

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# Dotfiles in ~/.cfg at github.com/username/config --> bare repository
# $HOME is the work-tree # https://wiki.archlinux.org/title/Dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# bash-complete-alias
# complete -F _complete_alias config

# Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

# Command prompt
eval "$(starship init bash)"
# eval "$(navi widget bash)"
eval "$(zoxide init bash)"

# Import colorscheme from 'wal' asynchronously & Run the process in the background.  
# ( ) # Hide shell job control messages. # Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)
# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# NEOFETCH MACCHINA SYS INFO
# neofetch
macchina

#
# FIN
#

# CLI tool to redo spelling errors in commands
#eval "$(thefuck --alias)"
#eval "$(thefuck --alias oops)"

