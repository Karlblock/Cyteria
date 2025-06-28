extends Node
class_name SafeGet

# Helper functions for safe property access
static func get_property(obj: Object, property: String, default_value = null):
	if obj and obj.has_method("get") and property in obj:
		return obj.get(property)
	return default_value

static func set_property(obj: Object, property: String, value):
	if obj and obj.has_method("set"):
		obj.set(property, value)

static func has_property(obj: Object, property: String) -> bool:
	if obj and property in obj:
		return true
	return false