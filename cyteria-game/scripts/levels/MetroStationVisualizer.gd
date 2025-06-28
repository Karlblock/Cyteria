extends Node2D

@onready var generator = $"../TileMapGenerator"
@onready var tilemap = $"../TileMap"

const TILE_SIZE = 32

# Color palette for different tile types
var tile_colors = {
	TileMapGenerator.TileType.FLOOR: Color(0.3, 0.3, 0.3),
	TileMapGenerator.TileType.WALL: Color(0.2, 0.2, 0.2),
	TileMapGenerator.TileType.CEILING: Color(0.15, 0.15, 0.15),
	TileMapGenerator.TileType.PLATFORM: Color(0.4, 0.4, 0.4),
	TileMapGenerator.TileType.RAIL: Color(0.5, 0.5, 0.6),
	TileMapGenerator.TileType.PILLAR: Color(0.25, 0.25, 0.25),
	TileMapGenerator.TileType.BACKGROUND_WALL: Color(0.1, 0.1, 0.1, 0.7)
}

var collision_tiles = []

func _ready():
	await get_tree().process_frame
	if generator:
		visualize_tiles()
		create_collision()

func visualize_tiles():
	# Clear existing visuals
	for child in get_children():
		child.queue_free()
	
	# Create visual representations
	for y in range(generator.height):
		for x in range(generator.width):
			var tile_type = generator.get_tile_at(x, y)
			if tile_type != TileMapGenerator.TileType.EMPTY:
				create_tile_visual(x, y, tile_type)

func create_tile_visual(x: int, y: int, tile_type: int):
	var rect = ColorRect.new()
	rect.position = Vector2(x * TILE_SIZE, y * TILE_SIZE)
	rect.size = Vector2(TILE_SIZE, TILE_SIZE)
	rect.color = tile_colors.get(tile_type, Color.WHITE)
	
	# Add visual variations
	match tile_type:
		TileMapGenerator.TileType.FLOOR:
			add_floor_details(rect, x, y)
		TileMapGenerator.TileType.WALL:
			add_wall_details(rect, x, y)
		TileMapGenerator.TileType.RAIL:
			add_rail_visual(rect, x, y)
		TileMapGenerator.TileType.PLATFORM:
			add_platform_edge(rect, x, y)
	
	add_child(rect)

func add_floor_details(parent: ColorRect, x: int, y: int):
	# Add cracks or stains randomly
	if randf() > 0.8:
		var detail = ColorRect.new()
		detail.position = Vector2(4, 4)
		detail.size = Vector2(24, 24)
		detail.color = Color(0.25, 0.25, 0.25, 0.5)
		parent.add_child(detail)

func add_wall_details(parent: ColorRect, x: int, y: int):
	# Add graffiti occasionally
	if randf() > 0.95:
		var graffiti = Label.new()
		graffiti.text = ["DANGER", "EXIT", "HELP", "7", "→"].pick_random()
		graffiti.position = Vector2(2, 8)
		graffiti.add_theme_color_override("font_color", Color(0.6, 0.2, 0.2, 0.7))
		parent.add_child(graffiti)

func add_rail_visual(parent: ColorRect, x: int, y: int):
	parent.color = Color(0.6, 0.6, 0.7)
	# Add sleeper
	var sleeper = ColorRect.new()
	sleeper.position = Vector2(0, 12)
	sleeper.size = Vector2(32, 8)
	sleeper.color = Color(0.3, 0.2, 0.1)
	parent.add_child(sleeper)

func add_platform_edge(parent: ColorRect, x: int, y: int):
	# Check if it's an edge
	if generator.get_tile_at(x, y + 1) == TileMapGenerator.TileType.EMPTY:
		var edge = ColorRect.new()
		edge.position = Vector2(0, 28)
		edge.size = Vector2(32, 4)
		edge.color = Color(0.8, 0.8, 0.2)
		parent.add_child(edge)

func create_collision():
	# Create collision bodies for solid tiles
	for y in range(generator.height):
		for x in range(generator.width):
			if generator.is_solid(x, y):
				create_collision_tile(x, y)

func create_collision_tile(x: int, y: int):
	var body = StaticBody2D.new()
	body.position = Vector2(x * TILE_SIZE + TILE_SIZE/2, y * TILE_SIZE + TILE_SIZE/2)
	body.collision_layer = 1  # World layer
	
	var shape = CollisionShape2D.new()
	var rect_shape = RectangleShape2D.new()
	rect_shape.size = Vector2(TILE_SIZE, TILE_SIZE)
	shape.shape = rect_shape
	
	body.add_child(shape)
	get_parent().add_child(body)
	collision_tiles.append(body)