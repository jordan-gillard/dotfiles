#!/bin/bash

update_package_manager() {
    PM="$1"
    case "$PM" in
      yum|dnf|zypper) "$PM" -y update ;;
      apt-get|brew) "$PM" -y update && "$PM" -y upgrade ;;
      pacman) "$PM" -Syu ;;
      *) echo "Unsupported package manager: $PM" && return 1 ;;
    esac 
}
