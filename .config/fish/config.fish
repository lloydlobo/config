# Load alias
source ~/.config/fish/alias.fish

# cat ~/Documents/principles.md
set fish_greeting ""
#set -gx TERM xterm-256color

if status is-interactive
    # neofetch replacement --> display system info
    macchina

end

# PATH Global Variables
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH
set -gx PATH /usr/local/go/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
    status --is-command-substitution; and return
    if test -f .nvmrc; and test -r .nvmrc
        nvm use
    else
    end
end

# Load all saved ssh keys
# /usr/bin/ssh-add -A ^/dev/null

# Credits: https://github.com/craftzdog/dotfiles-public/blob/master/.config/fish/config.fish
# theme
#set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# Fish syntax highlighting
set -g fish_color_autosuggestion 555 brblack
set -g fish_color_cancel -r
set -g fish_color_command --bold
set -g fish_color_comment red
set -g fish_color_cwd green
set -g fish_color_cwd_root red
set -g fish_color_end brmagenta
set -g fish_color_error brred
set -g fish_color_escape bryellow --bold
set -g fish_color_history_current --bold
set -g fish_color_host normal
set -g fish_color_match --background=brblue
set -g fish_color_normal normal
set -g fish_color_operator bryellow
set -g fish_color_param cyan
set -g fish_color_quote yellow
set -g fish_color_redirection brblue
set -g fish_color_search_match bryellow '--background=brblack'
set -g fish_color_selection white --bold '--background=brblack'
set -g fish_color_user brgreen
set -g fish_color_valid_path --underline

# ZOXIDE | cd alternative
zoxide init fish | source

# Install Starship
starship init fish | source

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end

# ERROR: Cursor animation disabled when it runs. TODO: Traced to spinner.!!
# Get random jokes from API calls to icanhazdadjoke.com
okejoke random

# ##################################################
#                   EOF
# ##################################################
# Commands to run in interactive sessions can go here
# navi widget fish | source
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

# # CLI tool to redo spelling errors in comma    
# thefuck --alias | source 
# thefuck --alias oops | source 
# set -x THEFUCK_OVERRIDDEN_ALIASES '"add .",branch,commit,"log --oneline -n 15",checkout,status,"pull --rebase",restore'
