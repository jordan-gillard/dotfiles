#!/usr/bin/env zsh

# Check if Vim is installed
if ! command -v vim &> /dev/null; then
    echo "Vim not found. Installing Vim..."
    sudo apt update
    sudo apt install -y vim
else
    echo "Vim is already installed."
fi
