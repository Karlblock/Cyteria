extends Control
class_name WeaponDisplay

@onready var weapon_name_label = $WeaponInfo/WeaponName
@onready var weapon_stats_label = $WeaponInfo/WeaponStats
@onready var weapon_icon = $WeaponIcon

var current_weapon: Weapon

func _ready():
	# Trouve le joueur et connecte-toi à son inventaire
	var player = get_tree().get_first_node_in_group("player")
	if player and player.has_node("InventorySystem"):
		var inventory = player.get_node("InventorySystem")
		inventory.item_equipped.connect(_on_weapon_equipped)

func _on_weapon_equipped(weapon: Weapon):
	current_weapon = weapon
	update_display()

func update_display():
	if not current_weapon:
		weapon_name_label.text = "No Weapon"
		weapon_stats_label.text = ""
		weapon_icon.color = Color.GRAY
		return
	
	weapon_name_label.text = current_weapon.weapon_name
	weapon_stats_label.text = "DMG: %d | SPD: %.1f | RNG: %.0f" % [
		current_weapon.damage,
		current_weapon.attack_speed, 
		current_weapon.range
	]
	
	# Couleur selon rareté
	match current_weapon.rarity:
		"common":
			weapon_icon.color = Color.WHITE
		"rare": 
			weapon_icon.color = Color.CYAN
		"epic":
			weapon_icon.color = Color.MAGENTA
		"legendary":
			weapon_icon.color = Color.YELLOW