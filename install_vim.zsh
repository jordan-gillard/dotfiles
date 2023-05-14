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
                apt update
                apt install -y vim
                ;;
            centos|rhel)
                echo "Detected CentOS/RHEL-based distribution."
                if [ "${VERSION_ID%%.*}" -ge "8" ]; then
                    dnf -y install vim
                else
                    yum -y install vim
                fi
                ;;
            fedora|rocky)
                dnf install -y vim
                ;;
            opensuse*)
                zypper install -y vim
                ;;
            arch|manjaro)
                pacman -Syu vim
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
