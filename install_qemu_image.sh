#!/bin/bash

install_homebrew() {
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

if [ "$(uname)" == "Darwin" ]; then
  echo "Detected macOS."
  if ! command -v brew &> /dev/null; then
    install_homebrew
  fi
  brew install qemu
elif [ -f /etc/os-release ]; then
  . /etc/os-release
else
  echo "Error: /etc/os-release not found. Cannot detect Linux distribution."
  exit 1
fi

case $ID in
  ubuntu|debian)
    echo "Detected Ubuntu/Debian-based distribution."
    apt-get update
    apt-get install -y qemu-utils
    ;;
  centos|rhel|fedora)
    echo "Detected CentOS/RHEL/Fedora-based distribution."
    dnf -y install qemu-img
    ;;
  *)
    echo "Unsupported distribution: $ID"
    exit 1
    ;;
esac

echo "qemu-img installation complete."
