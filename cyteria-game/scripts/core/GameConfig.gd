extends Node
class_name GameConfig

# Singleton for game configuration
# Access via GameConfig.get_value("category", "key")

const CONFIG = {
	# Player Configuration
	"player": {
		"speed": 300.0,
		"jump_velocity": -400.0,
		"acceleration": 2000.0,
		"friction": 2000.0,
		"max_health": 100,
		"base_damage": 25,
		"attack_range": 80.0,
		"attack_cooldown": 0.5
	},
	
	# Enemy Configuration
	"enemies": {
		"mutant_rat": {
			"speed": 150.0,
			"chase_range": 200.0,
			"attack_range": 50.0,
			"max_health": 50,
			"damage": 15,
			"attack_cooldown": 1.0,
			"corpse_decay_time": 2.0,
			"chase_hysteresis": 1.5,
			"attack_hysteresis": 1.2
		}
	},
	
	# Hazards Configuration
	"hazards": {
		"toxic_pool": {
			"damage_per_second": 10.0,
			"tick_rate": 0.5,
			"bubble_alpha_min": 0.3,
			"bubble_alpha_max": 0.6,
			"damage_text_offset_y": -30,
			"damage_text_random_x": 20,
			"damage_text_rise": -50,
			"animation_duration": 1.0
		}
	},
	
	# Visual Effects
	"effects": {
		"flickering_light": {
			"min_energy": 0.3,
			"max_energy": 1.5,
			"flicker_speed": 0.1,
			"flicker_chance": 0.95,
			"stop_flicker_chance": 0.7
		}
	},
	
	# Level Generation
	"level_gen": {
		"metro_station": {
			"width": 80,
			"height": 30,
			"tile_size": 32,
			"background_wall_chance": 0.7,
			"platform_margin": 10,
			"pillar_spacing": 15,
			"detail_iterations": 50,
			"detail_chance": 0.8,
			"graffiti_chance": 0.95
		}
	},
	
	# UI Configuration
	"ui": {
		"health_bar": {
			"high_health_threshold": 0.6,
			"low_health_threshold": 0.3,
			"default_max_health": 100
		}
	},
	
	# Group Names
	"groups": {
		"player": "player",
		"enemies": "enemies",
		"ui_healthbar": "ui_healthbar"
	},
	
	# Collision Layers
	"collision_layers": {
		"world": 1,
		"player": 2,
		"enemies": 3,
		"items": 4,
		"projectiles": 5,
		"hazards": 6
	},
	
	# Colors
	"colors": {
		"tile_floor": Color(0.3, 0.3, 0.3),
		"tile_wall": Color(0.2, 0.2, 0.2),
		"tile_ceiling": Color(0.15, 0.15, 0.15),
		"tile_platform": Color(0.4, 0.4, 0.4),
		"tile_rail": Color(0.5, 0.5, 0.6),
		"tile_pillar": Color(0.25, 0.25, 0.25),
		"tile_background": Color(0.1, 0.1, 0.1, 0.7),
		"graffiti": Color(0.6, 0.2, 0.2, 0.7),
		"rail_visual": Color(0.6, 0.6, 0.7),
		"rail_sleeper": Color(0.3, 0.2, 0.1),
		"platform_edge": Color(0.8, 0.8, 0.2),
		"damage_text": Color(0.8, 1.0, 0.8),
		"health_high": Color.GREEN,
		"health_medium": Color.YELLOW,
		"health_low": Color.RED
	},
	
	# Graffiti Text Options
	"graffiti_texts": ["DANGER", "EXIT", "HELP", "7", "→", "CYTERIA", "RUN", "NO HOPE"],
	
	# Debug Messages
	"debug_messages": {
		"player_died": "Player died!",
		"health_changed": "Health: %d/%d",
		"attack_hit": "Hit %s for %d damage!",
		"enemy_died": "%s died!",
		"enemy_attack": "%s attacked %s for %d damage!"
	}
}

static func get_value(category: String, key: String, default = null):
	if CONFIG.has(category) and CONFIG[category].has(key):
		return CONFIG[category][key]
	push_warning("Config key not found: " + category + "/" + key)
	return default

static func get_color(color_name: String) -> Color:
	return get_value("colors", color_name, Color.WHITE)

static func get_layer(layer_name: String) -> int:
	return get_value("collision_layers", layer_name, 0)

static func get_group(group_name: String) -> String:
	return get_value("groups", group_name, group_name)

static func get_debug_message(message_key: String, params: Array = []) -> String:
	var template = get_value("debug_messages", message_key, "")
	if params.size() > 0:
		return template % params
	return template