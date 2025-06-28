# Cyteria - Version History

## v0.1 - Core Gameplay (Current)

### ✅ Features Implemented

#### Gameplay Systems
- **Player Movement**: WASD/Arrows + Jump with smooth physics
- **Combat System**: Click to attack with range detection
- **Health System**: Modular health management for all entities
- **Enemy AI**: Mutant rats with chase/attack behaviors
- **Environmental Hazards**: Toxic pools that damage over time

#### Level Design
- **Metro Station Generator**: Procedural tile-based level generation
- **Visual Tile System**: Dynamic rendering with collision
- **Atmosphere**: Dark lighting with flickering lights
- **Multiple Areas**: Platforms, rails, pillars, toxic zones

#### UI/UX
- **Main Menu**: Level selection and navigation
- **Health Bar**: Real-time health display
- **Location Labels**: Area identification
- **Debug Info**: Console output for testing

### 🎮 How to Play

1. Open `cyteria-game/project.godot` in Godot 4.2+
2. Press F5 to run
3. Select "Settings" to toggle between levels:
   - **Metro Station**: Full atmospheric level with hazards
   - **Combat Test**: Simple arena for testing combat
4. Controls:
   - Move: WASD/Arrow Keys
   - Jump: Space
   - Attack: Left Mouse Click
   - Pause: Escape

### 📊 Technical Stats

- **Code Files**: 15+ scripts
- **Scene Files**: 8 scenes
- **Systems**: Health, Combat, AI, Generation
- **Enemies**: 1 type (Mutant Rat)
- **Hazards**: Toxic pools
- **Map Size**: 80x30 tiles (2560x960 pixels)

### 🐛 Known Issues

- No sprite animations yet (placeholder rectangles)
- No sound effects
- Performance not optimized
- Collision detection needs refinement

### 🚀 Next Steps for v0.2

1. **Sprite Animations**: Real pixel art for characters
2. **More Enemies**: Security drones, toxic slimes
3. **Loot System**: Items drop from enemies
4. **Inventory**: Basic item management
5. **Sound Effects**: Combat, movement, ambiance

---

**Release Date**: Current Build
**Platform**: Windows, Linux, macOS (via Godot)
**Status**: Playable Alpha