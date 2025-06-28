# Changelog

All notable changes to Cyteria will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0-alpha] - 2024-06-28

### Added
- Initial alpha release of Cyteria
- Core gameplay systems:
  - Player movement (WASD + Jump)
  - Combat system with melee attacks
  - Health system for all entities
  - Enemy AI with chase and attack behaviors
- First enemy type: Mutant Rat
- Environmental hazards: Toxic pools with damage over time
- Procedural level generation for metro stations
- Basic UI with health bar
- Two playable levels:
  - Metro Station (procedurally generated)
  - Combat Test Arena
- Visual tile system with collision detection
- Atmospheric lighting system
- Configuration system for easy modding

### Technical
- Built with Godot 4.2
- Component-based architecture
- Signal-driven communication
- Centralized configuration system
- No hardcoded values

### Known Issues
- Placeholder graphics (colored rectangles)
- No animations implemented yet
- No sound effects or music
- Basic collision detection
- No save/load system
- No NFT integration yet

### Planned for Next Release
- Sprite animations for characters
- More enemy types
- Loot drop system
- Basic inventory
- Sound effects and ambiance
- Performance optimizations