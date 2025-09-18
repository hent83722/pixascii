#!/usr/bin/python3
import sys
from PIL import Image

ASCII_CHARS = ["@", "#", "S", "%", "?", "*", "+", ";", ":", ",", "."]

def resize_image(image, new_width=80):
    width, height = image.size
    aspect_ratio = height / width
    new_height = int(aspect_ratio * new_width * 0.55)
    return image.resize((new_width, new_height))

def grayify(image):
    return image.convert("L")

def pixels_to_ascii(image):
    pixels = image.getdata()
    ascii_str = "".join([ASCII_CHARS[pixel // 25] for pixel in pixels])
    return ascii_str

def image_to_ascii(image_path, new_width=80):
    try:
        image = Image.open(image_path)
    except Exception as e:
        print(f"Error opening image: {e}")
        return
    
    image = resize_image(image, new_width)
    image = grayify(image)

    ascii_str = pixels_to_ascii(image)
    pixel_count = len(ascii_str)
    
    ascii_img = "\n".join([ascii_str[i:(i+new_width)] for i in range(0, pixel_count, new_width)])
    print(ascii_img)

def main():
    if len(sys.argv) < 2:
        print("Usage: pixascii <path-to-image>")
        sys.exit(1)
    
    path = sys.argv[1]
    image_to_ascii(path)

if __name__ == "__main__":
    main()

