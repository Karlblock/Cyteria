extends Control
class_name HealthBar

@onready var health_fill = $Background/HealthFill
@onready var health_label = $Background/HealthLabel

var max_health: int = 100
var current_health: int = 100

func _ready():
	update_display()

func set_health(current: int, max_val: int):
	current_health = current
	max_health = max_val
	update_display()

func update_display():
	if health_fill and health_label:
		var percentage = float(current_health) / float(max_health)
		health_fill.scale.x = percentage
		health_label.text = str(current_health) + "/" + str(max_health)
		
		# Color coding
		if percentage > 0.6:
			health_fill.color = Color.GREEN
		elif percentage > 0.3:
			health_fill.color = Color.YELLOW
		else:
			health_fill.color = Color.RED