#!/usr/bin/env zsh

echo "Checking if Oh My Zsh is already installed."
if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Oh My Zsh is already installed."
fi
