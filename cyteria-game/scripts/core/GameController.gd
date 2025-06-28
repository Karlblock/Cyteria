extends Node

var player: Player
var health_bar: HealthBar

func _ready():
	# Find player and UI elements
	await get_tree().process_frame  # Wait one frame for nodes to be ready
	
	player = get_tree().get_first_node_in_group("player")
	health_bar = get_tree().get_nodes_in_group("ui_healthbar")[0] if get_tree().get_nodes_in_group("ui_healthbar").size() > 0 else null
	
	if not health_bar:
		health_bar = find_node_by_type(get_tree().root, HealthBar)
	
	if player and health_bar:
		# Connect player health to UI
		player.health_system.health_changed.connect(_on_player_health_changed)
		# Set initial health
		health_bar.set_health(player.health_system.current_health, player.health_system.max_health)

func find_node_by_type(node: Node, type) -> Node:
	if node is type:
		return node
	
	for child in node.get_children():
		var result = find_node_by_type(child, type)
		if result:
			return result
	
	return null

func _on_player_health_changed(current: int, max_health: int):
	if health_bar:
		health_bar.set_health(current, max_health)