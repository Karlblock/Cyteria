extends Node2D
class_name TileMapGenerator

# Tile types
enum TileType {
	EMPTY = -1,
	FLOOR = 0,
	WALL = 1,
	CEILING = 2,
	PLATFORM = 3,
	RAIL = 4,
	PILLAR = 5,
	BACKGROUND_WALL = 6
}

var width: int = 80
var height: int = 30
var tile_data: Array = []

func _ready():
	randomize()
	generate_metro_station()

func generate_metro_station():
	# Initialize empty map
	tile_data = []
	for y in range(height):
		var row = []
		for x in range(width):
			row.append(TileType.EMPTY)
		tile_data.append(row)
	
	# Generate main structure
	generate_station_structure()
	add_platforms()
	add_rails()
	add_pillars()
	add_details()

func generate_station_structure():
	# Floor
	for x in range(width):
		tile_data[height - 1][x] = TileType.FLOOR
		tile_data[height - 2][x] = TileType.FLOOR
	
	# Ceiling
	for x in range(width):
		tile_data[0][x] = TileType.CEILING
		tile_data[1][x] = TileType.CEILING
		tile_data[2][x] = TileType.CEILING
	
	# Side walls
	for y in range(height):
		tile_data[y][0] = TileType.WALL
		tile_data[y][1] = TileType.WALL
		tile_data[y][width - 1] = TileType.WALL
		tile_data[y][width - 2] = TileType.WALL
	
	# Background walls
	for y in range(3, height - 5):
		for x in range(2, width - 2):
			if randf() > 0.7:
				tile_data[y][x] = TileType.BACKGROUND_WALL

func add_platforms():
	# Main platform
	var platform_y = height - 10
	for x in range(10, width - 10):
		tile_data[platform_y][x] = TileType.PLATFORM
		tile_data[platform_y - 1][x] = TileType.PLATFORM
	
	# Side platforms
	for i in range(3):
		var start_x = randi() % (width - 30) + 10
		var platform_length = randi() % 10 + 8
		var y = height - 15 - (i * 5)
		
		for x in range(start_x, min(start_x + platform_length, width - 10)):
			tile_data[y][x] = TileType.PLATFORM

func add_rails():
	# Rails on the lower level
	var rail_y = height - 4
	for x in range(5, width - 5):
		if x % 2 == 0:
			tile_data[rail_y][x] = TileType.RAIL

func add_pillars():
	# Support pillars
	for x in range(15, width - 15, 15):
		for y in range(3, height - 10):
			if tile_data[y][x] == TileType.EMPTY:
				tile_data[y][x] = TileType.PILLAR
				tile_data[y][x + 1] = TileType.PILLAR

func add_details():
	# Random debris and details
	for i in range(50):
		var x = randi() % (width - 4) + 2
		var y = randi() % (height - 4) + 2
		
		# Only place on empty tiles
		if tile_data[y][x] == TileType.EMPTY and tile_data[y + 1][x] != TileType.EMPTY:
			# Small chance for different tile types
			if randf() > 0.8:
				tile_data[y][x] = TileType.BACKGROUND_WALL

func get_tile_at(x: int, y: int) -> int:
	if x < 0 or x >= width or y < 0 or y >= height:
		return TileType.WALL
	return tile_data[y][x]

func is_solid(x: int, y: int) -> bool:
	var tile = get_tile_at(x, y)
	return tile in [TileType.FLOOR, TileType.WALL, TileType.CEILING, TileType.PLATFORM, TileType.PILLAR]