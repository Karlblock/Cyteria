# Cyteria - Game Design Document

## Concept Core

**Tagline**: "Survive the Urban Underground, Own Your Gear"

Cyteria est un jeu d'action-aventure 2D sandbox se déroulant dans les profondeurs oubliées des villes modernes. Les joueurs explorent des réseaux de métros abandonnés, des égouts toxiques et des bunkers secrets, collectant des ressources et craftant des équipements - tous tokenisés comme NFTs sur la blockchain.

## Univers & Lore

### Setting
Année 2055. Après l'effondrement économique mondial, les villes de surface sont devenues invivables. Les survivants se sont réfugiés dans les infrastructures souterraines abandonnées, créant une nouvelle société dans les profondeurs urbaines.

### Factions
1. **Les Ferrailleurs**: Experts en récupération et craft
2. **Les Technomanciens**: Hackers maîtrisant la tech abandonnée  
3. **Les Toxiques**: Mutants adaptés aux zones contaminées
4. **Les Gardiens**: Protecteurs des derniers refuges sûrs

## Mécaniques de Jeu

### Exploration
- Génération procédurale de niveaux souterrains interconnectés
- Système de lumière dynamique (torches, lampes frontales)
- Dangers environnementaux: éboulements, inondations, fuites de gaz
- Secrets cachés et salles au trésor

### Combat
- **Armes de mêlée**: Barres de fer, couteaux, battes cloutées
- **Armes à distance**: Pistolets bricolés, fusils à pompe, lance-flammes artisanaux
- **Gadgets**: Grenades EMP, pièges électrifiés, drones de reconnaissance
- **Système de combo** et esquive tactique

### Crafting & NFTs

#### Système de Craft
```
Ferraille + Composants Électroniques = Pistolet de Base (NFT Common)
Pistolet de Base + Module Rare = Pistolet Amélioré (NFT Rare)
2 Items Rare + Catalyseur = Chance d'Item Epic (risque de perte)
```

#### Attributs NFT
Chaque équipement NFT possède:
- **Stats de base**: Dégâts, Durabilité, Vitesse
- **Traits aléatoires**: Empoisonné, Électrifié, Perforant
- **Niveau d'usure**: Nécessite réparation avec matériaux
- **Historique**: Nombre de kills, propriétaires précédents

### Progression

#### Pas de niveaux traditionnels, mais:
- **Réputation** auprès des factions
- **Compétences** débloquées par l'usage
- **Accès** à de nouvelles zones via équipements spécifiques
- **Recettes** de craft découvertes

### Économie In-Game

#### Monnaie Duale
1. **SCRAP** (off-chain): Monnaie de jeu pour consommables
2. **$CYTR** (on-chain): Token pour marketplace et governance

#### Sources de Revenus
- Vente de ressources communes aux NPCs
- Missions des factions
- Farming dans zones dangereuses
- Trading P2P d'équipements NFT

## Zones & Biomes

### 1. Les Tunnels de Métro
- **Thème**: Rails rouillés, wagons abandonnés
- **Ennemis**: Rats mutants, vagabonds hostiles
- **Ressources**: Métal, câbles électriques
- **Boss**: Le Conducteur Fantôme

### 2. Le Réseau d'Égouts
- **Thème**: Tuyaux massifs, eaux toxiques
- **Ennemis**: Créatures amphibies, slimes corrosifs
- **Ressources**: Produits chimiques, déchets valorisables
- **Boss**: L'Hydre des Égouts

### 3. Les Bunkers Militaires
- **Thème**: Béton armé, technologie abandonnée
- **Ennemis**: Robots de sécurité, tourelles automatiques
- **Ressources**: Munitions, composants high-tech
- **Boss**: L'IA de Défense Corrompue

### 4. Les Caves Industrielles
- **Thème**: Usines souterraines, machines géantes
- **Ennemis**: Ouvriers zombifiés, machines folles
- **Ressources**: Pièces mécaniques, carburant
- **Boss**: Le Contremaître Mécanique

## Multijoueur

### Modes
1. **Coopération** (2-8 joueurs): Exploration et raids
2. **Survie compétitive** (16-32 joueurs): Dernière équipe debout
3. **Territoires** (persistent): Contrôle de zones pour ressources

### Features Sociales
- Clans avec coffres partagés
- Échange sécurisé d'items NFT
- Chat vocal de proximité
- Émotes et customisation de personnage

## Monétisation Éthique

### Principes
- Pas de pay-to-win
- Tous les items obtenables en jouant
- NFTs pour la propriété, pas l'avantage
- Marketplace avec frais raisonnables

### Sources
1. **Vente Genesis**: 10,000 équipements de départ
2. **Battle Pass**: Cosmétiques et boosts XP
3. **Frais Marketplace**: 2.5% par transaction
4. **Locations**: Prêt d'équipements contre SCRAP

## Roadmap Technique Simplifiée

### MVP (3 mois)
- [ ] Mouvement et combat de base
- [ ] 1 biome jouable (Métro)
- [ ] 20 types d'items NFT
- [ ] Wallet connection

### Beta (6 mois)
- [ ] 4 biomes complets
- [ ] Multijoueur 8 joueurs
- [ ] Marketplace basique
- [ ] 100+ items uniques

### Launch (9 mois)
- [ ] Tous les systèmes finalisés
- [ ] Serveurs 32 joueurs
- [ ] DAO governance
- [ ] Events saisonniers