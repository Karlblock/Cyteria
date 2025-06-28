# 🎮 Guide de Test - Cyteria v0.1

## 🚀 Lancement Rapide

### 1. Ouvrir Godot
```bash
# Si Godot est dans ton PATH
godot cyteria-game/project.godot

# Sinon, ouvre Godot manuellement et charge le projet
```

### 2. Lancer le Jeu
- Appuie sur **F5** ou clique sur le bouton **▶️ Play** en haut à droite
- Le menu principal apparaît

### 3. Choisir le Niveau
- **"Play - Metro Station"** : Le nouveau niveau atmosphérique
- Pour changer : Clique sur "Settings" (ça change le niveau)
- Clique sur "Play" pour jouer

## 🎯 Ce qu'il faut tester

### Dans la Station de Métro
1. **Exploration**
   - La map est GRANDE (80x30 tiles)
   - Cherche les rats mutants rouges
   - Évite les flaques vertes toxiques

2. **Combat**
   - Approche-toi d'un rat
   - Clique pour attaquer (portée courte)
   - Regarde ta barre de vie en bas

3. **Dangers**
   - Marche dans une flaque verte
   - Tu prends des dégâts continus !
   - Les chiffres de dégâts flottent

4. **Ambiance**
   - Note l'éclairage sombre
   - Les détails des murs (graffitis)
   - La structure de la station

## 🎮 Contrôles Rappel

```
Déplacement : WASD ou Flèches
Saut        : Espace
Attaque     : Clic Gauche
Pause       : Échap
```

## 📊 État Actuel

### ✅ Fonctionnel
- Système de combat complet
- IA des ennemis (ils te chassent !)
- Génération procédurale de niveau
- Hazards environnementaux
- UI de santé

### ⚠️ Placeholder
- Graphismes = rectangles colorés
- Pas d'animations
- Pas de sons
- Pas de sprites pixel art

### 🐛 Bugs Connus
- Les rats peuvent se bloquer dans les coins
- La collision n'est pas parfaite
- Pas de respawn après la mort

## 💡 Choses à Noter

1. **Performance** : Le jeu devrait tourner à 60 FPS
2. **Taille** : La map est plus grande que l'écran, explore !
3. **Difficulté** : 4-5 rats + flaques toxiques
4. **Feedback** : Tout s'affiche dans la console Godot

## 🔍 Debug Info

Dans la console Godot, tu verras :
- "Hit MutantRat for 25 damage!"
- "Health: 85/100"
- "Rat died!"
- "Player died!"

---

**IMPORTANT** : C'est une v0.1 - Le gameplay fonctionne mais c'est moche visuellement. L'important c'est que tous les systèmes marchent !