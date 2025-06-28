# Cyteria - Roadmap

## Vision
Un jeu sandbox 2D urbain souterrain inspiré de Terraria avec une économie décentralisée où tous les équipements et objets sont des NFTs échangeables.

## Phase 1: Foundation (2-3 mois)

### 1.1 Architecture Technique
- [ ] Choix du game engine (Godot 4 recommandé - open source, performant, supporte web3)
- [ ] Stack blockchain: Polygon/Arbitrum pour les frais réduits
- [ ] Smart contracts ERC-721/ERC-1155 pour les NFTs
- [ ] Backend Node.js + PostgreSQL pour les données hors-chaîne
- [ ] IPFS pour stocker les métadonnées NFT

### 1.2 Prototype Core Gameplay
- [ ] Système de tiles 2D (béton, métal, terre urbaine)
- [ ] Génération procédurale de souterrains urbains (métro, égouts, caves)
- [ ] Mouvement du personnage et physique de base
- [ ] Système de destruction/construction de l'environnement

### 1.3 Infrastructure Web3
- [ ] Smart contracts pour les items NFT
- [ ] Wallet connection (MetaMask, WalletConnect)
- [ ] Système de minting d'items de base
- [ ] API backend pour synchroniser game state et blockchain

## Phase 2: Game Systems (3-4 mois)

### 2.1 Système d'Équipement NFT
- [ ] 5 catégories: Armes, Armures, Outils, Consommables, Matériaux
- [ ] Rarités: Common, Rare, Epic, Legendary, Mythic
- [ ] Attributs aléatoires lors du mint
- [ ] Système de craft combinant plusieurs NFTs

### 2.2 Environnements Urbains
- [ ] Biomes: Station de métro, Égouts toxiques, Bunkers abandonnés, Caves industrielles
- [ ] Dangers urbains: gaz toxiques, électricité, radiations
- [ ] Ressources spécifiques: ferraille, composants électroniques, carburant

### 2.3 Combat et Ennemis
- [ ] Ennemis thématiques: rats mutants, robots défectueux, gangs souterrains
- [ ] Boss de zone: Le Roi des Égouts, L'IA Corrompue, Le Chef de Gang
- [ ] Armes urbaines: pistolets improvisés, barres de fer, cocktails molotov

## Phase 3: Économie & Marketplace (2-3 mois)

### 3.1 Marketplace Intégrée
- [ ] Interface in-game pour acheter/vendre
- [ ] Système d'enchères
- [ ] Historique des prix
- [ ] Frais de transaction (2.5% pour financer le développement)

### 3.2 Économie de Jeu
- [ ] Monnaie in-game (SCRAP tokens)
- [ ] Staking de NFTs pour générer des ressources
- [ ] Missions quotidiennes récompensées en tokens
- [ ] Système de location d'équipements rares

### 3.3 Crafting Avancé
- [ ] Recettes découvrables
- [ ] Fusion de NFTs pour créer des items plus puissants
- [ ] Risque d'échec avec destruction possible
- [ ] Ateliers spécialisés à débloquer

## Phase 4: Multijoueur & Social (3-4 mois)

### 4.1 Multijoueur
- [ ] Serveurs dédiés (max 32 joueurs)
- [ ] Système de clans/gangs
- [ ] Raids de boss coopératifs
- [ ] Trading P2P sécurisé

### 4.2 Territoires et Bases
- [ ] Revendication de zones souterraines
- [ ] Construction de bases personnalisables
- [ ] Défense contre les invasions PvE
- [ ] Système de taxation des territoires

## Phase 5: Endgame & Expansion (4+ mois)

### 5.1 Contenu Endgame
- [ ] Mega-bosses nécessitant des équipes
- [ ] Donjons générés aléatoirement
- [ ] Items légendaires uniques (1 seul exemplaire)
- [ ] Événements saisonniers

### 5.2 Governance DAO
- [ ] Token de gouvernance pour les décisions
- [ ] Vote sur les nouvelles features
- [ ] Treasury communautaire
- [ ] Redistribution des profits

## Stack Technique Recommandé

### Frontend/Game
- **Engine**: Godot 4 (GDScript/C#)
- **Web3**: ethers.js / web3.js
- **UI**: Interface custom Godot

### Backend
- **API**: Node.js + Express/Fastify
- **Database**: PostgreSQL + Redis
- **Queue**: Bull/BullMQ
- **WebSockets**: Socket.io

### Blockchain
- **Chain**: Polygon/Arbitrum
- **Smart Contracts**: Solidity + Hardhat
- **Storage**: IPFS + Arweave
- **Indexing**: The Graph

### Infrastructure
- **Hosting**: AWS/GCP avec auto-scaling
- **CDN**: CloudFlare
- **Monitoring**: Prometheus + Grafana
- **CI/CD**: GitHub Actions

## Modèle Économique

### Revenus
1. **Vente initiale d'items** (Genesis collection)
2. **Frais marketplace** (2.5% par transaction)
3. **Battle Pass saisonnier** (payable en tokens)
4. **Vente de territoires premium**

### Distribution
- 40% Développement continu
- 20% Marketing & Communauté
- 20% Treasury DAO
- 10% Équipe fondatrice (vesting 2 ans)
- 10% Récompenses joueurs

## Prochaines Étapes

1. **Semaine 1-2**: Setup environnement dev + architecture
2. **Semaine 3-4**: Prototype gameplay basique
3. **Mois 2**: Smart contracts + intégration web3
4. **Mois 3**: Alpha testable avec NFTs basiques