#!/bin/bash

set_zsh_as_default() {
    if command -v chsh > /dev/null; then
        echo "Setting zsh as the default shell..."
        chsh -s "$(command -v zsh)"
        echo "zsh has been set as the default shell. Please restart your terminal."
        return 0
    else
        return 1
    fi
}

# Set zsh as the default shell
if ! set_zsh_as_default; then
    echo "Installing util-linux-user package to get chsh..."
    yum -y install util-linux-user
    if ! set_zsh_as_default; then
        echo "chsh command not found. Please set zsh as the default shell manually."
        exit 1
    fi
fi
