extends Area2D
class_name ToxicPool

@export var damage_per_second: float = 10.0
@export var tick_rate: float = 0.5

var players_in_pool: Array = []
var damage_timers: Dictionary = {}

@onready var visual = $Visual
@onready var bubbles = $Bubbles

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	
	# Animate bubbles
	if bubbles:
		var tween = create_tween().set_loops()
		tween.tween_property(bubbles, "modulate:a", 0.3, 1.0)
		tween.tween_property(bubbles, "modulate:a", 0.6, 1.0)

func _on_body_entered(body: Node2D):
	if body.has_method("take_damage") and body.is_in_group("player"):
		players_in_pool.append(body)
		start_damage_tick(body)

func _on_body_exited(body: Node2D):
	if body in players_in_pool:
		players_in_pool.erase(body)
		stop_damage_tick(body)

func start_damage_tick(body: Node2D):
	if body in damage_timers:
		return
	
	var timer = Timer.new()
	timer.wait_time = tick_rate
	timer.timeout.connect(_on_damage_tick.bind(body))
	add_child(timer)
	timer.start()
	damage_timers[body] = timer
	
	# Initial damage
	apply_damage(body)

func stop_damage_tick(body: Node2D):
	if body in damage_timers:
		damage_timers[body].queue_free()
		damage_timers.erase(body)

func _on_damage_tick(body: Node2D):
	if body in players_in_pool:
		apply_damage(body)

func apply_damage(body: Node2D):
	var damage = int(damage_per_second * tick_rate)
	body.take_damage(damage)
	
	# Visual feedback
	var damage_text = Label.new()
	damage_text.text = "-" + str(damage)
	damage_text.position = body.global_position - global_position + Vector2(randf_range(-20, 20), -30)
	damage_text.modulate = Color(0.8, 1.0, 0.8)
	add_child(damage_text)
	
	# Animate and remove
	var tween = create_tween()
	tween.tween_property(damage_text, "position:y", damage_text.position.y - 50, 1.0)
	tween.parallel().tween_property(damage_text, "modulate:a", 0.0, 1.0)
	tween.tween_callback(damage_text.queue_free)