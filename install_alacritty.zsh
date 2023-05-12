#!/usr/bin/env zsh

if [[ "$(uname)" == "Linux" ]]; then
  echo "🐧 Detected Linux system. Proceeding with Alacritty installation..."

  # Install dependencies for building Alacritty
  echo "📦 Installing build dependencies..."
  apt-get update
  apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3 git

  # Clone Alacritty source code
  echo "🚀 Cloning Alacritty source code..."
  git clone https://github.com/alacritty/alacritty.git
  cd alacritty

  # Build Alacritty binary
  echo "🔨 Building Alacritty binary..."
  cargo build --release

  # Move the built binary to /usr/local/bin
  echo "🔧 Installing Alacritty to /usr/local/bin..."
  mv target/release/alacritty /usr/local/bin/

  # Clean up downloaded source code
  echo "🧹 Cleaning up temporary files..."
  cd ..
  rm -rf alacritty

  # Set Alacritty as the default terminal for VSCode
  echo "🛠️ Setting Alacritty as the default terminal in VSCode..."
  echo '{
    "terminal.external.linuxExec": "alacritty",
    "terminal.integrated.defaultProfile.linux": "alacritty"
  }' > ~/.config/Code/User/settings.json

  echo "✅ Installation complete. Alacritty is now set as the default terminal in VSCode."
else
  echo "⚠️ This script is designed for Linux systems. Skipping installation..."
  exit 0
fi
