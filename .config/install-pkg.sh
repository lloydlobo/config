#!/usr/bin/env bash

# [[file:install-pkg.org::git dotfiles bare repo][git dotfiles bare repo]]
#
# GUIDE for instal.sh dotfiles
# =>> https://github.com/bobwhitelock/dotfiles
# put `&` later when creating the final script
#
# Connect to github cli
gh auth login
#
# /config DOTFILES BARE REPO
# Import dotfiles from github for .config
echo ".cfg" >> .gitignore
git clone --bare git@github.com:lloydlobo/config.git $HOME/.cfg/
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
#
# git dotfiles bare repo ends here

# [[file:install-pkg.org::Arch pacman yay][Arch pacman yay]]
#
# YAY
#
# Install yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
#
# Setup yay
yay -Y --gendb
yay -Syu devel
yay -Y --devel --save
#
# Arch pacman yay ends here

# [[file:install-pkg.org::fedora dnf snapd setup][fedora dnf snapd setup]]
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
# fedora dnf snapd setup ends here

# [[file:install-pkg.org::Vim/Neovim][Vim/Neovim]]
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
# Vim/Neovim ends here

# [[file:install-pkg.org::Utilities][Utilities]]
#------------------------------------------------------------------------------------------------------#
# disk analyzer with ncurses interface
yay ncdu
cargo install --locked code-minimap
# lf aur/lf Ranger in Go-lang - Option 98 in yay.,. first in aur
sudo dnf install btop htop
# Simple X Hot Key Daemon.
yay sxhkd                       # You can remap individual keys with Xmodmap quite easily, but not arbitrary combinations of keys.

# OTHER YAY
yay git-delta
yay macchina-bin
yay procs
yay hyperfine

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
# Utilities ends here

# [[file:install-pkg.org::Databases][Databases]]
#------------------------------------------------------------------------------------------------------#

sudo dnf install sqlite
# Databases ends here

# [[file:install-pkg.org::Rust tools][Rust tools]]
#------------------------------------------------------------------------------------------------------#
# rust tools
yay lf
yay ripgrep
yay zoxide                      # A smarter cd command
yay exa # 10 - ls replacement
yay bat
sudo dnf install rust_ledger
# Rust tools ends here

# [[file:install-pkg.org::Go lang][Go lang]]
#------------------------------------------------------------------------------------------------------#
# Go lang
## Sampler:  Tool for shell commands execution, visualization and alerting.
sudo wget https://github.com/sqshq/sampler/releases/download/v1.1.0/sampler-1.1.0-linux-amd64 -O /usr/local/bin/sampler
sudo chmod +x /usr/local/bin/sampler # Please specify config file using --config flag. Example: sampler --config example.yml
### OR (FEDORA)
sudo dnf install golang-github-sqshq-sampler
# Go lang ends here

# [[file:install-pkg.org::VS Code][VS Code]]
#------------------------------------------------------------------------------------------------------#

# VSCODE -- https://code.visualstudio.com/docs/setup/linux#_rhel-fedora-and-centos-based-distributions
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code
# VS Code ends here

# [[file:install-pkg.org::Browsers][Browsers]]
#------------------------------------------------------------------------------------------------------#
# BROWSER
# Qutebrowser & dependency
yay qutebrowser
yay python-adblock
yay asciidoc
sudo dnf install qt5-qtwebengine-freeworld   # RPM Fusion - codecs to play videos
# yay python-pygments # for :view-source syntax highlighting
# Browsers ends here

# [[file:install-pkg.org::Fonts][Fonts]]
#------------------------------------------------------------------------------------------------------#
yay nerd-fonts-complete         # aur but conflicts with ttf-nerd-fonts-symbols
yay powerline-fonts-git
yay fontmatrix
yay powerline-fonts
yay powerline-common
yay xorg-xlsfonts
# Fonts ends here

# [[file:install-pkg.org::Shell Terminals Extras][Shell Terminals Extras]]
#------------------------------------------------------------------------------------------------------#
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

# Shell Prompt
yay starship

# Navi & dependencies
yay navi # man-page alternative in Rust
yay fzf
yay skim

# REPL
yay evcxr                       # a RUST based repl based on evcxr

# ASCII
# live ascii bonsai tree animation @chonsai
yay cbonsai
yay rmatrix
# Shell Terminals Extras ends here

# [[file:install-pkg.org::NODE][NODE]]
#------------------------------------------------------------------------------------------------------#
# fast Node Version Manager
yay fnm-bin
eval "$(fnm env)"               # source the shell instead of restarting terminal
fnm install --lts               # Install latest node version -- $ node $ .exit
# YARN
sudo dnf install yarnpkg        # Fast, reliable, and secure dependency management.
sudo yarn global add create-vite # then use create-vite my-app
# NODE ends here

# [[file:install-pkg.org::YAY Extras][YAY Extras]]
#------------------------------------------------------------------------------------------------------#
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
# YAY Extras ends here

# [[file:install-pkg.org::EMACS][EMACS]]
#------------------------------------------------------------------------------------------------------#

yay emacs
# Doom Emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.emacs.d
   ~/.emacs.d/bin/doom install
# source .bashrc # after adding to ./bashrc >> export PATH="$HOME/.emacs.d/bin:$PATH"
doom sync
# EMACS ends here

# [[file:install-pkg.org::C Libraries][C Libraries]]
sudo dnf install clang
# C Libraries ends here

# [[file:install-pkg.org::C Libraries/SDL2][C Libraries/SDL2]]
sudo dnf install SDL2{,_image,_mixer,_ttf,_gfx}-devel
# C Libraries/SDL2 ends here

# [[file:install-pkg.org::robotgo/Fedora][robotgo/Fedora]]
sudo dnf install libXtst-devel

# Bitmap
sudo dnf install libpng-devel

# Hook
sudo dnf install libxkbcommon-devel libxkbcommon-x11-devel xorg-x11-xkb-utils-devel
sudo dnf install libxkbcommon-x11-devel

# Clipboard
sudo dnf install xsel xclip

# Install package 'xorg-x11-server-Xvfb' to provide command 'xvfb-run'? [N/y] y
# For gohooks load_input_helper [1883]: XkbGetKeyboard failed to locate a valid keyboard!
# Run COMMAND (usually an X client) in a virtual X server environment.
sudo dnf install xorg-x11-server-Xvfb
# robotgo/Fedora ends here

# [[file:install-pkg.org::Formatters/shfmt][Formatters/shfmt]]
sudo dnf install shfmt
# Formatters/shfmt ends here

# [[file:install-pkg.org::Go Tools Environment/Debugging][Go Tools Environment/Debugging]]
# Installing 6 tools at /$HOME/go/bin in module mode.
# gotests # gomodifytags # impl # goplay # dlv # staticchec
go get github.com/cweill/gotests/gotests@latest
go get github.com/fatih/gomodifytags@latest
go get github.com/josharian/impl@latest
go get github.com/haya14busa/goplay/cmd/goplay@latest
go get github.com/go-delve/delve/cmd/dlv@latest
go get honnef.co/go/tools/cmd/staticcheck@latest
# Go Tools Environment/Debugging ends here

# [[file:install-pkg.org::cheatsheets/cheat][cheatsheets/cheat]]
sudo dnf install cheat
# cheatsheets/cheat ends here
