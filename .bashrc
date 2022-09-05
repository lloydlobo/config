#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# cat ~/Documents/principles.md

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export PATH="$HOME/.emacs.d/bin:$PATH"

macchina

# Dotfiles in ~/.cfg at github.com/username/config --> bare repository
# $HOME is the work-tree # https://wiki.archlinux.org/title/Dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias emacs="emacsclient -c -a 'emacs'"

### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

### SET VI MODE 
### # Comment this line out to enable default emacs-like bindings 
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# Command prompt
#set-option -g default-terminal "screen-256color"
eval "$(starship init bash)"
# eval "$(navi widget bash)"
eval "$(zoxide init bash)"
eval "$(fnm env --use-on-cd)"

# https://unix.stackexchange.com/questions/63098/mkdir-p-for-files
# mktouch your/path/file.txt
function mktouch() {
	mkdir -p "$(dirname "$1")" && touch "$1"
}
# #############################################################################
# bash-complete-alias
# complete -F _complete_alias config

# Import colorscheme from 'wal' asynchronously & Run the process in the background.  
# ( ) # Hide shell job control messages. # Not supported in the "fish" shell.
# (cat ~/.cache/wal/sequences &)
# Alternative (blocks terminal for 0-3ms)
# cat ~/.cache/wal/sequences
# To add support for TTYs this line can be optionally added.
# source ~/.cache/wal/colors-tty.sh

# CLI tool to redo spelling errors in commands
#eval "$(thefuck --alias)"
#eval "$(thefuck --alias oops)"

