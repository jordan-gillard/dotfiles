#!/bin/bash

echo "Installing zsh..."

# Detect the platform and install zsh
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux installation
    echo "Detected OS: Linux"
    if command -v apt-get > /dev/null; then
        sudo apt-get update
        sudo apt-get install -y zsh
    elif command -v yum > /dev/null; then
        sudo yum install -y zsh
    elif command -v dnf > /dev/null; then
        sudo dnf install -y zsh
    elif command -v pacman > /dev/null; then
        sudo pacman -Syu --noconfirm zsh
    else
        echo "Package manager not supported. Please install zsh manually."
        exit 1
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS installation
    echo "Detected OS: macOS"
    if command -v brew > /dev/null; then
        brew install zsh
    else
        echo "Homebrew not found. Please install Homebrew or zsh manually."
        exit 1
    fi
else
    echo "Operating system not supported. Please install zsh manually."
    exit 1
fi

# Set zsh as the default shell
if command -v chsh > /dev/null; then
    echo "Setting zsh as the default shell..."
    chsh -s "$(command -v zsh)"
    echo "zsh has been set as the default shell. Please restart your terminal."
else
    echo "chsh command not found. Please set zsh as the default shell manually."
    exit 1
fi
