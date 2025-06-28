extends Control
class_name GameHUD

@onready var health_bar = $HealthBar
@onready var weapon_display = $WeaponDisplay
@onready var mini_map = $MiniMap
@onready var objective_text = $ObjectiveText
@onready var controls_hint = $ControlsHint

var player: CharacterBody2D

func _ready():
	# Trouve le joueur
	await get_tree().process_frame
	player = get_tree().get_first_node_in_group("player")
	
	if player and player.has_node("HealthSystem"):
		var health_system = player.get_node("HealthSystem")
		health_system.health_changed.connect(_on_player_health_changed)
		health_bar.set_health(health_system.current_health, health_system.max_health)
	
	# Affiche les objectifs
	update_objective()
	
	# Cache les hints après 10 secondes
	var timer = get_tree().create_timer(10.0)
	timer.timeout.connect(func(): controls_hint.visible = false)

func _on_player_health_changed(current: int, max_health: int):
	if health_bar:
		health_bar.set_health(current, max_health)

func update_objective():
	var enemies_count = get_tree().get_nodes_in_group("enemies").size()
	var items_count = get_tree().get_nodes_in_group("items").size()
	
	objective_text.text = "OBJECTIVES:\n• Eliminate %d enemies\n• Collect weapons\n• Survive the station" % enemies_count

func _on_enemy_died():
	update_objective()