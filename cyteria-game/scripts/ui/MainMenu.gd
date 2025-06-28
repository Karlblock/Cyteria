extends Control

@onready var play_button = $VBoxContainer/PlayButton
@onready var settings_button = $VBoxContainer/SettingsButton
@onready var quit_button = $VBoxContainer/QuitButton

var level_index = 0
var levels = [
	"res://scenes/levels/MetroStation.tscn",
	"res://scenes/levels/CombatTestLevel.tscn"
]

func _ready():
	play_button.pressed.connect(_on_play_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	quit_button.pressed.connect(_on_quit_pressed)
	
	play_button.grab_focus()
	
	# Show current level
	update_play_button_text()

func _on_play_pressed():
	get_tree().change_scene_to_file(levels[level_index])

func _on_settings_pressed():
	# Cycle through levels for now
	level_index = (level_index + 1) % levels.size()
	update_play_button_text()

func _on_quit_pressed():
	get_tree().quit()

func update_play_button_text():
	if level_index == 0:
		play_button.text = "Play - Metro Station"
	else:
		play_button.text = "Play - Combat Test"