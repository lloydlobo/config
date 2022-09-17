#!/usr/bin/env bash

# GUIDE for instal.sh dotfiles =>> https://github.com/bobwhitelock/dotfiles
# put `&` later when creating the final script

# Connect to github cli
gh auth login

#
# /config DOTFILES BARE REPO
#
# Import dotfiles from github for .config
echo ".cfg" >> .gitignore
git clone --bare git@github.com:lloydlobo/config.git $HOME/.cfg/
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no

#
# YAY
#
# Install yay 
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Setup yay
yay -Y --gendb
yay -Syu devel
yay -Y --devel --save

#
# snap
#
#First ensure snapd (package providing support for snap) is installed:
sudo dnf install snapd
#Then create a symbolic link to /var/lib/snapd/snap for /snap:
sudo ln -s /var/lib/snapd/snap /snap
#Then install Postman:
sudo snap install postman

# https://wiki.archlinux.org/title/Dotfiles
# Dotfiles bare config alias
yay bash-complete-alias
# bash-complete-alias dependency is bash-completion --> needed?
yay bash-completion
echo "complete -F _complete_alias config" >> .bashrc

# GHQ git local repo management
yay ghq

#
# RUSTUP | CARGO 
#
# Setup rustup cargo & update it
rustup default stable
rustup update
yay rust-analyzer               # Conflicts with rust-analyzer-nightly-bin

#
# i3 - PLUGINS
#
yay autotiling
yay -S i3-resurrect
yay xorg-xbacklight
yay light


##
# MUSIC | MPD | MPV | Media | Codec & Plugins
#
yay vlc
# Prerequisite mpc mpd ncmpcpp
sudo pacman -S timidity
yay ncspot  spicetify-cli spotify spotify-adblock-git spotify-tui

#
# NeoVim
#
yay lua-language-server
npm install -g typescript-language-server typescript
yay tree-sitter                 #  An incremental parsing system for programming tools 
yay prettierd                   #  prettier, as a daemon, for ludicrous formatting speed. 
yay eslint_d                    # Makes eslint the fastest linter on the planet.
yay stylua                      # Integrates with weleimp/stylua.nvim
sudo dnf install ShellCheck     # Provides shellcheck command for shell script anlaysis tool
sudo dnf install gcc-c++        # C++ support for GCC
sudo dnf install shc             # Shell script compiler
yay lazygit
sudo dnf copr enable atim/lazygit -y
sudo dnf install lazygit
#
# Distrubution - https://github.com/NTBBloodbath/doom-nvim
#
bash <(curl -s https://raw.githubusercontent.com/NTBBloodbath/doom-nvim/main/tools/install.sh)
#
# LunarVim
#
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh)
#
# NvChad
#
docker run -w /root -it --rm alpine:edge sh -uelic '
  apk add git nodejs neovim ripgrep alpine-sdk --update
  git clone https://github.com/NvChad/NvChad ~/.config/nvim
  nvim
'
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
#------------------------------------------------------------------------------------------------------#
# disk analyzer with ncurses interface
yay ncdu
cargo install --locked code-minimap
# lf aur/lf Ranger in Go-lang - Option 98 in yay.,. first in aur
yay lf
yay ripgrep
yay zoxide                      # A smarter cd command
yay bat
yay thefuck
sudo pacman -S ack
sudo pacman -S fd
sudo dnf install fd-find
sudo dnf install xclip # X11 clipboard manipulation tool, similar to `xsel`. Handles the X primary and secondary selections, plus the system clipboard (`Ctrl + C`/`Ctrl + V`).
sudo dnf install entr           # Run arbitrary commands when files change
sudo dnf install cronie         # Run arbitrary commands when files change
cronie                          # Cron daemon for executing programs at set times
cronie-anacron                  #   Utility for running regular jobs
crontabs                        # Root crontab files used to schedule the execution of programs

yay exa # 10 - ls replacement
# Simple X Hot Key Daemon.
yay sxhkd                       # You can remap individual keys with Xmodmap quite easily, but not arbitrary combinations of keys.


# VSCODE -- https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code

# BROWSER
# Qutebrowser & dependency
yay qutebrowser
yay python-adblock
yay asciidoc
sudo dnf install qt5-qtwebengine-freeworld   # RPM Fusion - codecs to play videos
# yay python-pygments # for :view-source syntax highlighting

# OTHER YAY
yay git-delta
yay macchina-bin
yay procs
yay hyperfine

# FONTS
yay nerd-fonts-complete         # aur but conflicts with ttf-nerd-fonts-symbols
yay powerline-fonts-git
yay fontmatrix
yay powerline-fonts
yay powerline-common
yay xorg-xlsfonts

# Shell Prompt
yay starship

# Navi & dependencies
yay navi # man-page alternative in Rust
yay fzf
yay skim

# REPL 
yay evcxr                       # a RUST based repl based on evcxr

# fast Node Version Manager
yay fnm-bin
eval "$(fnm env)"               # source the shell instead of restarting terminal
fnm install --lts               # Install latest node version -- $ node $ .exit
# YARN
sudo dnf install yarnpkg        # Fast, reliable, and secure dependency management.
sudo yarn global add create-vite # then use create-vite my-app

# terminal 
yay wezterm kitty alacritty

# starship setup
starship init bash
starship init fish
starship init zsh
mkdir ~/.config/starship/ && touch ~/.config/starship/starship.toml
export STARSHIP_CONFIG=~/.config/starship/starship.toml

yay mcfly
echo "source /usr/share/doc/mcfly/mcfly.bash" >> .bashrc

# wallppaper theme
yay python-pywal
yay redshift

# feature rich ncurses-based music player
yay cmus

#
# PARU
#
# Install paru, like yay
yay paru

# wallpapers
paru -S nordic-wallpapers

# FONTS
sudo pacman -S ttf-dejavu ttf-liberation ttf-droid ttf-ubuntu-font-family noto-fonts 
yay -S ttf-gelasio-ib ttf-caladea ttf-carlito ttf-liberation-sans-narrow ttf-ms-fonts
# Essential for starship glyphs emoji etc
yay noto-fonts-emoji noto-fonts-extra
# sudo pacman -S ttf-font-awesome-4

# ASCII 
# live ascii bonsai tree animation @chonsai
yay cbonsai
yay rmatrix

#
# EMACS
#
yay emacs
# Doom Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
   ~/.emacs.d/bin/doom install
# source .bashrc # after adding to ./bashrc >> export PATH="$HOME/.emacs.d/bin:$PATH"
doom sync
sudo dnf install rust_ledger
sudo dnf install sqlite
