#!/usr/bin/env zsh

echo "Installing clang-format..."

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux installation
    echo "Detected OS: Linux"
    if command -v apt-get > /dev/null; then
        sudo apt-get update
        sudo apt-get install -y clang-format
    elif command -v yum > /dev/null; then
        sudo yum install -y clang-format
    elif command -v dnf > /dev/null; then
        sudo dnf install -y clang-format
    elif command -v pacman > /dev/null; then
        sudo pacman -Syu --noconfirm clang-format
    else
        echo "Package manager not supported. Please install clang-format manually."
    fi
elif [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS installation
    echo "Detected OS: macOS"
    if command -v brew > /dev/null; then
        brew install clang-format
    else
        echo "Homebrew not found. Please install Homebrew or clang-format manually."
    fi
else
    echo "Operating system not supported. Please install clang-format manually."
fi

echo "clang-format installation script finished."
