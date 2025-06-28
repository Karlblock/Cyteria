extends Area2D
class_name PickupItem

@export var pickup_text: String = "Press E to pickup"
@export var auto_pickup: bool = true

@onready var pickup_prompt = $PickupPrompt
var can_pickup: bool = false
var nearby_player: CharacterBody2D = null

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	add_to_group("items")
	
	if pickup_prompt:
		pickup_prompt.visible = false

func _process(delta):
	if can_pickup and nearby_player and Input.is_action_just_pressed("ui_accept"):
		try_pickup()

func _on_body_entered(body: Node2D):
	if body.is_in_group("player"):
		nearby_player = body
		can_pickup = true
		
		if auto_pickup:
			try_pickup()
		else:
			show_pickup_prompt()

func _on_body_exited(body: Node2D):
	if body.is_in_group("player"):
		nearby_player = null
		can_pickup = false
		hide_pickup_prompt()

func try_pickup():
	if nearby_player and nearby_player.has_method("pickup_item"):
		var parent_item = get_parent()
		if nearby_player.pickup_item(parent_item):
			# Cache l'item du monde
			parent_item.visible = false
			parent_item.set_collision_layer_value(5, false)  # Remove from pickup layer
			
			# Feedback visuel
			show_pickup_effect()
			
			print("Picked up: ", parent_item.name)

func show_pickup_prompt():
	if pickup_prompt:
		pickup_prompt.visible = true
		pickup_prompt.text = pickup_text

func hide_pickup_prompt():
	if pickup_prompt:
		pickup_prompt.visible = false

func show_pickup_effect():
	# Effet de particules ou animation
	var tween = create_tween()
	tween.tween_property(get_parent(), "scale", Vector2(0, 0), 0.3)
	tween.tween_callback(get_parent().queue_free)