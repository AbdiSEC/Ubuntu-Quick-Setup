# Ubuntu Quick Config Environment and Packages

This script automates the setup process for Ubuntu packages I use by basicly installing and configuring them.

## Features

- Updates package repository.
- Installs `curl` and `zsh`.
- Sets Z shell (`zsh`) as the default shell.
- Installs Oh My Zsh without prompts.
- Downloads and sets up Neovim.
- Clones NVChad for Neovim configuration.

## Usage

1. **Download the Script**: Run the following command to download the script to your Ubuntu system:

    ```bash
    curl -o script.sh https://raw.githubusercontent.com/AbdiSEC/Ubuntu-Quick-Setup/main/script.sh
    ```

2. **Change Permissions**: Make the script executable by running:

    ```bash
    chmod +x script.sh
    ```

3. **Execute the Script**: Run the script using:

    ```bash
    ./script.sh
    ```

4. **Follow On-screen Prompts**: The script will guide you through the setup process. Ensure to review the script before executing it.


Will be adding script for h-my-zsh config & plugins:

ZSH_THEME="fletcherm"                                                                                                                 
plugins=(git k z zsh-autosuggestions zsh-syntax-highlighting)

https://github.com/supercrabtree/k/blob/master/readme.md
https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md

