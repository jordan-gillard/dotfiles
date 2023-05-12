#!/usr/bin/env zsh

if [[ "$(uname)" == "Linux" ]]; then
  echo "🐧 Detected Linux system. Proceeding with Alacritty installation..."

  # Download Alacritty binary
  echo "📥 Downloading Alacritty binary..."
  curl -L -o alacritty.tar.gz https://github.com/alacritty/alacritty/archive/refs/tags/v0.12.0.tar.gz

  # Extract the downloaded file
  echo "📦 Extracting Alacritty binary..."
  tar -xzf alacritty.tar.gz

  # Move the extracted binary to /usr/local/bin
  echo "🔧 Installing Alacritty to /usr/local/bin..."
  mv alacritty /usr/local/bin/

  # Clean up downloaded files
  echo "🧹 Cleaning up temporary files..."
  rm alacritty.tar.gz

  echo "✅ Installation complete. Alacritty is now set as the default terminal in VSCode."
else
  echo "⚠️ This script is designed for Linux systems. Skipping installation..."
  exit 0
fi
