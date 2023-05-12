#!/usr/bin/env zsh

# Install Rust and Cargo
echo "📦 Installing Rust and Cargo..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env
