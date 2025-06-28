extends PointLight2D

@export var min_energy: float = 0.3
@export var max_energy: float = 1.5
@export var flicker_speed: float = 0.1
@export var flicker_chance: float = 0.95

var base_energy: float
var is_flickering: bool = false

func _ready():
	base_energy = energy
	set_physics_process(true)

func _physics_process(delta):
	if randf() > flicker_chance:
		if not is_flickering:
			start_flicker()
	
	if is_flickering and randf() > 0.7:
		stop_flicker()

func start_flicker():
	is_flickering = true
	var tween = create_tween()
	tween.tween_property(self, "energy", randf_range(min_energy, max_energy), flicker_speed)
	tween.tween_callback(func(): energy = randf_range(min_energy, base_energy))

func stop_flicker():
	is_flickering = false
	var tween = create_tween()
	tween.tween_property(self, "energy", base_energy, flicker_speed * 2)