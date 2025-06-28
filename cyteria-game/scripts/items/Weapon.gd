extends Node2D
class_name Weapon

signal weapon_used(weapon: Weapon)

@export var weapon_name: String = "Basic Weapon"
@export var damage: int = 25
@export var attack_speed: float = 1.0
@export var range: float = 80.0
@export var weapon_type: String = "melee"  # melee, ranged
@export var rarity: String = "common"  # common, rare, epic, legendary

var is_equipped: bool = false
var last_attack_time: float = 0.0

@onready var sprite = $Sprite2D
@onready var attack_area = $AttackArea

func _ready():
	setup_weapon()

func setup_weapon():
	# Configure attack area based on weapon stats
	if attack_area and attack_area.has_method("get_child"):
		var collision = attack_area.get_child(0) as CollisionShape2D
		if collision and collision.shape is CircleShape2D:
			collision.shape.radius = range

func can_attack() -> bool:
	return Time.get_time_from_start() - last_attack_time >= (1.0 / attack_speed)

func try_attack() -> bool:
	if not can_attack():
		return false
	
	last_attack_time = Time.get_time_from_start()
	perform_attack()
	weapon_used.emit(self)
	return true

func perform_attack():
	# Animation d'attaque
	if sprite:
		var tween = create_tween()
		tween.tween_property(sprite, "rotation", PI/4, 0.1)
		tween.tween_property(sprite, "rotation", 0, 0.1)
	
	# Damage aux ennemis dans la portée
	if attack_area:
		var enemies = attack_area.get_overlapping_bodies()
		for enemy in enemies:
			if enemy.has_method("take_damage") and enemy.is_in_group("enemies"):
				enemy.take_damage(damage)

func get_stats_text() -> String:
	return "%s\nDamage: %d\nSpeed: %.1f\nRange: %.0f\nRarity: %s" % [
		weapon_name, damage, attack_speed, range, rarity.capitalize()
	]