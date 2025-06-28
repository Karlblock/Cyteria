extends Node
class_name GameManager

signal game_started
signal game_paused
signal game_resumed
signal player_died

var current_level: Node2D
var player: CharacterBody2D
var is_paused: bool = false

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause():
	is_paused = !is_paused
	get_tree().paused = is_paused
	
	if is_paused:
		game_paused.emit()
	else:
		game_resumed.emit()

func start_game():
	game_started.emit()

func respawn_player():
	if player and current_level:
		player.global_position = current_level.get_node("SpawnPoint").global_position