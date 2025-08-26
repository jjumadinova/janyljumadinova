#!/usr/bin/env python3
"""
Favicon Generator for janyljumadinova.com
Creates PNG and ICO favicons from SVG source matching the website's color scheme
"""

from PIL import Image, ImageDraw, ImageFont
import os

def create_favicon():
    """Create favicon in multiple formats with JJ initials"""
    
    # Create a 32x32 image with black background
    size = 32
    img = Image.new('RGBA', (size, size), (0, 0, 0, 255))  # Black background
    draw = ImageDraw.Draw(img)
    
    # Draw white border circle
    border_width = 1
    draw.ellipse([border_width, border_width, size-border_width-1, size-border_width-1], 
                outline=(255, 255, 255, 255), width=border_width)
    
    # Try to use a system font, fallback to default
    try:
        font = ImageFont.truetype("/System/Library/Fonts/Arial.ttf", 14)
    except:
        try:
            font = ImageFont.truetype("arial.ttf", 14)
        except:
            font = ImageFont.load_default()
    
    # Draw "JJ" text in coral red color
    text = "JJ"
    # Calculate text position to center it
    bbox = draw.textbbox((0, 0), text, font=font)
    text_width = bbox[2] - bbox[0]
    text_height = bbox[3] - bbox[1]
    
    x = (size - text_width) // 2
    y = (size - text_height) // 2 - 1  # Adjust slightly for better centering
    
    # Use the same coral red as in the CSS (#ff6b6b)
    coral_red = (255, 107, 107, 255)
    draw.text((x, y), text, fill=coral_red, font=font)
    
    return img

def main():
    """Generate favicon files"""
    favicon_dir = "/Users/janyljumadinova/repos/janyljumadinova/static/img"
    
    # Create the favicon image
    favicon_img = create_favicon()
    
    # Save as PNG
    png_path = os.path.join(favicon_dir, "favicon.png")
    favicon_img.save(png_path, "PNG")
    print(f"✅ Created PNG favicon: {png_path}")
    
    # Save as ICO (create multiple sizes for better compatibility)
    ico_path = os.path.join(favicon_dir, "favicon.ico")
    
    # Create multiple sizes for ICO
    sizes = [16, 24, 32, 48]
    ico_images = []
    
    for size in sizes:
        # Resize the base image
        resized = favicon_img.resize((size, size), Image.Resampling.LANCZOS)
        ico_images.append(resized)
    
    # Save as ICO with multiple sizes
    ico_images[0].save(ico_path, format='ICO', sizes=[(img.width, img.height) for img in ico_images])
    print(f"✅ Created ICO favicon: {ico_path}")
    print(f"📏 ICO contains sizes: {[f'{img.width}x{img.height}' for img in ico_images]}")
    
    print("\n🎨 Favicon created with your website's color scheme:")
    print("   • Black background (#000000)")
    print("   • White border (#ffffff)")
    print("   • Coral red 'JJ' text (#ff6b6b)")
    print("\n✨ Your favicon now matches your accessibility-compliant design!")

if __name__ == "__main__":
    main()
