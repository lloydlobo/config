#
# ~/.bashrc
#

### EXPORT
export TERM="xterm-256color"                      # getting proper colors
export HISTCONTROL=ignoredups:erasedups           # no duplicate entries
# export ALTERNATE_EDITOR=""                        # setting for emacsclient
# export EDITOR="emacsclient -t -a ''"              # $EDITOR use Emacs in terminal
# export VISUAL="emacsclient -c -a emacs"           # $VISUAL use Emacs in GUI mode

# cat ~/Documents/principles.md

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="HOME/.cargo/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin

macchina
okejoke random

# Dotfiles in ~/.cfg at github.com/username/config --> bare repository
# $HOME is the work-tree # https://wiki.archlinux.org/title/Dotfiles
# bare git repo alias for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias lg="lazygit"
alias dlg="lazygit --git-dir=$HOME/.cfg --work-tree=$HOME"
alias emacs="emacsclient -c -a 'emacs'"
alias lvim="$HOME/.local/bin/lvim"

# alias utility
alias pmem="/usr/bin/procs --sortd mem"

### SET MANPAGER
### Uncomment only one of these!
### "bat" as manpager
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
### "vim" as manpager
# export MANPAGER='/bin/bash -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
### "nvim" as manpager
# export MANPAGER="nvim -c 'set ft=man' -"

### SET VI MODE 
### # Comment this line out to enable default emacs-like bindings 
set -o vi
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

### PROMPT
# This is commented out if using starship prompt
# PS1='[\u@\h \W]\$ '

# ### PATH
# if [ -d "$HOME/.bin" ] ;
#   then PATH="$HOME/.bin:$PATH"
# fi
#
# if [ -d "$HOME/.local/bin" ] ;
#   then PATH="$HOME/.local/bin:$PATH"
# fi
#
# if [ -d "$HOME/Applications" ] ;
#   then PATH="$HOME/Applications:$PATH"
# fi
#
# ### SETTING OTHER ENVIRONMENT VARIABLES
# if [ -z "$XDG_CONFIG_HOME" ] ; then
#     export XDG_CONFIG_HOME="$HOME/.config"
# fi
# if [ -z "$XDG_DATA_HOME" ] ; then
#     export XDG_DATA_HOME="$HOME/.local/share"
# fi
# if [ -z "$XDG_CACHE_HOME" ] ; then
#     export XDG_CACHE_HOME="$HOME/.cache"
# fi

# #############################################################################

# https://unix.stackexchange.com/questions/63098/mkdir-p-for-files
# mktouch your/path/file.txt
function mktouch() {
	mkdir -p "$(dirname "$1")" && touch "$1"
}

# Set sampler binary config.
alias sampler="sampler --config ~/.config/sampler/example.yml"
### CHANGE TITLE OF TERMINALS
# case ${TERM} in
#   xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|alacritty|st|konsole*)
#     PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
#         ;;
#   screen*)
#     PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
#     ;;
# esac

### SHOPT
shopt -s autocd # change to named directory
shopt -s cdspell # autocorrects cd misspellings
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob
shopt -s histappend # do not overwrite history
shopt -s expand_aliases # expand aliases
shopt -s checkwinsize # checks term size when bash regains control

#ignore upper and lowercase when TAB completion
bind "set completion-ignore-case on"

### ARCHIVE EXTRACTION
# usage: ex <file>
ex () {
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

### ALIASES ###

# root privileges
alias doas="doas --"

# navigation
up () {
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i=1;i<=limit;i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs.";
  fi
}

# vim and emacs
alias vim="nvim"
alias em="/usr/bin/emacs -nw"
alias emacs="emacsclient -c -a 'emacs'"
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'
# alias ls='ls --color=auto'

# pacman and yay
alias pacsyu='sudo pacman -Syu'                  # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'                # Refresh pkglist & update standard pkgs
alias yaysua='yay -Sua --noconfirm'              # update only AUR pkgs (yay)
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs (yay)
alias parsua='paru -Sua --noconfirm'             # update only AUR pkgs (paru)
alias parsyu='paru -Syu --noconfirm'             # update standard pkgs and AUR pkgs (paru)
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
alias rm='rm -i'

# adding flags
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias lynx='lynx -cfg=~/.lynx/lynx.cfg -lss=~/.lynx/lynx.lss -vikeys'
alias vifm='./.config/vifm/scripts/vifmrun'
alias ncmpcpp='ncmpcpp ncmpcpp_directory=$HOME/.config/ncmpcpp/'
alias mocp='mocp -M "$XDG_CONFIG_HOME"/moc -O MOCDir="$XDG_CONFIG_HOME"/moc'

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# Play audio files in current dir by type
alias playwav='deadbeef *.wav'
alias playogg='deadbeef *.ogg'
alias playmp3='deadbeef *.mp3'

# Play video files in current dir by type
alias playavi='vlc *.avi'
alias playmov='vlc *.mov'
alias playmp4='vlc *.mp4'

# termbin
alias tb="nc termbin.com 9999"

# the terminal rickroll
alias rr='curl -s -L https://raw.githubusercontent.com/keroserene/rickrollrc/master/roll.sh | bash'

# Unlock LBRY tips
alias tips='lbrynet txo spend --type=support --is_not_my_input --blocking'

### DTOS ###
# Copy/paste all content of /etc/dtos over to home folder. A backup of config is created. (Be careful running this!)
alias dtoscopy='[ -d ~/.config ] || mkdir ~/.config && cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S) && cp -rf /etc/dtos/* ~'
# Backup contents of /etc/dtos to a backup folder in $HOME.
alias dtosbackup='cp -Rf /etc/dtos ~/dtos-backup-$(date +%Y.%m.%d-%H.%M.%S)'

### RANDOM COLOR SCRIPT ###
# Get this script from my GitLab: gitlab.com/dwt1/shell-color-scripts
# Or install it from the Arch User Repository: shell-color-scripts
# colorscript random

### BASH INSULTER ###
# if [ -f /etc/bash.command-not-found ]; then
#     . /etc/bash.command-not-found
# fi

### SETTING THE STARSHIP PROMPT ###
eval "$(starship init bash)"
# eval "$(navi widget bash)"
eval "$(zoxide init bash)"
eval "$(fnm env --use-on-cd)"


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


# Load Angular CLI autocompletion.
source <(ng completion script)
