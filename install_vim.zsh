#!/usr/bin/env zsh

# Check if Vim is installed
if ! command -v vim &> /dev/null; then
    echo "Vim not found. Installing Vim..."

    if [[ "$(uname)" == "Darwin" ]]; then
        # macOS
        if ! command -v brew &> /dev/null; then
            echo "Homebrew not found. Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew install vim
    elif [[ -f "/etc/os-release" ]]; then
        # Linux
        . /etc/os-release
        case $ID in
            debian|ubuntu|*mint*)
                sudo apt update
                sudo apt install -y vim
                ;;
            fedora|rhel|centos|rocky)
                sudo dnf install -y vim
                ;;
            opensuse*)
                sudo zypper install -y vim
                ;;
            arch|manjaro)
                sudo pacman -Syu vim
                ;;
            *)
                echo "Unsupported distribution. Please install Vim manually."
                exit 1
                ;;
        esac
    else
        echo "Unsupported operating system. Please install Vim manually."
        exit 1
    fi
else
    echo "Vim is already installed."
fi
