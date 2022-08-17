if status is-interactive
    
    # Usage: config status; config add; config commit; config push
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    # STARSHIP COMMAND PROMPT
    starship init fish | source
    # similar to neofetch --> display system info
    macchina
end

    # CLI tool to redo spelling errors in commands
    thefuck --alias | source 
    thefuck --alias oops | source 
    # set -x THEFUCK_OVERRIDDEN_ALIASES '"add .",branch,commit,"log --oneline -n 15",checkout,status,"pull --rebase",restore'

# ZSH inspired
# Taken from the tmux plugin
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
# Commands to run in interactive sessions can go here
navi widget fish | source
# https://dev.to/manan30/what-is-the-best-zshrc-config-you-have-seen-14id
# Use - to go back to previous directory
# alias -='cd -'
# Keybindings
# autoload -U up-line-or-beginning-search
# autoload -U down-line-or-beginning-search
# [Space] - do history expansion
# bindkey ' ' magic-space
# start typing + [Up-Arrow] - fuzzy find history forward
# bindkey 'terminfo[kcuu1]}' up-line-or-beginning-search
# start typing + [Down-Arrow] - fuzzy find history backward
# bindkey 'terminfo[kcud1]}' down-line-or-beginning-search

