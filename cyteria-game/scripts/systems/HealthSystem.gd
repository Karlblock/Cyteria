extends Node
class_name HealthSystem

signal health_changed(current: int, max_health: int)
signal died()
signal healed(amount: int)
signal damaged(amount: int)

@export var max_health: int = 100
var current_health: int

func _ready():
	current_health = max_health
	health_changed.emit(current_health, max_health)

func take_damage(amount: int) -> bool:
	if current_health <= 0:
		return false
	
	var actual_damage = min(amount, current_health)
	current_health -= actual_damage
	
	damaged.emit(actual_damage)
	health_changed.emit(current_health, max_health)
	
	if current_health <= 0:
		died.emit()
		return true
	
	return false

func heal(amount: int):
	if current_health <= 0:
		return
	
	var actual_heal = min(amount, max_health - current_health)
	if actual_heal > 0:
		current_health += actual_heal
		healed.emit(actual_heal)
		health_changed.emit(current_health, max_health)

func is_alive() -> bool:
	return current_health > 0

func get_health_percentage() -> float:
	return float(current_health) / float(max_health)

func set_max_health(new_max: int):
	max_health = new_max
	current_health = min(current_health, max_health)
	health_changed.emit(current_health, max_health)

func revive(health_amount: int = -1):
	if health_amount == -1:
		current_health = max_health
	else:
		current_health = min(health_amount, max_health)
	health_changed.emit(current_health, max_health)