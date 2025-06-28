#!/usr/bin/env python3
"""
Générateur de sprites pixel art pour Cyteria
Crée des sprites 32x32 pour les tiles et 48x64 pour les personnages
"""

from PIL import Image, ImageDraw
import os

# Assure-toi que le dossier de sortie existe
os.makedirs("cyteria-game/assets/sprites/generated", exist_ok=True)

# Palette de couleurs Cyteria
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
    'neon_blue': (153, 153, 204),
    'metal_gray': (89, 89, 89),
    'concrete': (64, 64, 64)
}

def create_pixel_sprite(width, height, name, draw_func):
    """Crée un sprite avec une fonction de dessin"""
    img = Image.new('RGBA', (width, height), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    draw_func(draw, width, height)
    
    # Sauvegarde avec scaling x4 pour la visibilité
    scaled = img.resize((width*4, height*4), Image.NEAREST)
    scaled.save(f"cyteria-game/assets/sprites/generated/{name}_preview.png")
    
    # Sauvegarde la version originale pour le jeu
    img.save(f"cyteria-game/assets/sprites/generated/{name}.png")
    print(f"✅ Créé: {name}.png ({width}x{height})")

def draw_player_idle(draw, w, h):
    """Dessine le joueur (48x64) - stance idle"""
    # Corps principal
    draw.rectangle([16, 16, 32, 48], fill=COLORS['medium_gray'])  # Torse
    draw.rectangle([20, 48, 28, 60], fill=COLORS['dark_gray'])    # Jambes
    
    # Tête avec casque
    draw.rectangle([18, 8, 30, 20], fill=COLORS['light_gray'])    # Casque
    draw.rectangle([20, 10, 28, 18], fill=COLORS['concrete'])     # Visage
    
    # Yeux lumineux (cyberpunk)
    draw.rectangle([22, 12, 24, 14], fill=COLORS['neon_green'])   # Œil gauche
    draw.rectangle([26, 12, 28, 14], fill=COLORS['neon_green'])   # Œil droit
    
    # Équipement
    draw.rectangle([12, 20, 16, 44], fill=COLORS['rust_red'])     # Bras gauche
    draw.rectangle([32, 20, 36, 44], fill=COLORS['rust_red'])     # Bras droit
    draw.rectangle([18, 44, 30, 48], fill=COLORS['metal_gray'])   # Ceinture
    
    # Détails tech
    draw.rectangle([24, 24, 26, 28], fill=COLORS['electric_blue']) # LED poitrine

def draw_mutant_rat(draw, w, h):
    """Dessine un rat mutant (32x24)"""
    # Corps principal
    draw.ellipse([4, 8, 28, 20], fill=COLORS['rust_red'])
    
    # Tête
    draw.ellipse([2, 6, 14, 16], fill=COLORS['rust_red'])
    
    # Yeux rouges mutants
    draw.rectangle([4, 8, 6, 10], fill=COLORS['alarm_red'])
    draw.rectangle([8, 8, 10, 10], fill=COLORS['alarm_red'])
    
    # Queue
    draw.ellipse([26, 10, 30, 14], fill=COLORS['dark_gray'])
    
    # Pattes
    draw.rectangle([8, 18, 10, 22], fill=COLORS['dark_gray'])
    draw.rectangle([12, 18, 14, 22], fill=COLORS['dark_gray'])
    draw.rectangle([18, 18, 20, 22], fill=COLORS['dark_gray'])
    draw.rectangle([22, 18, 24, 22], fill=COLORS['dark_gray'])

def draw_floor_tile(draw, w, h):
    """Tile de sol en béton (32x32)"""
    # Base béton
    draw.rectangle([0, 0, 32, 32], fill=COLORS['concrete'])
    
    # Fissures et détails
    draw.line([(4, 8), (12, 16)], fill=COLORS['dark_gray'], width=1)
    draw.line([(20, 4), (28, 12)], fill=COLORS['dark_gray'], width=1)
    
    # Taches
    draw.rectangle([8, 20, 12, 24], fill=COLORS['medium_gray'])
    draw.rectangle([24, 24, 28, 28], fill=COLORS['gray'])

def draw_wall_tile(draw, w, h):
    """Tile de mur (32x32)"""
    # Base mur
    draw.rectangle([0, 0, 32, 32], fill=COLORS['gray'])
    
    # Briques
    for y in range(0, 32, 8):
        for x in range(0, 32, 16):
            offset = 8 if (y // 8) % 2 else 0
            draw.rectangle([x + offset, y, x + offset + 14, y + 6], 
                         fill=COLORS['medium_gray'], outline=COLORS['dark_gray'])

def draw_rail_tile(draw, w, h):
    """Rail de métro (32x32)"""
    # Base
    draw.rectangle([0, 0, 32, 32], fill=COLORS['dark_gray'])
    
    # Traverses en bois
    draw.rectangle([0, 12, 32, 20], fill=COLORS['rust_red'])
    
    # Rails métalliques
    draw.rectangle([8, 14, 10, 18], fill=COLORS['light_gray'])
    draw.rectangle([22, 14, 24, 18], fill=COLORS['light_gray'])

def draw_toxic_tile(draw, w, h):
    """Flaque toxique (32x32)"""
    # Base liquide
    draw.ellipse([2, 10, 30, 22], fill=COLORS['toxic_green'])
    
    # Bulles
    draw.ellipse([8, 12, 12, 16], fill=COLORS['neon_green'])
    draw.ellipse([20, 14, 22, 16], fill=COLORS['neon_green'])
    draw.ellipse([16, 18, 18, 20], fill=COLORS['neon_green'])

def draw_metal_pipe(draw, w, h):
    """Tuyau métallique (32x32)"""
    # Tuyau principal
    draw.rectangle([4, 8, 28, 24], fill=COLORS['metal_gray'])
    
    # Reflets
    draw.rectangle([6, 10, 26, 12], fill=COLORS['light_gray'])
    
    # Rouille
    draw.rectangle([12, 20, 16, 22], fill=COLORS['rust_red'])
    draw.rectangle([20, 14, 22, 18], fill=COLORS['rust_red'])

def draw_graffiti_wall(draw, w, h):
    """Mur avec graffiti (32x32)"""
    # Base mur
    draw.rectangle([0, 0, 32, 32], fill=COLORS['gray'])
    
    # Graffiti "CYTERIA"
    # C
    draw.rectangle([4, 8, 6, 16], fill=COLORS['neon_green'])
    draw.rectangle([4, 8, 8, 10], fill=COLORS['neon_green'])
    draw.rectangle([4, 14, 8, 16], fill=COLORS['neon_green'])
    
    # Y  
    draw.rectangle([10, 8, 12, 12], fill=COLORS['alarm_red'])
    draw.rectangle([14, 8, 16, 12], fill=COLORS['alarm_red'])
    draw.rectangle([12, 12, 14, 16], fill=COLORS['alarm_red'])

def draw_rusty_weapon(draw, w, h):
    """Barre de fer rouillée (16x16)"""
    # Manche
    draw.rectangle([6, 12, 8, 16], fill=COLORS['rust_red'])
    
    # Lame/barre
    draw.rectangle([6, 2, 10, 12], fill=COLORS['metal_gray'])
    
    # Rouille
    draw.rectangle([8, 4, 10, 6], fill=COLORS['rust_red'])
    draw.rectangle([6, 8, 8, 10], fill=COLORS['rust_red'])

# Génère tous les sprites
sprites = [
    # Personnages (48x64)
    (48, 64, "player_idle", draw_player_idle),
    
    # Ennemis (32x24)
    (32, 24, "mutant_rat", draw_mutant_rat),
    
    # Tiles environnement (32x32)
    (32, 32, "floor_concrete", draw_floor_tile),
    (32, 32, "wall_brick", draw_wall_tile),
    (32, 32, "rail_track", draw_rail_tile),
    (32, 32, "toxic_pool", draw_toxic_tile),
    (32, 32, "metal_pipe", draw_metal_pipe),
    (32, 32, "graffiti_wall", draw_graffiti_wall),
    
    # Items (16x16)
    (16, 16, "weapon_pipe", draw_rusty_weapon),
]

print("🎨 Génération des sprites Cyteria...")
print("=" * 40)

for width, height, name, draw_func in sprites:
    create_pixel_sprite(width, height, name, draw_func)

print("=" * 40)
print(f"✅ {len(sprites)} sprites créés dans cyteria-game/assets/sprites/generated/")
print("📂 Fichiers _preview.png pour visualiser")
print("📂 Fichiers .png pour le jeu")
print("\n🎮 Prochaine étape : Importer dans Godot et créer les animations !")