#!/usr/bin/env zsh

echo "Installing clang-format..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux installation
    echo "Detected OS: Linux"
    source /etc/os-release
    case $ID in
        ubuntu|debian)
            echo "Detected Ubuntu/Debian-based distribution."
            apt-get update
            apt-get install -y clang-format
            ;;
        centos|rhel)
            echo "Detected CentOS/RHEL-based distribution."
            if [ "${VERSION_ID%%.*}" -ge "8" ]; then
                subscription-manager repos --enable=codeready-builder-for-rhel-8-x86_64-rpms
                dnf -y install clang-tools-extra
            else
                subscription-manager repos --enable=rhel-7-server-optional-rpms
                yum -y install clang-tools-extra
            fi
            ;;
        fedora)
            echo "Detected Fedora-based distribution."
            dnf -y install clang-tools-extra
            ;;
        *)
            echo "Unsupported Linux distribution. Please install clang-format manually."
            exit 1
            ;;
    esac
elif [ "$(uname)" == "Darwin" ]; then
    # macOS installation
    echo "Detected OS: macOS"
    if command -v brew > /dev/null; then
        brew install clang-format
    else
        echo "Homebrew not found. Please install Homebrew or clang-format manually."
        exit 1
    fi
else
    echo "Operating system not supported. Please install clang-format manually."
    exit 1
fi

if ! command -v clang-format &> /dev/null; then
    echo "clang-format installation failed"
    exit 1
fi

echo "clang-format installation script finished."
