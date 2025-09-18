# PixASCII

PixASCII is a Python-based tool that converts images into ASCII art. It works **universally** on Linux, macOS, and Windows as long as Python 3 and Pillow are installed.

---

## Features

- Convert images to ASCII art
- Resize images for better ASCII output
- Save ASCII art to a text file or print to terminal
- Cross-platform: Linux, macOS, Windows

---

## Requirements

- Python 3.7 or higher
- Pillow library

Install Pillow if you don’t have it:

```bash
pip install Pillow
```
# Installation (Universal Method)

# Clone or download this repository.

```bash
git clone https://github.com/hent83722/pixascii
```

# Make the Python script executable:

```bash
chmod +x pixascii.py
```

## (Optional) Make it a global command on Linux/macOS:

```bash
mkdir -p ~/.local/bin
cp pixascii.py ~/.local/bin/pixascii
chmod +x ~/.local/bin/pixascii
```

## Make sure ~/.local/bin is in your PATH:

```bash
echo 'export PATH=$HOME/.local/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
```

## Now you can run pixascii from anywhere.

# Using the provided install script (Linux/macOS)

```bash
chmod +x install.sh
./install.sh
```

This will:

Copy pixascii.py to ~/.local/bin/pixascii

Make it executable

Ensure ~/.local/bin is in your PATH

# Usage

### Basic usage:

```bash
pixascii <image_path> [-w WIDTH] [-o OUTPUT_FILE]
```
## Options

<image_path>: Path to the input image (required)

-w WIDTH: Width of the ASCII output (default: 100)

-o OUTPUT_FILE: File to save the ASCII art (optional, prints to terminal if not provided)


## Examples

### Print ASCII art to terminal:

```bash
pixascii /home/user/Pictures/photo.png -w 120
```
### Save ASCII art to a file:

```bash
pixascii /home/user/Pictures/photo.png -w 120 -o ascii_output.txt
```

# Notes

Adjust WIDTH to fit your terminal or desired output size.

If the output looks stretched, try changing the width or modifying the ASCII_CHARS in the script.

On Linux, make sure you refresh your shell if you previously installed an older version:

```bash
hash -r
```

# License 
This project is open-source and free to use. See the LICENSE file for details.
