#!/usr/bin/env bash

echo "Installing Z shell & setting it as default..."
source ./install_zsh_and_set_default.sh

echo "Installing Oh My Zsh..."
source ./install_oh_my_zsh.zsh

echo "Installing Powerline fonts..."
source ./install_powerline_fonts.zsh

echo "Installing clang-format..."
source ./install_clang_format.zsh

echo "Installation complete. Please restart your terminal for changes to take effect."
