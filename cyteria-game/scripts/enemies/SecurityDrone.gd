extends CharacterBody2D
class_name SecurityDrone

const SPEED = 100.0
const PATROL_RANGE = 300.0
const ATTACK_RANGE = 150.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 0.3  # Drones flottent
var player: CharacterBody2D
var state = "patrol"  # patrol, alert, attacking, dead
var patrol_start: Vector2
var patrol_target: Vector2
var facing_right = true

@onready var sprite = $AnimatedSprite2D
@onready var health_system = $HealthSystem
@onready var combat_system = $CombatSystem
@onready var detection_area = $DetectionArea
@onready var laser_sight = $LaserSight

func _ready():
	add_to_group("enemies")
	patrol_start = global_position
	set_new_patrol_target()
	
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
	handle_laser_sight()
	handle_animation()
	
	move_and_slide()

func handle_gravity(delta):
	# Drones flottent mais sont affectés par la gravité réduite
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_ai():
	if not player or player.is_dead:
		state = "patrol"
		return
	
	var distance_to_player = global_position.distance_to(player.global_position)
	var distance_to_patrol_start = global_position.distance_to(patrol_start)
	
	match state:
		"patrol":
			if distance_to_player <= 200:  # Detection range
				state = "alert"
			elif global_position.distance_to(patrol_target) < 50:
				set_new_patrol_target()
		
		"alert":
			# Phase de transition - s'oriente vers le joueur
			if distance_to_player <= ATTACK_RANGE:
				state = "attacking"
			elif distance_to_player > PATROL_RANGE:
				state = "patrol"
		
		"attacking":
			if distance_to_player > ATTACK_RANGE * 1.5:
				state = "alert"
			else:
				# Attaque à distance
				if combat_system and combat_system.can_attack:
					combat_system.try_attack()

func handle_movement(delta):
	match state:
		"patrol":
			var direction = (patrol_target - global_position).normalized()
			velocity.x = direction.x * SPEED * 0.5
			facing_right = direction.x > 0
		
		"alert":
			# Se dirige vers le joueur mais garde ses distances
			if player:
				var direction = (player.global_position - global_position).normalized()
				var target_distance = ATTACK_RANGE * 0.8
				var current_distance = global_position.distance_to(player.global_position)
				
				if current_distance > target_distance:
					velocity.x = direction.x * SPEED
				else:
					velocity.x = -direction.x * SPEED * 0.5  # Recule
				
				facing_right = direction.x > 0
		
		"attacking":
			# Reste en position et vise
			velocity.x = move_toward(velocity.x, 0, SPEED * 2 * delta)

func handle_laser_sight():
	if laser_sight and player and state in ["alert", "attacking"]:
		laser_sight.visible = true
		laser_sight.rotation = global_position.angle_to_point(player.global_position)
	else:
		laser_sight.visible = false

func set_new_patrol_target():
	var angle = randf() * TAU
	var distance = randf_range(100, PATROL_RANGE)
	patrol_target = patrol_start + Vector2(cos(angle), sin(angle)) * distance

func handle_animation():
	if sprite:
		sprite.flip_h = not facing_right
		
		match state:
			"dead":
				# TODO: sprite.play("death")
				pass
			"patrol":
				# TODO: sprite.play("patrol")
				pass
			"alert":
				# TODO: sprite.play("alert") - LED rouge clignotante
				pass
			"attacking":
				# TODO: sprite.play("attack") - charge laser
				pass

func take_damage(amount: int):
	if health_system:
		health_system.take_damage(amount)
		# Passe en mode alerte si touché
		if state == "patrol":
			state = "alert"

func _on_died():
	state = "dead"
	print("Security drone destroyed!")
	
	# Disable collision et tombe
	if has_method("set_collision_layer_value"):
		set_collision_layer_value(3, false)
	else:
		collision_layer = 0
	
	# Explosion effect
	if sprite:
		var tween = create_tween()
		tween.tween_property(sprite, "modulate", Color.RED, 0.2)
		tween.tween_property(sprite, "scale", Vector2(1.5, 1.5), 0.3)
		tween.tween_property(sprite, "modulate:a", 0.0, 0.5)
	
	# Remove after explosion
	var timer = get_tree().create_timer(1.0)
	timer.timeout.connect(queue_free)

func _on_health_changed(current: int, max_health: int):
	# Change la couleur selon les dégâts
	if sprite:
		var health_ratio = float(current) / float(max_health)
		if health_ratio < 0.3:
			sprite.modulate = Color(1, 0.5, 0.5)  # Rouge si très endommagé
		elif health_ratio < 0.6:
			sprite.modulate = Color(1, 0.8, 0.8)  # Rose si endommagé

func _on_attack_performed(damage: int, target: Node2D):
	print("Drone fired laser at ", target.name, " for ", damage, " damage!")
	
	# Effet laser visuel
	if laser_sight:
		var tween = create_tween()
		tween.tween_property(laser_sight, "modulate", Color.RED, 0.1)
		tween.tween_property(laser_sight, "modulate", Color.WHITE, 0.2)