# Cyteria - Guide de Style Artistique

## Direction Artistique : Pixel Art Urbain Sombre

### Pourquoi le Pixel Art ?

1. **Performance optimale** pour un jeu NFT accessible à tous
2. **Atmosphère underground** parfaite (voir Spelunky, Core Keeper)
3. **Développement rapide** des assets
4. **Nostalgie + Modernité** = Appeal large

### Spécifications Techniques

#### Résolution de Base
- **Tiles**: 32x32 pixels (double de Terraria pour plus de détails urbains)
- **Personnages**: 48x64 pixels
- **Items/Équipements**: 16x16 ou 32x32 pixels
- **Ennemis**: Variable selon taille (32x32 à 128x128)
- **UI Elements**: 16x16 pour icônes

#### Palette de Couleurs

##### Palette Principale - "Dystopie Urbaine"
```
#0D0D0D - Noir profond (ombres)
#1A1A1A - Gris très foncé (murs)
#333333 - Gris foncé (béton)
#4D4D4D - Gris moyen (métal)
#808080 - Gris clair (surfaces)
#B3B3B3 - Gris très clair (reflets)

#2E4D2E - Vert toxique foncé
#4D7A4D - Vert toxique
#99CC99 - Vert néon (radiations)

#4D2E2E - Rouge sang foncé
#7A4D4D - Rouge rouille
#CC9999 - Rouge alarme

#2E2E4D - Bleu électrique foncé
#4D4D7A - Bleu électrique
#9999CC - Bleu néon
```

### Style Visuel par Zone

#### 1. Tunnels de Métro
- Rails rouillés avec reflets métalliques
- Graffitis pixelisés sur les murs
- Lumières clignotantes (animation 3 frames)
- Particules de poussière flottantes

#### 2. Égouts
- Eau toxique animée (palette verte)
- Tuyaux avec fuites (particules)
- Mousse pixelisée sur les murs
- Brume verte semi-transparente

#### 3. Bunkers
- Béton texturé avec fissures
- Écrans cassés avec glitch effect
- Câbles pendants animés
- Lumières d'urgence rouges

### Assets Prioritaires

#### Semaine 1 - Tiles de Base
- [ ] Sol béton (variations x5)
- [ ] Murs métro (variations x8)
- [ ] Rails et traverses
- [ ] Plateforme de quai
- [ ] Échelles rouillées

#### Semaine 2 - Personnage
- [ ] Idle (4 frames)
- [ ] Marche (8 frames)
- [ ] Course (8 frames)
- [ ] Saut (3 frames)
- [ ] Attaque mêlée (6 frames)

#### Semaine 3 - Items NFT
- [ ] Barre de fer (Common)
- [ ] Pistolet rouillé (Common)
- [ ] Casque de chantier (Common)
- [ ] Veste pare-balles (Rare)
- [ ] Fusil d'assaut (Epic)

### Animations

#### Frame Rates
- **Personnage**: 12 FPS
- **Ennemis**: 8-10 FPS
- **Environnement**: 4-6 FPS
- **UI**: 2-4 FPS

#### Effets Spéciaux
- **Particules**: Système simple (poussière, étincelles, gouttes)
- **Lighting**: Faux éclairage dynamique avec overlays
- **Shaders**: Limités (water ripple, heat distortion)

### Guidelines NFT

#### Rarités Visuelles
- **Common**: Pas d'effets, couleurs ternes
- **Rare**: Légère lueur, +1 couleur accent
- **Epic**: Animation idle, particules subtiles
- **Legendary**: Aura animée, effets visuels
- **Mythic**: Transformation visuelle, multi-effets

#### Standardisation
- Tous les items même résolution par catégorie
- Bordure de couleur selon rareté
- Icon miniature 16x16 pour inventory

### Références Visuelles

#### Games à étudier
1. **Katana ZERO** - Ambiance urbaine pixel art
2. **Broforce** - Action et destructions
3. **Enter the Gungeon** - Items et effects
4. **Nuclear Throne** - Post-apo pixel art
5. **Hyper Light Drifter** - Couleurs néon

#### Mood Board Urbain
- Métros abandonnés de NYC/Paris
- Tchernobyl souterrain
- Kowloon Walled City
- Tunnels de maintenance industriels

### Outils Recommandés

#### Software
- **Aseprite** - Animation pixel art
- **GraphicsGale** - Alternative gratuite
- **Pixaki** (iPad) - Mobile creation

#### Plugins Godot
- **Pixel Perfect Camera**
- **2D Pixel Lighting**
- **Sprite Sheet Importer**

### Exemples de Sprites

```
BARRE DE FER (32x32)
████████████████
██░░░░░░░░░░░░██
██▓▓▓▓▓▓▓▓▓▓▓▓██
██▒▒▒▒▒▒▒▒▒▒▒▒██
████████████████

PERSONNAGE IDLE (48x64)
     ████████
   ██▓▓▓▓▓▓▓▓██
   ██▓▓████▓▓██
   ██████████████
     ██▒▒▒▒▒▒██
   ████▒▒▒▒▒▒████
   ██▒▒▒▒▒▒▒▒▒▒██
   ██▒▒██  ██▒▒██
   ████    ████
```

### Optimisation

#### Performance
- Sprite sheets max 2048x2048
- Palette indexée quand possible
- Réutilisation maximale des tiles

#### Compression
- PNG pour transparence
- Palette réduite par zone
- Atlas de textures par niveau