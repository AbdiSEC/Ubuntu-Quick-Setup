#!/bin/bash

# Update package repositories
sudo apt update

# Install curl (if not installed)
sudo apt install curl -y

# Install Zsh
sudo apt install zsh -y

# Set Zsh as the default shell
chsh -s $(which zsh)

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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
        nvim
    else
        echo "Failed to extract and execute Neovim."
        exit 1
    fi
fi
