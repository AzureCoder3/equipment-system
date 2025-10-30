extends MarginContainer

func _ready() -> void:
	
	# margins para sa menu
	var margin_value = 20
	add_theme_constant_override("margin_top", margin_value)
	add_theme_constant_override("margin_left", margin_value)
	add_theme_constant_override("margin_bottom", margin_value)
	add_theme_constant_override("margin_right", margin_value)
