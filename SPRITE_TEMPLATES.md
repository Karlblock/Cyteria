# 🎨 Cyteria - Templates de Sprites Pixel Art

## 📐 Spécifications

- **Tiles**: 32x32 pixels
- **Personnages**: 48x64 pixels  
- **Items**: 16x16 pixels
- **Style**: Pixel art, palette sombre cyberpunk

## 🎨 Palette de Couleurs

```
Noir profond:    #0D0D0D
Gris foncé:      #1A1A1A  
Gris:            #333333
Gris moyen:      #4D4D4D
Gris clair:      #808080
Blanc cassé:     #B3B3B3

Vert toxique:    #4D7A4D
Vert néon:       #99CC99
Rouge rouille:   #7A4D4D
Rouge alarme:    #CC9999
Bleu électrique: #4D4D7A
Bleu néon:       #9999CC
```

## 👤 Joueur (48x64)

```
     ████████████
   ████▓▓▓▓▓▓▓▓████     # Casque gris clair
   ██▓▓░░██░░▓▓██       # Visage + yeux verts
   ████████████████     
     ██▒▒▒▒▒▒▒▒██       # Torse gris moyen
   ████▒▒░░▒▒████       # Bras + LED bleue
   ██▒▒▒▒▒▒▒▒▒▒██       
   ██▒▒████████▒▒██     # Ceinture métal
   ██▒▒██    ██▒▒██     
   ████        ████     # Jambes grises
   ████        ████
   ████        ████
```

**Couleurs:**
- ████ = Gris clair (casque/métal)
- ▓▓▓▓ = Gris foncé (ombres)
- ▒▒▒▒ = Gris moyen (vêtements)
- ░░░░ = Vert néon (yeux/LED)
- ████ = Bleu électrique (tech)

## 🐀 Rat Mutant (32x24)

```
  ██████████████
██████████████████       # Corps rouge rouille
██░░██░░██████████       # Yeux rouges
  ██████████████
    ████  ████           # Pattes
```

## 🧱 Tiles d'Environnement

### Sol Béton (32x32)
```
████████████████████████████████
██▓▓██▓▓██▓▓██▓▓██▓▓██▓▓██▓▓██
██░░██░░██░░██░░██░░██░░██░░██░░
████████████████████████████████
▓▓██▓▓██▓▓██▓▓██▓▓██▓▓██▓▓██▓▓
░░██░░██░░██░░██░░██░░██░░██░░██
████████████████████████████████
```

### Mur de Briques (32x32)
```
████████████████████████████████
██      ████      ████      ██
██      ████      ████      ██
████████████████████████████████
    ████      ████      ████
    ████      ████      ████
████████████████████████████████
```

### Rails de Métro (32x32)
```
████████████████████████████████
████████████████████████████████
    ████████████████████
    ████████████████████        # Traverse bois
    ████████████████████
██  ██              ██  ██     # Rails métal
██  ██              ██  ██
████████████████████████████████
```

### Graffiti "CYTERIA" (32x32)
```
████████████████████████████████
██  ████                      ██
██  ████  ██  ████  ██████    ██
██        ██    ██      ██    ██
██  ████  ████  ██      ██    ██
██  ████    ██  ██      ██    ██
████████████████████████████████
```

## 🔫 Armes & Items

### Barre de Fer (16x16)
```
    ████████
    ██░░░░██         # Métal avec rouille
    ██▓▓▓▓██
    ██░░░░██
    ██▓▓▓▓██
    ████████
      ████           # Manche
      ████
```

### Pistolet Bricolé (16x16)
```
████████████
██░░░░░░░░██         # Canon métal
██████████
  ████████           # Poignée
  ██▓▓▓▓██
  ████████
```

## 🎬 Animations Nécessaires

### Joueur
1. **Idle** (4 frames): Respiration légère, LED qui clignote
2. **Run** (6 frames): Course avec bras qui bougent
3. **Jump** (3 frames): Saut + atterrissage
4. **Attack** (4 frames): Coup de poing/arme

### Rat Mutant
1. **Idle** (2 frames): Queue qui bouge
2. **Run** (4 frames): Pattes qui courent
3. **Attack** (3 frames): Saut vers joueur
4. **Death** (4 frames): Tombe et disparaît

## 🛠️ Comment Créer

### Option 1: Aseprite (recommandé)
- Ouvre Aseprite
- Nouveau fichier 32x32 ou 48x64
- Utilise la palette ci-dessus
- Dessine pixel par pixel
- Exporte en PNG

### Option 2: GIMP/Photoshop
- Nouveau fichier avec pixels carrés
- Zoom x10 minimum
- Outil crayon 1px
- Grid 1x1 pixel visible

### Option 3: Outils en ligne
- Piskel.app (gratuit, navigateur)
- Lospec Pixel Editor
- GraphicsGale (gratuit)

## 📁 Organisation Fichiers

```
cyteria-game/assets/sprites/
├── characters/
│   ├── player_idle.png
│   ├── player_run_01.png
│   └── player_attack.png
├── enemies/
│   ├── rat_idle.png
│   └── rat_run_01.png
├── tiles/
│   ├── floor_concrete.png
│   ├── wall_brick.png
│   └── rail_track.png
└── items/
    ├── weapon_pipe.png
    └── weapon_pistol.png
```

---

**Prochaine étape**: Une fois qu'on a quelques sprites de base, on les intègre dans Godot et on crée les animations ! 🎮