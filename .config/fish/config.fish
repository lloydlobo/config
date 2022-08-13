if status is-interactive
    # Commands to run in interactive sessions can go here
    # navi widget fish | source
    
    alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    
    # STARSHIP COMMAND PROMPT
    starship init fish | source

    # similar to neofetch --> display system info
    macchina
end

# ZSH inspired

# Taken from the tmux plugin
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'

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

