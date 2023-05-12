#!/usr/bin/env bash

# Get the absolute path of the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"

echo "Installing Z shell & setting it as default..."
source "$SCRIPT_DIR/install_zsh_and_set_default.sh"

echo "Installing Oh My Zsh..."
source "$SCRIPT_DIR/install_oh_my_zsh.zsh"

echo "Installing Vim"
source "$SCRIPT_DIR/install_vim.zsh"

echo "Installing Powerline fonts..."
source "$SCRIPT_DIR/install_powerline_fonts.zsh"

echo "Installing clang-format..."
source "$SCRIPT_DIR/install_clang_format.zsh"

echo "Setting up .zshrc and .vimrc..."
ln -sf "$SCRIPT_DIR/dotfiles/.zshrc" "$HOME/.zshrc"
ln -sf "$SCRIPT_DIR/dotfiles/.vimrc" "$HOME/.vimrc"

# Create symbolic link to VSCode settings.json
echo "Setting up VSCode settings..."
mkdir -p "$HOME/.config/Code/User"
ln -sf "$SCRIPT_DIR/dotfiles/.vscode/settings.json" "$HOME/.config/Code/User/settings.json"

# echo "Installing Rust and Cargo..."
# source "$SCRIPT_DIR/install_rust_and_cargo.zsh"

# echo "Installing Alacritty and setting it as VSCode default terminal"
# source "$SCRIPT_DIR/install_alacritty.zsh"

echo "Installation complete. Please restart your terminal for changes to take effect."
