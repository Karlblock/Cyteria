extends Control
class_name WeaponDisplay

@onready var weapon_name_label = $WeaponInfo/WeaponName
@onready var weapon_stats_label = $WeaponInfo/WeaponStats
@onready var weapon_icon = $WeaponIcon

var current_weapon: Node

func _ready():
	# Trouve le joueur et connecte-toi à son inventaire
	var player = get_tree().get_first_node_in_group("player")
	if player and player.has_node("InventorySystem"):
		var inventory = player.get_node("InventorySystem")
		inventory.item_equipped.connect(_on_weapon_equipped)

func _on_weapon_equipped(weapon: Node):
	current_weapon = weapon
	update_display()

func update_display():
	if not current_weapon:
		weapon_name_label.text = "No Weapon"
		weapon_stats_label.text = ""
		weapon_icon.color = Color.GRAY
		return
	
	# Safe property access
	var weapon_name = "Unknown"
	var damage = 0
	var attack_speed = 1.0
	var range = 0.0
	var rarity = "common"
	
	if current_weapon.has_method("get"):
		if "weapon_name" in current_weapon:
			weapon_name = current_weapon.get("weapon_name")
		if "damage" in current_weapon:
			damage = current_weapon.get("damage")
		if "attack_speed" in current_weapon:
			attack_speed = current_weapon.get("attack_speed")
		if "range" in current_weapon:
			range = current_weapon.get("range")
		if "rarity" in current_weapon:
			rarity = current_weapon.get("rarity")
	
	weapon_name_label.text = weapon_name
	weapon_stats_label.text = "DMG: %d | SPD: %.1f | RNG: %.0f" % [
		damage,
		attack_speed, 
		range
	]
	
	# Couleur selon rareté
	match rarity:
		"common":
			weapon_icon.color = Color.WHITE
		"rare": 
			weapon_icon.color = Color.CYAN
		"epic":
			weapon_icon.color = Color.MAGENTA
		"legendary":
			weapon_icon.color = Color.YELLOW