# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Cyteria is a 2D pixel-art survival game set in abandoned underground urban infrastructure. Players explore procedurally generated metro tunnels, sewers, and bunkers while fighting mutant creatures. All equipment and items are NFTs that can be traded on an integrated marketplace.

## Technology Stack

- **Game Engine**: Godot 4.2+
- **Programming Language**: GDScript (primary), C# (planned for blockchain)
- **Blockchain**: Polygon (planned)
- **Backend**: Node.js + PostgreSQL (planned)
- **Art Style**: Pixel art (32x32 tiles, 48x64 characters)

## Quick Start

### Running the Game
1. Open `cyteria-game/project.godot` in Godot 4.2+
2. Press F5 to run the project
3. Click "Play" to start the combat test level

### Controls
- **WASD/Arrow Keys**: Move
- **Space**: Jump
- **Left Click**: Attack
- **Escape**: Pause

## Project Structure

```
cyteria/
├── cyteria-game/          # Godot game client
│   ├── scenes/
│   │   ├── player/        # Player character
│   │   ├── enemies/       # Enemy characters
│   │   ├── levels/        # Game levels
│   │   └── ui/           # User interface
│   ├── scripts/
│   │   ├── core/         # Core game systems
│   │   ├── systems/      # Reusable systems (health, combat)
│   │   ├── player/       # Player-specific scripts
│   │   ├── enemies/      # Enemy AI and behavior
│   │   └── ui/          # UI controllers
│   └── assets/          # Game assets (sprites, sounds)
├── cyteria-backend/      # Node.js API (planned)
├── cyteria-contracts/    # Smart contracts (planned)
└── docs/                # Documentation
```

## Core Systems

### Health System
- Component-based health management
- Signals for health changes, death, healing
- Used by both players and enemies

### Combat System  
- Area-based attack detection
- Configurable damage, range, and cooldown
- Signal-based damage dealing

### Enemy AI (MutantRat)
- State machine: idle, chasing, attacking, dead
- Player detection and pursuit
- Attack behavior when in range

## Development Commands

### Testing
- Open project in Godot and press F5
- Use "CombatTestLevel" scene for combat testing
- Check console output for debug messages

### Adding New Content

**New Enemy:**
1. Extend CharacterBody2D
2. Add HealthSystem and CombatSystem nodes
3. Implement AI state machine
4. Add to enemies collision layer (layer 3)

**New Weapon/Item:**
1. Create script extending Node2D or Area2D
2. Configure damage values in CombatSystem
3. Add visual representation

## Game Design Principles

1. **Pixel Art Style**: 32x32 tiles, dark urban underground theme
2. **Component Systems**: Health, Combat, etc. as reusable components
3. **Signal-Driven**: Use Godot signals for loose coupling
4. **NFT Integration**: Items designed to become tradeable NFTs

## Current Features (v0.1 MVP)

- ✅ Player movement (WASD, jumping)
- ✅ Combat system with attack range
- ✅ Health system with damage/healing
- ✅ Enemy AI (MutantRat with chase/attack)
- ✅ Basic UI (health bar)
- ✅ Level structure with platforms

## Planned Features

- [ ] Procedural level generation
- [ ] More enemy types
- [ ] Loot/item system
- [ ] Sprite animations
- [ ] Sound effects
- [ ] Blockchain integration
- [ ] Multiplayer

## Architecture Notes

- Use composition over inheritance (Health/Combat as components)
- Collision layers: 1=World, 2=Player, 3=Enemies, 4=Items, 5=Projectiles
- Scene-based architecture: each major feature as separate scene
- Signal-based communication between systems

## Troubleshooting

**Player not moving:** Check collision layers and input map
**Combat not working:** Verify collision masks and attack ranges
**Health bar not updating:** Check GameController connections
**Enemies not spawning:** Verify collision layers (enemies = layer 3)

## Next Development Steps

1. Add sprite animations (idle, run, attack, death)
2. Implement loot dropping system
3. Create more diverse enemies
4. Add environmental hazards
5. Implement basic inventory system
6. Begin blockchain integration planning