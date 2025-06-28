#!/bin/bash
# Script d'installation automatique de Godot et lancement de Cyteria

echo "🎮 Installation de Godot pour Cyteria..."
echo "======================================"

# Détection de l'OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
    GODOT_URL="https://downloads.tuxfamily.org/godotengine/4.2.2/Godot_v4.2.2-stable_linux.x86_64.zip"
    GODOT_EXEC="Godot_v4.2.2-stable_linux.x86_64"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="mac"
    GODOT_URL="https://downloads.tuxfamily.org/godotengine/4.2.2/Godot_v4.2.2-stable_macos.universal.zip"
    GODOT_EXEC="Godot.app/Contents/MacOS/Godot"
else
    echo "❌ OS non supporté automatiquement. Télécharge Godot manuellement sur godotengine.org"
    exit 1
fi

# Crée un dossier pour Godot
mkdir -p ~/godot
cd ~/godot

# Vérifie si Godot est déjà installé
if [ -f "$GODOT_EXEC" ]; then
    echo "✅ Godot déjà installé !"
else
    # Télécharge Godot
    echo "📥 Téléchargement de Godot 4.2..."
    wget -q --show-progress "$GODOT_URL" -O godot.zip || curl -L "$GODOT_URL" -o godot.zip

    # Décompresse
    echo "📦 Décompression..."
    unzip -q godot.zip
    rm godot.zip

    # Rend exécutable (Linux)
    if [[ "$OS" == "linux" ]]; then
        chmod +x "$GODOT_EXEC"
    fi
fi

# Lance le jeu
echo "🚀 Lancement de Cyteria..."
echo "================================"
echo "📍 Une fois Godot ouvert :"
echo "   1. Appuie sur F5 pour lancer le jeu"
echo "   2. Clique 'Settings' pour choisir Metro Station"
echo "   3. Clique 'Play' pour jouer !"
echo "================================"

./"$GODOT_EXEC" /home/user1/Data/Cyteria/cyteria-game/project.godot