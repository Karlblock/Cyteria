extends Label
class_name DamageNumber

func show_damage(damage: int, position: Vector2, color: Color = Color.RED):
	text = str(damage)
	modulate = color
	global_position = position
	
	# Animation de montée et disparition
	var tween = create_tween()
	tween.parallel().tween_property(self, "global_position:y", global_position.y - 50, 1.0)
	tween.parallel().tween_property(self, "modulate:a", 0.0, 1.0)
	tween.tween_callback(queue_free)

func show_heal(amount: int, position: Vector2):
	show_damage(amount, position, Color.GREEN)
	text = "+" + text