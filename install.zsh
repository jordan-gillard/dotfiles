#!/usr/bin/env zsh

# Set default shell to zsh if not already set
if [ "$(basename "$SHELL")" != "zsh" ]; then
  echo "Setting default shell to zsh..."
  chsh -s $(which zsh)
fi

echo "Installing Oh My Zsh..."
./install_oh_my_zsh.zsh

echo "Installing Powerline fonts..."
./install_powerline_fonts.zsh

echo "Installing clang-format..."
./install_clang_format.zsh

echo "Installation complete. Please restart your terminal for changes to take effect."
