extends Control
class_name PauseMenu

@onready var resume_button = $CenterContainer/VBoxContainer/ResumeButton
@onready var settings_button = $CenterContainer/VBoxContainer/SettingsButton
@onready var main_menu_button = $CenterContainer/VBoxContainer/MainMenuButton
@onready var quit_button = $CenterContainer/VBoxContainer/QuitButton

func _ready():
	resume_button.pressed.connect(_on_resume_pressed)
	settings_button.pressed.connect(_on_settings_pressed)
	main_menu_button.pressed.connect(_on_main_menu_pressed)
	quit_button.pressed.connect(_on_quit_pressed)
	
	visible = false
	resume_button.grab_focus()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause():
	visible = !visible
	get_tree().paused = visible
	
	if visible:
		resume_button.grab_focus()

func _on_resume_pressed():
	toggle_pause()

func _on_settings_pressed():
	print("Settings not implemented yet")

func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()