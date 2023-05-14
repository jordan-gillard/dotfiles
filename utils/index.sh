SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

source $SCRIPT_DIR/get_package_manager.sh
source $SCRIPT_DIR/os_info.sh
source $SCRIPT_DIR/update_package_manager.sh
