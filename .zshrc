
# The following lines were added by compinstall

# cat ~/Documents/principles.md

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=** l:|=*'
zstyle :compinstall filename '/home/ll/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep extendedglob nomatch notify
bindkey -v
# End of lines configured by zsh-newuser-install

# dotfiles .cfg/ alias
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# eval "$(navi widget bash)"
# STARSHIP COMMAND PROMPT
eval "$(starship init zsh)"

# ZOXIDE | cd replacement
eval "$(zoxide init zsh)"

# fast Node version Manager
eval "$(fnm env --use-on-cd)"


# Run neofetch or at the end
macchina

