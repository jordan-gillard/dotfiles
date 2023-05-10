#!/usr/bin/env zsh

# Check if the powerline fonts directory exists
if [[ ! -d "$HOME/.local/share/fonts/Powerline" ]]; then
    echo "Installing Powerline fonts..."
    # Create the directory for Powerline fonts
    mkdir -p "$HOME/.local/share/fonts/Powerline"

    # Download and install Powerline fonts
    git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
    /tmp/fonts/install.sh
    rm -rf /tmp/fonts

    echo "Powerline fonts installed."
else
    echo "Powerline fonts are already installed."
fi
