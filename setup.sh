#!/bin/bash

# List of packages to install
packages=(
  "neovim"
  "emacs"
  "k9s"
  "waybar"
  "wofi"
  "hyprland"
  "kitty"
  "alacritty"
  "ghostty"
  "jdk21-openjdk"
  "clojure"
  "ttf-font-nerd"
  "starship"
  "xdg-desktop-portal-hyprland"
  "tmux"
  # Add more packages as needed
)

# Loop through the packages and install them
for package in "${packages[@]}"; do
  if pacman -Qi "$package" &>/dev/null; then
    echo "Package '$package' is already installed."
  else
    sudo pacman -S --noconfirm "$package"
    if [ $? -eq 0 ]; then
      echo "Package '$package' installed successfully."
    else
      echo "Failed to install package '$package'."
    fi
  fi
done

echo "Package installation process completed."

