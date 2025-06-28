extends CharacterBody2D
class_name MutantRat

const SPEED = 150.0
const CHASE_RANGE = 200.0
const ATTACK_RANGE = 50.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player: CharacterBody2D
var state = "idle"  # idle, chasing, attacking, dead
var facing_right = true

@onready var sprite = $AnimatedSprite2D
@onready var health_system = $HealthSystem
@onready var combat_system = $CombatSystem
@onready var detection_area = $DetectionArea

func _ready():
	add_to_group("enemies")
	
	# Connect signals
	if health_system:
		health_system.died.connect(_on_died)
		health_system.health_changed.connect(_on_health_changed)
	
	if combat_system:
		combat_system.attack_performed.connect(_on_attack_performed)
	
	# Find player
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		player = players[0]

func _physics_process(delta):
	if state == "dead":
		return
	
	handle_gravity(delta)
	handle_ai()
	handle_movement(delta)
	handle_animation()
	
	move_and_slide()

func handle_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_ai():
	if not player or player.is_dead:
		state = "idle"
		return
	
	var distance_to_player = global_position.distance_to(player.global_position)
	
	match state:
		"idle":
			if distance_to_player <= CHASE_RANGE:
				state = "chasing"
		
		"chasing":
			if distance_to_player > CHASE_RANGE * 1.5:  # Hysteresis
				state = "idle"
			elif distance_to_player <= ATTACK_RANGE:
				state = "attacking"
		
		"attacking":
			if distance_to_player > ATTACK_RANGE * 1.2:
				state = "chasing"
			else:
				# Try to attack
				if combat_system and combat_system.can_attack:
					combat_system.try_attack()

func handle_movement(delta):
	match state:
		"idle":
			velocity.x = move_toward(velocity.x, 0, SPEED * 2 * delta)
		
		"chasing", "attacking":
			if player:
				var direction = sign(player.global_position.x - global_position.x)
				velocity.x = direction * SPEED
				facing_right = direction > 0

func handle_animation():
	if sprite:
		sprite.flip_h = not facing_right
		
		match state:
			"dead":
				# TODO: sprite.play("death")
				pass
			"idle":
				# TODO: sprite.play("idle") 
				pass
			"chasing":
				# TODO: sprite.play("run")
				pass
			"attacking":
				# TODO: sprite.play("attack")
				pass

func take_damage(amount: int):
	if health_system:
		health_system.take_damage(amount)

func _on_died():
	state = "dead"
	print("Rat died!")
	# Disable collision
	set_collision_layer_value(3, false)  # Remove from enemies layer
	
	# TODO: Drop loot
	# TODO: Add death animation
	
	# Remove after delay
	var timer = get_tree().create_timer(2.0)
	timer.timeout.connect(queue_free)

func _on_health_changed(current: int, max_health: int):
	# TODO: Add damage feedback (flash red, etc.)
	pass

func _on_attack_performed(damage: int, target: Node2D):
	print("Rat attacked ", target.name, " for ", damage, " damage!")
	# TODO: Add attack animation/effects