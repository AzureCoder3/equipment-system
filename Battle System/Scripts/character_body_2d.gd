extends CharacterBody2D


@onready var label = $Label 
@onready var _health = $Health

func _process(delta: float) -> void:
	label.text = str(_health.health)
	

	
	
