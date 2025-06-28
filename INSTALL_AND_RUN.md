# 🎮 Installation et Lancement de Cyteria

## 📥 Étape 1 : Installer Godot

### Option A : Installation Rapide (Linux)
```bash
# Télécharge Godot 4.2 (version stable)
cd ~/Downloads
wget https://downloads.tuxfamily.org/godotengine/4.2.2/Godot_v4.2.2-stable_linux.x86_64.zip

# Décompresse
unzip Godot_v4.2.2-stable_linux.x86_64.zip

# Rend exécutable
chmod +x Godot_v4.2.2-stable_linux.x86_64

# Lance Godot directement avec notre projet
./Godot_v4.2.2-stable_linux.x86_64 /home/user1/Data/Cyteria/cyteria-game/project.godot
```

### Option B : Installation Manuelle
1. Va sur https://godotengine.org/download
2. Choisis ton OS (Windows/Mac/Linux)
3. Télécharge "Standard" (pas .NET)
4. Décompresse où tu veux (c'est portable !)

## 🚀 Étape 2 : Lancer le Jeu

### Méthode 1 : Direct
```bash
# Si Godot est dans ~/Downloads
~/Downloads/Godot_v4.2.2-stable_linux.x86_64 /home/user1/Data/Cyteria/cyteria-game/project.godot
```

### Méthode 2 : Via l'Interface
1. Double-clique sur Godot
2. Clique "Import"
3. Clique "Browse"
4. Navigue vers : `/home/user1/Data/Cyteria/cyteria-game/`
5. Sélectionne `project.godot`
6. Clique "Import & Edit"

## 🎯 Étape 3 : Jouer !

Une fois dans Godot :
1. **Appuie sur F5** ou clique sur **▶️** (Play) en haut à droite
2. Le menu apparaît
3. Clique "Settings" pour choisir "Metro Station"
4. Clique "Play" !

## 🎮 Contrôles
- **Bouger** : WASD ou Flèches
- **Sauter** : Espace
- **Attaquer** : Clic gauche
- **Pause** : Échap

## ⚡ Script d'Installation Automatique

Copie-colle ça dans ton terminal :
```bash
#!/bin/bash
# Installation automatique de Godot et lancement de Cyteria

echo "🎮 Installation de Godot pour Cyteria..."

# Crée un dossier pour Godot
mkdir -p ~/godot
cd ~/godot

# Télécharge Godot
echo "📥 Téléchargement de Godot 4.2..."
wget -q --show-progress https://downloads.tuxfamily.org/godotengine/4.2.2/Godot_v4.2.2-stable_linux.x86_64.zip

# Décompresse
echo "📦 Décompression..."
unzip -q Godot_v4.2.2-stable_linux.x86_64.zip

# Rend exécutable
chmod +x Godot_v4.2.2-stable_linux.x86_64

# Lance le jeu
echo "🚀 Lancement de Cyteria..."
./Godot_v4.2.2-stable_linux.x86_64 /home/user1/Data/Cyteria/cyteria-game/project.godot

echo "✅ Terminé ! Appuie sur F5 dans Godot pour jouer !"
```

## 🆘 Problèmes ?

### "Godot ne se lance pas"
- Vérifie que tu as téléchargé la bonne version pour ton OS
- Sur Linux : `chmod +x Godot*` pour rendre exécutable

### "Le projet ne s'ouvre pas"
- Vérifie le chemin : `/home/user1/Data/Cyteria/cyteria-game/project.godot`
- Assure-toi d'avoir Godot 4.2+ (pas 3.x)

### "Écran noir au lancement"
- Normal ! Clique sur "Play" dans le menu
- Puis "Settings" pour choisir le niveau Metro

---

**💡 Astuce** : Godot est portable, tu peux le mettre n'importe où !