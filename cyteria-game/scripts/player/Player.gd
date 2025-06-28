extends CharacterBody2D
class_name Player

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const ACCELERATION = 2000.0
const FRICTION = 2000.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var facing_right = true
var is_dead = false

@onready var sprite = $AnimatedSprite2D
@onready var collision = $CollisionShape2D
@onready var health_system = $HealthSystem
@onready var combat_system = $CombatSystem

func _ready():
	add_to_group("player")
	
	# Connect health system signals
	if health_system:
		health_system.died.connect(_on_died)
		health_system.health_changed.connect(_on_health_changed)
	
	# Connect combat system signals
	if combat_system:
		combat_system.attack_performed.connect(_on_attack_performed)

func _physics_process(delta):
	if is_dead:
		return
		
	handle_gravity(delta)
	handle_movement(delta)
	handle_jump()
	handle_combat()
	handle_animation()
	
	move_and_slide()

func handle_gravity(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

func handle_movement(delta):
	var input_dir = Input.get_axis("move_left", "move_right")
	
	if input_dir != 0:
		velocity.x = move_toward(velocity.x, input_dir * SPEED, ACCELERATION * delta)
		facing_right = input_dir > 0
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION * delta)

func handle_jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

func handle_animation():
	if sprite:
		sprite.flip_h = not facing_right
		
		if is_dead:
			# TODO: sprite.play("death")
			return
		
		if is_on_floor():
			if abs(velocity.x) > 10:
				# TODO: sprite.play("run")
				pass
			else:
				# TODO: sprite.play("idle")
				pass
		else:
			if velocity.y < 0:
				# TODO: sprite.play("jump")
				pass
			else:
				# TODO: sprite.play("fall")
				pass

func handle_combat():
	if Input.is_action_just_pressed("attack") and combat_system:
		combat_system.try_attack()

func take_damage(amount: int):
	if health_system:
		health_system.take_damage(amount)

func heal(amount: int):
	if health_system:
		health_system.heal(amount)

func _on_died():
	is_dead = true
	print("Player died!")
	# TODO: Add death animation and respawn logic

func _on_health_changed(current: int, max_health: int):
	print("Health: ", current, "/", max_health)

func _on_attack_performed(damage: int, target: Node2D):
	print("Hit ", target.name, " for ", damage, " damage!")

func respawn():
	is_dead = false
	if health_system:
		health_system.revive()