#!/bin/bash

# Update package repo
sudo apt update

# Install curl (should be already installed but just incase)
sudo apt install curl -y

# Install Z shell
sudo apt install zsh -y

# Set Z shell as the default shell
sudo chsh -s $(which zsh) "$USER"

# Set the ZSH environment variable for non-interactive installation of Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Install Oh My Zsh without prompts so it doesnt stop
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Download the latest nvim.appimage and chmod it
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

# Attempt to run nvim.appimage coz it always does this and then you have to do the following
if ./nvim.appimage; then
    echo "Neovim (nvim.appimage) executed successfully."
else
    echo "Neovim (nvim.appimage) execution failed. Attempting to extract and run..."
    ./nvim.appimage --appimage-extract
    if [ -x ./squashfs-root/AppRun ]; then
        echo "Neovim extracted and executed successfully."
        ./squashfs-root/AppRun --version
        sudo mv squashfs-root /
        sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
    else
        echo "Failed to extract and execute Neovim."
        exit 1
    fi
fi

# Download and set NVChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# Run Neovim
nvim
