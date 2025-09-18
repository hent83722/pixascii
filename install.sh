#!/bin/bash

INSTALL_DIR="$HOME/bin"
USE_SUDO=false

# Detect if sudo is available (i.e. on full Linux, not Termux)
if command -v sudo >/dev/null 2>&1 && sudo -n true 2>/dev/null; then
    INSTALL_DIR="/usr/local/bin"
    USE_SUDO=true
fi

# Make target directory if needed
mkdir -p "$INSTALL_DIR"

# Copy and set executable
if [ "$USE_SUDO" = true ]; then
    sudo cp pixascii.py "$INSTALL_DIR/pixascii"
    sudo chmod +x "$INSTALL_DIR/pixascii"
else
    cp pixascii.py "$INSTALL_DIR/pixascii"
    chmod +x "$INSTALL_DIR/pixascii"

    # Ensure $HOME/bin is in PATH
    if ! echo "$PATH" | grep -q "$HOME/bin"; then
        echo 'export PATH=$HOME/bin:$PATH' >> "$HOME/.bashrc"
        echo 'export PATH=$HOME/bin:$PATH' >> "$HOME/.zshrc"
        echo "Added \$HOME/bin to PATH. Restart your terminal or run:"
        echo "source ~/.bashrc  # or ~/.zshrc"
    fi
fi

echo "Installed pixascii to $INSTALL_DIR"
