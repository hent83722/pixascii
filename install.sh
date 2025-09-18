#!/usr/bin/env bash
set -e

REPO_URL="https://raw.githubusercontent.com/hent83722/pixascii/main"

echo "[*] Installing pixascii..."

# Detect Termux
if command -v pkg >/dev/null 2>&1; then
    echo "[*] Detected Termux"
    pkg install -y python
    pip install --user pillow
    INSTALL_DIR="$HOME/bin"
else
    echo "[*] Detected Linux"
    if command -v pacman >/dev/null 2>&1; then
        sudo pacman -S --noconfirm python-pillow
    else
        python3 -m pip install --user pillow
    fi
    INSTALL_DIR="/usr/local/bin"
fi

# Ensure install dir exists
mkdir -p "$INSTALL_DIR"

# Download script
echo "[*] Downloading pixascii.py..."
curl -s -L "$REPO_URL/pixascii.py" -o "$INSTALL_DIR/pixascii"
chmod +x "$INSTALL_DIR/pixascii"

echo "[✓] pixascii installed!"
echo "Run it with: pixascii <path-to-image>"
