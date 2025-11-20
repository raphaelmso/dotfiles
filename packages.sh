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
  chromium
  hyprlauncher
  hyprtoolkit
  hyprpaper
  hyprpolkitagent
  hyprsunset
  hypridle
  hyprlock 
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
  mako
  bluetui
  bluez
  bluez-utils
  ly
  base-devel
  man
  tealdeer
  zoxide
  zsh
  desktop-file-utils
  eza
  wiremix
  gnome-themes-extra
  nautilus
  network-manager-applet
)

echo "installing packages"
sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"
