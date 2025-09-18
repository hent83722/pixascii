#!/usr/bin/env bash
set -e

REPO_URL="https://raw.githubusercontent.com/hent83722/pixascii/main"

echo "[*] Installing pixascii..."

# Make sure Pillow is installed
if command -v pacman >/dev/null 2>&1; then
  echo "[*] Detected Arch Linux"
  sudo pacman -S --noconfirm python-pillow
else
  echo "[*] Installing Pillow via pip"
  python3 -m pip install --user pillow
fi

# Download the script
echo "[*] Downloading pixascii.py..."
curl -s -L "$REPO_URL/pixascii.py" -o /tmp/pixascii.py

# Install it to /usr/local/bin
sudo mv /tmp/pixascii.py /usr/local/bin/pixascii
sudo chmod +x /usr/local/bin/pixascii

echo "[✓] pixascii installed!"
echo "Run it with: pixascii <path-to-image>"
