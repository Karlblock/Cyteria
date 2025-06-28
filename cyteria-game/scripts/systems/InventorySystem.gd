extends Node
class_name InventorySystem

signal item_added(item: Node)
signal item_removed(item: Node)
signal item_equipped(item: Node)
signal inventory_full()

@export var max_slots: int = 20
var items: Array[Node] = []
var equipped_weapon: Weapon = null

func add_item(item: Node) -> bool:
	if items.size() >= max_slots:
		inventory_full.emit()
		return false
	
	items.append(item)
	item_added.emit(item)
	print("Added to inventory: ", item.name if item.has_method("get") else "Unknown Item")
	return true

func remove_item(item: Node) -> bool:
	var index = items.find(item)
	if index == -1:
		return false
	
	items.remove_at(index)
	item_removed.emit(item)
	return true

func equip_weapon(weapon: Weapon) -> bool:
	if not weapon:
		return false
	
	# Déséquipe l'arme actuelle
	if equipped_weapon:
		equipped_weapon.is_equipped = false
	
	# Équipe la nouvelle arme
	equipped_weapon = weapon
	weapon.is_equipped = true
	item_equipped.emit(weapon)
	
	print("Equipped weapon: ", weapon.weapon_name)
	return true

func get_equipped_weapon() -> Weapon:
	return equipped_weapon

func get_items_by_type(type: String) -> Array:
	var filtered = []
	for item in items:
		if item.has_method("get") and item.get("weapon_type", "") == type:
			filtered.append(item)
	return filtered

func get_item_count() -> int:
	return items.size()

func is_full() -> bool:
	return items.size() >= max_slots

func clear_inventory():
	items.clear()
	equipped_weapon = null