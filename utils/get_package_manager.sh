#!/bin/bash

_install_homebrew() {
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
}

echo_rhel_based() {
    # RHEL >= 8 uses the dnf package manager
    if awk "BEGIN {exit !($VERSION_ID >= 8)}"; then
        echo "dnf"
    else
        echo "yum"
    fi
}

get_package_manager() {
  if [ -f /etc/os-release ]; then
    # Linux installation
    . /etc/os-release
    case "$ID" in
      rhel|centos|fedora) echo_rhel_based ;;
      debian|ubuntu|mint) echo "apt-get" ;;
      arch) echo "pacman" ;;
      opensuse*) echo "zypper" ;;
      *) return 1 ;;
    esac
  elif [ "$(uname)" == "Darwin" ]; then
    # macOS installation
    if ! command -v brew > /dev/null; then
        _install_homebrew
    fi
    echo "brew"
  else
    return 1
  fi
}
