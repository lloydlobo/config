if status is-interactive
    # Commands to run in interactive sessions can go here
    # navi widget fish | source
    
    alias config='/usr/bin/git --git-dir=/home/ll/.cfg/ --work-tree=/home/ll'
    
    # STARSHIP COMMAND PROMPT
    starship init fish | source

    # similar to neofetch --> display system info
    macchina
end
