#!/usr/bin/env bash

# Get the absolute path of the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

# Source helper functions
UTILS="$SCRIPT_DIR/utils/"

for script_file in "$UTILS"/*.sh; do
  # Check if the file exists and is a regular file
  if [ -f "$script_file" ]; then
    # Source the script file
    source "$script_file"
  fi
done

# Run main program
echo "Detected OS: $get_os_pretty_name"

package_manager=$(get_package_manager)
if [ $? -eq 1 ]; then
  echo "Failure: Can't determine package manager for $os_pretty_name!"
  exit 1
fi

update_package_manager $package_manager
