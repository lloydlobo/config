#!/bin/bash

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
# disk analyzer with ncurses interface
yay ncdu
# lf aur/lf Ranger in Go-lang - Option 98 in yay.,. first in aur
yay lf
yay ripgrep
sudo pacman -S fd
yay exa # 10 - ls replacement

#
# EMACS
#
yay emacs
# Doom Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
   ~/.emacs.d/bin/doom install
# source .bashrc # after adding to ./bashrc >> export PATH="$HOME/.emacs.d/bin:$PATH"
doom sync 

# BROWSER
# Qutebrowser & dependecy
yay qutebrowser
yay python-adblock
# yay python-pygments # for :view-source syntax highlighting
yay asciidoc

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
yay redshift

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

# FONTS
sudo pacman -S ttf-dejavu ttf-liberation ttf-droid ttf-ubuntu-font-family noto-fonts
yay -S ttf-gelasio-ib ttf-caladea ttf-carlito ttf-liberation-sans-narrow ttf-ms-fonts
# sudo pacman -S ttf-font-awesome-4

# ASCII 
# live ascii bonsai tree animation @chonsai
yay cbonsai
yay rmatrix
