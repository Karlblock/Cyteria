# Cyteria - Quick Start Guide

## \ud83d\ude80 Pour lancer le jeu

1. **Installer Godot 4.2+**
   - T\u00e9l\u00e9charge depuis [godotengine.org](https://godotengine.org)
   - Prends la version Standard (pas .NET pour l'instant)

2. **Ouvrir le projet**
   ```bash
   cd cyteria-game
   # Ouvre project.godot avec Godot Engine
   ```

3. **Lancer le jeu**
   - Appuie sur F5 ou le bouton Play en haut \u00e0 droite
   - Le menu principal devrait appara\u00eetre

## \ud83c\udfae Contr\u00f4les

- **A/D** ou **Fl\u00e8ches** : Bouger gauche/droite  
- **W** ou **Espace** : Sauter
- **Clic gauche** : Attaquer (pas encore impl\u00e9ment\u00e9)
- **Echap** : Pause

## \ud83d\udee0\ufe0f Structure actuelle

```
cyteria-game/
\u251c\u2500\u2500 scenes/
\u2502   \u251c\u2500\u2500 main_menu.tscn      # Menu principal
\u2502   \u251c\u2500\u2500 player/Player.tscn  # Prefab du joueur
\u2502   \u2514\u2500\u2500 levels/TestLevel.tscn # Niveau de test
\u251c\u2500\u2500 scripts/
\u2502   \u251c\u2500\u2500 player/Player.gd    # Logique du joueur
\u2502   \u2514\u2500\u2500 ui/MainMenu.gd      # Logique du menu
\u2514\u2500\u2500 project.godot           # Config du projet
```

## \ud83d\udd28 Prochaines \u00e9tapes

1. **Cr\u00e9er les vrais sprites pixel art**
   - Personnage 48x64 pixels
   - Tiles de m\u00e9tro 32x32 pixels

2. **Ajouter les animations**
   - Idle, Run, Jump, Fall
   - Utiliser AnimatedSprite2D

3. **Setup blockchain**
   - Smart contracts pour les NFTs
   - Int\u00e9gration wallet

## \ud83d\udca1 Tips

- Active "Pixel Snap" dans Project Settings > Rendering
- Utilise la vue 2D (pas 3D) pour \u00e9diter les sc\u00e8nes
- F6 pour lancer la sc\u00e8ne actuelle directement

## \ud83d\udd27 Troubleshooting

**Le jeu ne lance pas ?**
- V\u00e9rifie que tu as Godot 4.2+
- Assure-toi d'avoir ouvert project.godot

**Personnage tombe dans le vide ?**
- V\u00e9rifie les collision layers
- Le sol doit \u00eatre sur layer 1

**Erreurs de script ?**
- V\u00e9rifie la console Godot
- Les chemins sont case-sensitive