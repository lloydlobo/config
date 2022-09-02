# apps.. but better
alias g git
alias repl evcxr # A Rust REPL based on evcxr
alias ls=lsd
command -qv nvim && alias vim nvim
set -gx EDITOR nvim

# ls
alias ls "ls -p -G" # -p, --indicator-style=slash -G, --no-group
alias la "ls -A" # -A, --almost-all
alias ll "ls -l"
alias lt="ls --tree"
alias lla "ll -A"

# tmux
alias ta='tmux attach -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'

# https://github.com/matchai/dotfiles/blob/b6c6a701d0af8d145a8370288c00bb9f0648b5c2/.config/fish/alias.fish
# git
abbr -a gs  git status -sb
abbr -a ga  git add
abbr -a gc  git commit
abbr -a gcm git commit -m
abbr -a gca git commit --amend
abbr -a gcl git clone
abbr -a gco git checkout
abbr -a gp  git push
abbr -a gpl git pull
abbr -a gl  git l
abbr -a gd  git diff
abbr -a gds git diff --staged
abbr -a gr  git rebase -i HEAD~15
abbr -a gf  git fetch
abbr -a gfc git findcommit
abbr -a gfm git findmessage
abbr -a gco git checkout

# Usage: config status; config add; config commit; config push
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# config dotfiles
abbr -a ds  config status -s -b
abbr -a da  config add
abbr -a dc  config commit
abbr -a dcm config commit -m
abbr -a dp  config push
abbr -a dl  config l
abbr -a dd  config diff
abbr -a dds config diff --staged

# misc
alias reload="exec fish"
