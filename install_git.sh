#!/bin/bash

echo "Detecting operating system..."
OS=""
ID=""
VERSION_ID=""
if [ -f /etc/os-release ]; then
    . /etc/os-release
    ID=$ID
    VERSION_ID=$VERSION_ID
elif [ "$(uname)" == "Darwin" ]; then
    OS="macOS"
fi

echo "Installing Git..."
if [ "$OS" == "macOS" ]; then
    if ! command -v brew >/dev/null; then
        echo "Homebrew not found, installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install git
elif [ "$ID" == "debian" ] || [ "$ID" == "ubuntu" ]; then
    sudo apt-get update
    sudo apt-get install -y git
elif [ "$ID" == "fedora" ]; then
    sudo dnf -y install git
elif [ "$ID" == "centos" ] || [ "$ID" == "rhel" ]; then
    if [ "${VERSION_ID%%.*}" -ge "8" ]; then
        sudo dnf -y install git
    else
        sudo yum -y install git
    fi
else
    echo "Unsupported operating system. Please install Git manually."
    exit 1
fi

echo "Git installation complete."
