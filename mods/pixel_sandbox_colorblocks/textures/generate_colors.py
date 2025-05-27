# by FromKaniv
# 2025

from PIL import Image, ImageDraw

colors = {
    "red": (255, 0, 0),
    "blue": (0, 0, 255),
    "yellow": (255, 255, 0),
    "green": (0, 255, 0),
    "orange": (255, 165, 0),
    "purple": (128, 0, 128),
    "black": (20, 20, 20),
    "white": (240, 240, 240)
}

size = 32

for name, rgb in colors.items():
    img = Image.new("RGB", (size, size), rgb)
    draw = ImageDraw.Draw(img)

    border_color = tuple(max(0, c - 50) for c in rgb)
    for x in range(size):
        draw.point((x, 0), border_color)
        draw.point((x, size-1), border_color)
    for y in range(size):
        draw.point((0, y), border_color)
        draw.point((size-1, y), border_color)

    img.save(f"pixel_sandbox_colorblocks_{name}.png")
