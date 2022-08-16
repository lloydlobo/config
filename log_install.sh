#!/bin/bash

# put `&` later when creating the final script

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
# RUSTUP | CARGO 
#
# Setup rustup cargo & update it
rustup default stable
rustup update

#
# MUSIC | MPD | MPV
#


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

# https://wiki.archlinux.org/title/Dotfiles
# Dotfiles bare config alias
yay bash-complete-alias
# bash-complete-alias dependency is bash-completion --> needed?
yay bash-completion
echo "complete -F _complete_alias config" >> .bashrc

#
# i3 - PLUGINS
#
yay autotiling
yay -S i3-resurrect
yay xorg-xbacklight
yay light
yay bat
yay thefuck

#
# ASTRONVIM
#
yay astronvim
yay lazygit
# lf aur/lf Ranger in Go-lang - Option 98 in yay.,. first in aur
yay lf
yay ripgrep

# OTHER YAY
yay git-delta
yay nerd-fonts
yay macchina-bin
yay procs
yay hyperfine

# Shell Prompt
yay starship

# Navi & dependencies
yay navi # man-page alternative in Rust
yay fzf
yay skim

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

# Prerequisite mpc mpd ncmpcpp
sudo pacman -S timidity
# feature rich ncurses-based music player
yay cmus

#
# PARU
#
# Install paru, like yay
yay paru

# wallpapers
paru -S nordic-wallpapers

