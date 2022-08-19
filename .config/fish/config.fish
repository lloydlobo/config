set fish_greeting ""
set -gx TERM xterm-256color

if status is-interactive
    # neofetch replacement --> display system info
    macchina
end
# Usage: config status; config add; config commit; config push
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# STARSHIP COMMAND PROMPT
starship init fish | source

# Credits: https://github.com/craftzdog/dotfiles-public/blob/master/.config/fish/config.fish
#
# aliases
#
alias ls "ls -p -G"                     # -p, --indicator-style=slash -G, --no-group
alias la "ls -A"                       # -A, --almost-all
alias ll "ls -l"
alias lla "ll -A"

# git
alias g git

# neovim
command -qv nvim && alias vim nvim

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

# tmux
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

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

