#!/usr/bin/env bash

# Get the absolute path of the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
bash "$SCRIPT_DIR/print_title.sh"

# Define helper function for printing results
print_result() {
    if [ "$1" -eq 0 ]; then
        printf "✅ SUCCESS\n"
    else
        printf "❌ FAILURE\n"
    fi
}

# Run each script and store the exit status
echo "Installing Z shell"
bash "$SCRIPT_DIR/install_zsh.sh"
zsh_result=$?

echo "Setting Z shell as the default shell"
bash "$SCRIPT_DIR/set_zsh_as_default.sh"
zsh_default_result=$?

echo "Installing Git..."
bash "$SCRIPT_DIR/install_git.sh"
git_result=$?

echo "Installing Oh My Zsh..."
zsh "$SCRIPT_DIR/install_oh_my_zsh.zsh"
oh_my_zsh_result=$?

echo "Installing Vim"
zsh "$SCRIPT_DIR/install_vim.zsh"
vim_result=$?

echo "Installing Powerline fonts..."
zsh "$SCRIPT_DIR/install_powerline_fonts.zsh"
powerline_fonts_result=$?

echo "Installing clang-format..."
zsh "$SCRIPT_DIR/install_clang_format.zsh"
clang_format_result=$?

# Temporarily disable exit-on-error
set +e

echo "Setting up .zshrc and .vimrc..."
ln -sf "$SCRIPT_DIR/.zshrc" "$HOME/.zshrc"
zshrc_symbolic_link_result=$?
ln -sf "$SCRIPT_DIR/.vimrc" "$HOME/.vimrc"
vimrc_symbolic_link_result=$?

# Create symbolic link to VSCode settings.json
echo "Setting up VSCode settings..."
mkdir -p "$HOME/.config/Code/User"
echo "Linking $SCRIPT_DIR/.vscode/settings.json"
ln -sf "$SCRIPT_DIR/.vscode/settings.json" "$HOME/.config/Code/User/settings.json"
vscode_settings_symbolic_link_result=$?

# Re-enable exit-on-error
set -e

# Print the results
printf "\nRESULTS\n-----------\n"
printf "Zsh Shell Install - "
print_result $zsh_result
printf "Zsh Default Shell - "
print_result $zsh_default_result
printf "Git Install - "
print_result $git_result
printf "Oh My Zsh Install - "
print_result $oh_my_zsh_result
printf "Vim Install - "
print_result $vim_result
printf "Powerline Fonts Install - "
print_result $powerline_fonts_result
printf "Clang Format Install - "
print_result $clang_format_result
printf ".zshrc Symbolic Link Creation - "
print_result $zshrc_symbolic_link_result
printf ".vimrc Symbolic Link Creation - "
print_result $vimrc_symbolic_link_result
printf "VSCode Settings Symbolic Link Creation - "
print_result $vimrc_symbolic_link_result
