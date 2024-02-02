#!/bin/bash

# Update package repositories
sudo apt update

# Install curl (if not installed)
sudo apt install curl -y

# Install Zsh
sudo apt install zsh -y

# Set Zsh as the default shell
sudo chsh -s $(which zsh) "$USER"

# Set the ZSH environment variable for non-interactive installation of Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Install Oh My Zsh without prompts
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Download the latest nvim.appimage and set permissions
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

# Attempt to run nvim.appimage
if ./nvim.appimage; then
    echo "Neovim (nvim.appimage) executed successfully."
else
    echo "Neovim (nvim.appimage) execution failed. Attempting to extract and run..."
    ./nvim.appimage --appimage-extract
    if [ -x ./squashfs-root/AppRun ]; then
        echo "Neovim extracted and executed successfully."
        ./squashfs-root/AppRun --version
        # Optional: Exposing nvim globally
        sudo mv squashfs-root /
        sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
    else
        echo "Failed to extract and execute Neovim."
        exit 1
    fi
fi

# Download and set up NVChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# Run Neovim
nvim
