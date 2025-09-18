#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import os
from PIL import Image

# ASCII characters from dark to light
ASCII_CHARS = "@%#*+=-:. "

def resize_image(image, new_width=100):
    width, height = image.size
    ratio = height / width / 1.65  # tweak for character aspect ratio
    new_height = int(new_width * ratio)
    return image.resize((new_width, new_height))

def grayify(image):
    return image.convert("L")

def pixels_to_ascii(image):
    pixels = image.getdata()
    return "".join(ASCII_CHARS[pixel // 25] for pixel in pixels)

def main(image_path, output_file=None, width=100):
    try:
        image = Image.open(image_path)
    except Exception as e:
        print(f"Unable to open image: {e}")
        return

    image = resize_image(image, new_width=width)
    image = grayify(image)

    ascii_str = pixels_to_ascii(image)
    img_width = image.width
    ascii_img = "\n".join(ascii_str[i:i+img_width] for i in range(0, len(ascii_str), img_width))

    if output_file:
        try:
            with open(output_file, "w") as f:
                f.write(ascii_img)
            print(f"ASCII art saved to {output_file}")
        except Exception as e:
            print(f"Error saving file: {e}")
    else:
        print(ascii_img)

if __name__ == "__main__":
    import argparse
    parser = argparse.ArgumentParser(description="Convert images to ASCII art")
    parser.add_argument("image", help="Path to input image")
    parser.add_argument("-o", "--output", help="File to save ASCII art")
    parser.add_argument("-w", "--width", type=int, default=100, help="Width of ASCII output")
    args = parser.parse_args()

    main(args.image, args.output, args.width)
