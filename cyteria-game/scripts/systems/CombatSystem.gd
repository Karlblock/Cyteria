extends Node2D
class_name CombatSystem

signal attack_performed(damage: int, target: Node2D)

@export var damage: int = 25
@export var attack_range: float = 80.0
@export var attack_cooldown: float = 0.5

var can_attack: bool = true
var attack_area: Area2D

func _ready():
	setup_attack_area()

func setup_attack_area():
	attack_area = Area2D.new()
	var collision = CollisionShape2D.new()
	var shape = CircleShape2D.new()
	shape.radius = attack_range
	collision.shape = shape
	attack_area.add_child(collision)
	add_child(attack_area)
	
	# Configure collision layers
	attack_area.collision_layer = 0
	attack_area.collision_mask = 4 | 8  # Enemies + Items

func try_attack() -> bool:
	if not can_attack:
		return false
	
	var targets = attack_area.get_overlapping_bodies()
	var hit_something = false
	
	for target in targets:
		if target == get_parent():  # Don't hit yourself
			continue
			
		if target.has_method("take_damage"):
			target.take_damage(damage)
			attack_performed.emit(damage, target)
			hit_something = true
		elif target.has_node("HealthSystem"):
			target.get_node("HealthSystem").take_damage(damage)
			attack_performed.emit(damage, target)
			hit_something = true
	
	if hit_something:
		start_cooldown()
	
	return hit_something

func start_cooldown():
	can_attack = false
	var timer = get_tree().create_timer(attack_cooldown)
	timer.timeout.connect(_on_cooldown_finished)

func _on_cooldown_finished():
	can_attack = true

func set_damage(new_damage: int):
	damage = new_damage

func set_range(new_range: float):
	attack_range = new_range
	if attack_area:
		var collision = attack_area.get_child(0) as CollisionShape2D
		var shape = collision.shape as CircleShape2D
		shape.radius = attack_range