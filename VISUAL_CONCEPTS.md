# Cyteria - Concepts Visuels

## 🎮 Vue Principale du Gameplay

### Tunnel de Métro Abandonné
```
┌──────────────────────────────────────────────────────────────┐
│░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░│ Plafond sombre
│▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓│ Poutres métalliques
│██░░██░░░░░░░░░░██░░░💡░░░░░░░██░░░░░░░░░░██░░░░❌░░░░░░░██│ Lumières (certaines cassées)
│                                                              │
│        CYTERIA          ☠ DANGER ☠                          │ Graffitis
│                                                              │
│                    🧍                        🐀              │ Joueur vs Rat mutant
│═══════════════════════════════════════════════════════════════│ Quai
│▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓│ Sol du tunnel
│━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━│ Rails
└──────────────────────────────────────────────────────────────┘

HUD:
┌─────────────┐                                    ┌──────────────┐
│ HP: ████░░░ │                                    │ 0x1234...5678│
└─────────────┘                                    └──────────────┘
                                                   
[1:🔧][2:🔫][3:🛡️][4:💊][5:📦] [6:][7:][8:][9:][0:]  Inventaire
```

### Palette de Couleurs
- **Noir profond** (#0D0D0D) : Zones d'ombre
- **Gris foncé** (#333333) : Murs de béton
- **Vert toxique** (#4D7A4D) : Déchets, radiations
- **Rouge alarme** (#CC9999) : Dangers, UI santé
- **Bleu électrique** (#9999CC) : Tech, énergie

## 🎨 Items NFT (32x32 pixels chacun)

### Common (Bordure grise)
```
┌────────┐  ┌────────┐  ┌────────┐
│  ███   │  │ ▄▄▄▄▄▄ │  │  ▄▄▄▄  │
│  ███   │  │ ██▄▄▄▄ │  │ ██████ │
│  ███   │  │   ██   │  │ ▀▀▀▀▀▀ │
└────────┘  └────────┘  └────────┘
Barre Fer   Pistolet    Casque
```

### Rare (Bordure verte)
```
┌────────┐  ┌────────┐  ┌────────┐
│  ⚡███⚡ │  │ ▄▄▄▄▄▄ │  │ ╔════╗ │
│  ⚡███⚡ │  │ ██▄▄▄▄ │  │ ║████║ │
│  ⚡███⚡ │  │ ✨██✨  │  │ ╚════╝ │
└────────┘  └────────┘  └────────┘
Batte Élec  Pistolet+   Kit Hack
```

### Epic/Legendary (Bordure animée + particules)
```
┌────────┐  ┌────────┐  ┌────────┐
│✨⚔️✨│  │🔥▄▄▄▄🔥│  │⚡▄██▄⚡│
│ ⚔️⚔️⚔️ │  │ ████▄▄ │  │ █████ │
│✨⚔️✨│  │🔥 ██ 🔥│  │⚡▀██▀⚡│
└────────┘  └────────┘  └────────┘
Lame Plasma Fusil Plasma Armure Énergie
```

## 🌆 Zones Souterraines

### 1. Égouts (Thème toxique)
```
     ╱╲___╱╲        Tunnels courbes
   ╱🟢 ╲_╱ 🟢╲      Flaques toxiques
  │ ═══════ │      Tuyaux
  │ ≈≈≈≈≈≈≈ │      Eau contaminée
```

### 2. Bunker Militaire (Thème sécurité)
```
  ████████████      Béton renforcé
  █ 🔴 ██ 🔴 █      Systèmes sécurité
  █ ╔═══╗   █      Portes blindées
  ████████████      
```

### 3. Station Abandonnée (Thème urbain décrépit)
```
  ║ ║    ║ ║       Colonnes
  ═══════════       Quai fissuré
  ░░░██░░░██░      Carrelage cassé
```

## 🎯 Direction Artistique

### Style Pixel Art
- **Résolution** : 32x32 pour tiles, 48x64 pour personnages
- **Animation** : 8-12 FPS pour fluidité
- **Éclairage** : Zones d'ombre prononcées, sources lumineuses limitées

### Ambiance
- **Oppressante** : Espaces confinés, peu de lumière
- **Post-apocalyptique** : Tout est rouillé, cassé, dangereux
- **Cyberpunk underground** : Néons dans l'obscurité, tech abandonnée

### Références Visuelles
1. **Metro 2033** - Pour l'ambiance souterraine
2. **Katana ZERO** - Pour le pixel art urbain stylisé
3. **Dead Cells** - Pour les effets et animations fluides
4. **Hyper Light Drifter** - Pour les effets néon

## 📱 Interface Utilisateur

### HUD Minimaliste
```
┌─ SANTÉ ──────┐         ┌─ WALLET ─────┐
│ ████████░░░░ │         │ 0x1234...   │
│ 75/100       │         │ 250 $CYTR   │
└──────────────┘         └──────────────┘

     ┌─ MAP ─┐
     │  ░█░  │  █ = Joueur
     │ ░░░░░ │  ░ = Exploré
     └───────┘
```

### Inventaire NFT
```
╔═══ ÉQUIPÉ ═══╗  ╔═══ INVENTAIRE ═══╗
║ [1] 🔫 RARE  ║  ║ [6] 💊 Common   ║
║ [2] 🛡️ EPIC  ║  ║ [7] 🔧 Common   ║
║ [3] 👕 RARE  ║  ║ [8] 📦 Mystery  ║
║ [4] 👟 LEGEND║  ║ [9] 🗝️ Rare     ║
║ [5] ⛑️ COMMON║  ║ [0] 💰 $CYTR    ║
╚══════════════╝  ╚═════════════════╝
```

## 🎬 Écrans Spéciaux

### Marketplace Intégré
```
╔═══════════ CYTERIA MARKETPLACE ═══════════╗
║                                           ║
║  🔫 Toxic Pistol      🛡️ Riot Shield     ║
║  ▄▄▄▄▄▄              ████████            ║
║  ██▄▄▄▄              ████████            ║
║    ██                ████████            ║
║  250 $CYTR           1,500 $CYTR         ║
║  [ACHETER]           [ACHETER]            ║
║                                           ║
║  📊 Historique: ↗️ +15% cette semaine     ║
╚═══════════════════════════════════════════╝
```

Ces concepts montrent l'ambiance sombre et urbaine du jeu, avec des éléments NFT intégrés naturellement dans l'interface.