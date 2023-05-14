#!/usr/bin/env bash

# Get the absolute path of the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# Source helper functions
source "$SCRIPT_DIR/utils/index.sh"

# Run main program
os_pretty_name=$(get_os_pretty_name)
echo "Detected OS: $os_pretty_name"

package_manager=$(get_package_manager)
if [ $? -eq 1 ]; then
  echo "Failure: Can't determine package manager for $os_pretty_name!"
  exit 1
fi

echo "Using package manager: $package_manager"
update_package_manager $package_manager
