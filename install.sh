#!/usr/bin/env bash

# Set variables
SCRIPT_NAME="pixascii.py"
INSTALL_DIR="$HOME/.local/bin"
TARGET="$INSTALL_DIR/pixascii"

# Make sure ~/.local/bin exists
mkdir -p "$INSTALL_DIR"

# Copy the Python script
cp "$SCRIPT_NAME" "$TARGET"

# Make it executable
chmod +x "$TARGET"

# Add ~/.local/bin to PATH if not already
if ! echo "$PATH" | grep -q "$INSTALL_DIR"; then
    echo 'export PATH=$HOME/.local/bin:$PATH' >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
fi

echo "Installation complete! You can now run 'pixascii' from anywhere."
