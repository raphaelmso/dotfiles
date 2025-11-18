#!/bin/bash

set -e
echo "updating"
sudo pacman -Syu --noconfirm

PACKAGES=(
  neovim
  git
  btop
  curl
  wget
  fzf
  less
  fd
  firefox
  hyprlauncher
  hyprtoolkit
  hyprpaper
  hyprpolkitagent
  hyprpicker
  xdg-desktop-portal-hyprland
  xdg-user-dirs
  waybar
  yazi
  power-profiles-daemon
  openssh
  lazygit
  stow
  lua-language-server
  fastfetch
  rofi
  cliphist
  wl-clipboard
  udiskie
  starship
  grim
  slurp
  swappy
)

echo "installing packages"
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"
