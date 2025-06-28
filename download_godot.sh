#!/bin/bash
# Téléchargement manuel de Godot avec miroir alternatif

echo "🎮 Téléchargement de Godot 4.2..."
echo "=================================="

cd ~/godot

# Essaye le miroir GitHub (plus rapide)
echo "📥 Tentative depuis GitHub..."
wget https://github.com/godotengine/godot/releases/download/4.2.2-stable/Godot_v4.2.2-stable_linux.x86_64.zip \
     -O godot.zip --progress=bar:force 2>&1 | \
     while read -r line; do echo -ne "\r$line"; done

if [ $? -eq 0 ] && [ -f godot.zip ]; then
    echo -e "\n✅ Téléchargement réussi !"
    
    echo "📦 Décompression..."
    unzip -q godot.zip
    rm godot.zip
    
    echo "🔧 Configuration..."
    chmod +x Godot_v4.2.2-stable_linux.x86_64
    
    echo "🚀 Lancement de Cyteria..."
    ./Godot_v4.2.2-stable_linux.x86_64 /home/user1/Data/Cyteria/cyteria-game/project.godot
else
    echo "❌ Échec du téléchargement"
    echo ""
    echo "📌 Alternative : Télécharge manuellement"
    echo "1. Va sur : https://godotengine.org/download/linux"
    echo "2. Télécharge 'Linux (x86_64)'"
    echo "3. Décompresse dans ~/godot"
    echo "4. Lance avec :"
    echo "   ~/godot/Godot_v4.2.2-stable_linux.x86_64 /home/user1/Data/Cyteria/cyteria-game/project.godot"
fi