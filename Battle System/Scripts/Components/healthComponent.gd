class_name Health
extends Node

@export var max_health : int
@onready var health : int = max_health

func _ready() -> void:
	damaged(25)
	
func damaged(attack):
	health -= attack
	
	print("I took damage, my health is", health, "over", max_health)
	
	if health < 0:
		get_parent().queue_free()
	
	
	
