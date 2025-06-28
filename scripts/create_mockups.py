#!/usr/bin/env python3
from PIL import Image, ImageDraw, ImageFont
import os

# Create output directory
os.makedirs("mockups", exist_ok=True)

# Color palette
COLORS = {
    'black': (13, 13, 13),
    'dark_gray': (26, 26, 26),
    'gray': (51, 51, 51),
    'medium_gray': (77, 77, 77),
    'light_gray': (128, 128, 128),
    'white': (179, 179, 179),
    'toxic_green': (77, 122, 77),
    'neon_green': (153, 204, 153),
    'rust_red': (122, 77, 77),
    'alarm_red': (204, 153, 153),
    'electric_blue': (77, 77, 122),
    'neon_blue': (153, 153, 204)
}

# Tile size
TILE_SIZE = 32
SCREEN_WIDTH = 40  # tiles
SCREEN_HEIGHT = 22  # tiles

def create_gameplay_mockup():
    """Create main gameplay screen mockup"""
    width = SCREEN_WIDTH * TILE_SIZE  # 1280
    height = SCREEN_HEIGHT * TILE_SIZE  # 704
    
    img = Image.new('RGB', (width, height), COLORS['black'])
    draw = ImageDraw.Draw(img)
    
    # Draw metro tunnel background
    # Ceiling
    for x in range(0, width, TILE_SIZE):
        draw.rectangle([x, 0, x+TILE_SIZE, TILE_SIZE*3], fill=COLORS['dark_gray'])
        if x % (TILE_SIZE*4) == 0:  # Support beams
            draw.rectangle([x, 0, x+TILE_SIZE//2, TILE_SIZE*4], fill=COLORS['gray'])
    
    # Rails and floor
    floor_y = height - TILE_SIZE*6
    # Platform
    draw.rectangle([0, floor_y, width, floor_y+TILE_SIZE*2], fill=COLORS['gray'])
    # Rail bed
    draw.rectangle([0, floor_y+TILE_SIZE*2, width, height], fill=COLORS['dark_gray'])
    
    # Rails
    rail_y = floor_y + TILE_SIZE*2 + 8
    draw.rectangle([0, rail_y, width, rail_y+4], fill=COLORS['light_gray'])
    draw.rectangle([0, rail_y+20, width, rail_y+24], fill=COLORS['light_gray'])
    
    # Platform edge warning
    for x in range(0, width, TILE_SIZE*2):
        draw.rectangle([x, floor_y-4, x+TILE_SIZE, floor_y], fill=COLORS['alarm_red'])
    
    # Graffiti on walls
    draw.text((100, 200), "CYTERIA", fill=COLORS['toxic_green'])
    draw.text((500, 150), "DANGER", fill=COLORS['alarm_red'])
    
    # Broken lights (some on, some off)
    for x in range(TILE_SIZE*2, width, TILE_SIZE*8):
        if x % (TILE_SIZE*16) == 0:  # Working light
            # Light cone effect
            points = [(x+TILE_SIZE//2, TILE_SIZE*3), 
                      (x-TILE_SIZE*2, floor_y), 
                      (x+TILE_SIZE*2+TILE_SIZE, floor_y)]
            draw.polygon(points, fill=(77, 77, 50, 100))
            draw.rectangle([x, TILE_SIZE*3, x+TILE_SIZE, TILE_SIZE*3+16], fill=COLORS['neon_green'])
        else:  # Broken light
            draw.rectangle([x, TILE_SIZE*3, x+TILE_SIZE, TILE_SIZE*3+16], fill=COLORS['dark_gray'])
    
    # Player character (simple pixel art)
    player_x = 200
    player_y = floor_y - 48
    # Body
    draw.rectangle([player_x, player_y, player_x+32, player_y+48], fill=COLORS['medium_gray'])
    # Head
    draw.rectangle([player_x+8, player_y-16, player_x+24, player_y], fill=COLORS['light_gray'])
    # Eyes (glowing)
    draw.rectangle([player_x+10, player_y-12, player_x+14, player_y-8], fill=COLORS['neon_green'])
    draw.rectangle([player_x+18, player_y-12, player_x+22, player_y-8], fill=COLORS['neon_green'])
    
    # Enemy - Mutant rat
    enemy_x = 600
    enemy_y = floor_y - 24
    # Body
    draw.ellipse([enemy_x, enemy_y, enemy_x+48, enemy_y+24], fill=COLORS['rust_red'])
    # Eyes
    draw.rectangle([enemy_x+8, enemy_y+4, enemy_x+12, enemy_y+8], fill=COLORS['alarm_red'])
    draw.rectangle([enemy_x+16, enemy_y+4, enemy_x+20, enemy_y+8], fill=COLORS['alarm_red'])
    # Tail
    draw.arc([enemy_x+40, enemy_y+8, enemy_x+64, enemy_y+24], 180, 0, fill=COLORS['rust_red'], width=3)
    
    # UI Overlay
    # Health bar
    draw.rectangle([20, 20, 220, 40], fill=COLORS['dark_gray'], outline=COLORS['gray'])
    draw.rectangle([22, 22, 22+150, 38], fill=COLORS['alarm_red'])
    draw.text((25, 25), "HEALTH", fill=COLORS['white'])
    
    # Item slots
    for i in range(5):
        x = width - 300 + i*55
        draw.rectangle([x, 20, x+50, 70], fill=COLORS['dark_gray'], outline=COLORS['gray'])
        if i == 0:  # Equipped weapon
            # Simple gun icon
            draw.rectangle([x+10, 35, x+40, 45], fill=COLORS['light_gray'])
            draw.rectangle([x+15, 45, x+25, 55], fill=COLORS['medium_gray'])
    
    # Toxic waste puddles
    draw.ellipse([400, floor_y-8, 480, floor_y+8], fill=COLORS['toxic_green'])
    draw.ellipse([420, floor_y-4, 460, floor_y+4], fill=COLORS['neon_green'])
    
    img.save('mockups/gameplay_metro_tunnel.png')
    print("Created: mockups/gameplay_metro_tunnel.png")

def create_item_showcase():
    """Create NFT items showcase"""
    width = 800
    height = 600
    
    img = Image.new('RGB', (width, height), COLORS['black'])
    draw = ImageDraw.Draw(img)
    
    # Title
    draw.text((width//2-50, 20), "CYTERIA ITEMS", fill=COLORS['neon_green'])
    
    items = [
        # (name, x, y, color, rarity_color)
        ("Rusty Pipe", 100, 100, COLORS['medium_gray'], COLORS['gray']),
        ("Toxic Pistol", 300, 100, COLORS['toxic_green'], COLORS['neon_green']),
        ("Security Helmet", 500, 100, COLORS['electric_blue'], COLORS['neon_blue']),
        ("Scrap Armor", 100, 300, COLORS['rust_red'], COLORS['medium_gray']),
        ("Plasma Rifle", 300, 300, COLORS['neon_blue'], COLORS['neon_green']),
        ("Hacker Toolkit", 500, 300, COLORS['neon_green'], COLORS['alarm_red'])
    ]
    
    for name, x, y, main_color, rarity_color in items:
        # Item frame
        draw.rectangle([x-5, y-5, x+69, y+69], fill=rarity_color)
        draw.rectangle([x, y, x+64, y+64], fill=COLORS['dark_gray'])
        
        # Simple item representation
        if "Pipe" in name:
            draw.rectangle([x+16, y+8, x+48, y+56], fill=main_color)
        elif "Pistol" in name or "Rifle" in name:
            draw.rectangle([x+8, y+24, x+48, y+36], fill=main_color)
            draw.rectangle([x+16, y+36, x+28, y+48], fill=COLORS['dark_gray'])
        elif "Helmet" in name:
            draw.arc([x+16, y+16, x+48, y+48], 0, 180, fill=main_color, width=8)
        elif "Armor" in name:
            draw.rectangle([x+12, y+12, x+52, y+44], fill=main_color)
            draw.rectangle([x+8, y+16, x+12, y+32], fill=main_color)
            draw.rectangle([x+52, y+16, x+56, y+32], fill=main_color)
        elif "Toolkit" in name:
            draw.rectangle([x+16, y+16, x+48, y+48], fill=COLORS['dark_gray'])
            draw.rectangle([x+20, y+20, x+44, y+44], fill=main_color)
        
        # Item name
        draw.text((x, y+70), name, fill=COLORS['white'])
    
    img.save('mockups/nft_items_showcase.png')
    print("Created: mockups/nft_items_showcase.png")

def create_underground_areas():
    """Create different underground area concepts"""
    width = 1280
    height = 400
    
    img = Image.new('RGB', (width, height), COLORS['black'])
    draw = ImageDraw.Draw(img)
    
    # Area 1: Sewer
    section_width = width // 4
    # Curved tunnel
    draw.arc([0, 50, section_width, 350], 90, 270, fill=COLORS['dark_gray'], width=40)
    # Toxic water
    draw.rectangle([20, 300, section_width-20, 380], fill=COLORS['toxic_green'])
    # Pipes
    for y in range(100, 300, 60):
        draw.rectangle([0, y, 80, y+30], fill=COLORS['gray'])
    draw.text((section_width//2-20, 20), "SEWERS", fill=COLORS['toxic_green'])
    
    # Area 2: Maintenance tunnels
    x_offset = section_width
    # Industrial walls
    for x in range(x_offset, x_offset+section_width, 40):
        draw.rectangle([x, 50, x+35, 350], fill=COLORS['gray'], outline=COLORS['dark_gray'])
    # Cables
    for i in range(3):
        y = 80 + i*40
        draw.line([(x_offset, y), (x_offset+section_width, y+20)], fill=COLORS['alarm_red'], width=3)
    draw.text((x_offset+section_width//2-40, 20), "MAINTENANCE", fill=COLORS['alarm_red'])
    
    # Area 3: Bunker
    x_offset = section_width * 2
    # Concrete blocks
    for x in range(x_offset, x_offset+section_width, 80):
        for y in range(50, 350, 60):
            draw.rectangle([x, y, x+75, y+55], fill=COLORS['medium_gray'], outline=COLORS['dark_gray'])
    # Security door
    draw.rectangle([x_offset+section_width//2-30, 150, x_offset+section_width//2+30, 300], 
                   fill=COLORS['electric_blue'], outline=COLORS['neon_blue'], width=3)
    draw.text((x_offset+section_width//2-20, 20), "BUNKER", fill=COLORS['electric_blue'])
    
    # Area 4: Abandoned station
    x_offset = section_width * 3
    # Platform
    draw.rectangle([x_offset, 250, width, 300], fill=COLORS['gray'])
    # Pillars
    for x in range(x_offset+40, width, 120):
        draw.rectangle([x, 50, x+40, 250], fill=COLORS['medium_gray'])
    # Broken tiles
    for x in range(x_offset, width, 30):
        if x % 60 == 0:
            draw.rectangle([x, 300, x+25, 350], fill=COLORS['dark_gray'])
        else:
            draw.rectangle([x, 300, x+25, 350], fill=COLORS['gray'])
    draw.text((x_offset+section_width//2-30, 20), "STATION", fill=COLORS['light_gray'])
    
    img.save('mockups/underground_areas_concept.png')
    print("Created: mockups/underground_areas_concept.png")

def create_ui_mockup():
    """Create UI/HUD mockup"""
    width = 1280
    height = 720
    
    img = Image.new('RGB', (width, height), (20, 20, 20))
    draw = ImageDraw.Draw(img)
    
    # Main game area indicator
    draw.rectangle([40, 40, width-40, height-120], fill=COLORS['black'], outline=COLORS['gray'])
    draw.text((width//2-40, height//2), "GAME VIEW", fill=COLORS['dark_gray'])
    
    # Top HUD
    # Health
    draw.rectangle([50, 50, 250, 90], fill=COLORS['dark_gray'], outline=COLORS['gray'])
    draw.rectangle([55, 55, 200, 85], fill=COLORS['alarm_red'])
    draw.text((60, 60), "HP: 75/100", fill=COLORS['white'])
    
    # Crypto wallet
    draw.rectangle([width-250, 50, width-50, 90], fill=COLORS['dark_gray'], outline=COLORS['gray'])
    draw.text((width-240, 60), "0x1234...5678", fill=COLORS['neon_green'])
    
    # Bottom inventory
    y_inv = height - 100
    # Item slots
    for i in range(10):
        x = 50 + i * 70
        if i < 5:  # Equipped items
            draw.rectangle([x, y_inv, x+60, y_inv+60], fill=COLORS['medium_gray'], outline=COLORS['neon_blue'])
        else:  # Inventory
            draw.rectangle([x, y_inv, x+60, y_inv+60], fill=COLORS['dark_gray'], outline=COLORS['gray'])
        
        # Hotkey numbers
        draw.text((x+5, y_inv+5), str((i+1)%10), fill=COLORS['white'])
    
    # NFT indicator on special items
    draw.rectangle([120, y_inv, 180, y_inv+60], fill=COLORS['dark_gray'], outline=COLORS['neon_green'])
    draw.text((125, y_inv+25), "NFT", fill=COLORS['neon_green'])
    
    # Mini map
    map_x = width - 200
    map_y = 110
    draw.rectangle([map_x, map_y, map_x+150, map_y+150], fill=COLORS['dark_gray'], outline=COLORS['gray'])
    draw.text((map_x+50, map_y+5), "SECTOR 7", fill=COLORS['white'])
    # Player position
    draw.rectangle([map_x+70, map_y+70, map_x+80, map_y+80], fill=COLORS['neon_green'])
    
    img.save('mockups/ui_hud_concept.png')
    print("Created: mockups/ui_hud_concept.png")

# Create all mockups
print("Creating Cyteria mockups...")
create_gameplay_mockup()
create_item_showcase()
create_underground_areas()
create_ui_mockup()
print("\nAll mockups created in 'mockups/' directory!")