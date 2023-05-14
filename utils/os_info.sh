#!/bin/bash

get_os_pretty_name() {
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    echo "$PRETTY_NAME"
  elif [ "$(uname)" == "Darwin" ]; then
    echo "macOS $(sw_vers -productVersion)"
  else
    echo "Unknown OS"
  fi
}
