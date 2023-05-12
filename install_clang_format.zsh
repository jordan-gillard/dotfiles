#!/usr/bin/env zsh

echo "Installing clang-format..."

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux installation
    echo "Detected OS: Linux"
    . /etc/os-release
    case $ID in
        ubuntu|debian)
            echo "Detected Ubuntu/Debian-based distribution."
            sudo apt-get update
            sudo apt-get install -y clang-format
            ;;
        centos|rhel)
            echo "Detected CentOS/RHEL-based distribution."
            if [ "${VERSION_ID%%.*}" -ge "8" ]; then
                sudo dnf -y install clang-format
            else
                sudo yum -y install clang-format
            fi
            ;;
        fedora)
            echo "Detected Fedora-based distribution."
            sudo dnf -y install clang-format
            ;;
        *)
            echo "Unsupported Linux distribution. Please install clang-format manually."
            ;;
    esac
elif [ "$(uname)" == "Darwin" ]; then
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
