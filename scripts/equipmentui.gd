extends Control

@onready var slot1 = $EquipmentSlotsContainer/EquipmentSlot1/Slot1
@onready var slot2 = $EquipmentSlotsContainer/EquipmentSlot2/Slot2
@onready var slot3 = $EquipmentSlotsContainer/EquipmentSlot3/Slot3
@onready var slot4 = $EquipmentSlotsContainer/EquipmentSlot4/Slot4
@onready var slot5 = $EquipmentSlotsContainer/EquipmentSlot5/Slot5

@onready var equipment1 = $EquipmentMenu/MarginContainer/Equipments/Equipment1
@onready var equipment2 = $EquipmentMenu/MarginContainer/Equipments/Equipment2
@onready var equipment3 = $EquipmentMenu/MarginContainer/Equipments/Equipment3

@onready var mouse_entered_e1: bool = false
@onready var mouse_entered_e2: bool = false
@onready var mouse_entered_e3: bool = false
@onready var original_position_array: Array

#Constants
@onready var DRAG_OFFSET = Vector2(-100,-100)
@onready var SPEED: int = 40

func _ready() -> void:
	
	#gets the position of each equipment node
	#apparently the position will be the parent node if the await is not there
	
	await get_tree().process_frame
	original_position_array.append(equipment1.global_position)
	original_position_array.append(equipment2.global_position)
	original_position_array.append(equipment3.global_position)
	
	
func _process(delta: float) -> void:
	#quick exit key
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()
	
	#checks if left clicked is pressed AND the mouse is inside the icon, then it lets it drag around
	if Input.is_action_pressed("left_click") and mouse_entered_e1:
		equipment1.global_position = equipment1.global_position.lerp(get_global_mouse_position() + DRAG_OFFSET, SPEED*delta)
		
	if Input.is_action_pressed("left_click") and mouse_entered_e2:
		equipment2.global_position = equipment2.global_position.lerp(get_global_mouse_position() + DRAG_OFFSET, SPEED*delta)
	
	if Input.is_action_pressed("left_click") and mouse_entered_e3:
		equipment3.global_position = equipment3.global_position.lerp(get_global_mouse_position() + DRAG_OFFSET, SPEED*delta)	
	
#=====================================================================================================
	
	#if the mouse is released, then it will return to the position it was originally on
	if Input.is_action_just_released("left_click") and mouse_entered_e1:
		equipment1.global_position = original_position_array[0]
		
	if Input.is_action_just_released("left_click") and mouse_entered_e2:
		equipment2.global_position = original_position_array[1]
		
	if Input.is_action_just_released("left_click") and mouse_entered_e3:
		equipment3.global_position = original_position_array[2]



#checks if the mouse entered or not for the dragging part
func _on_equipment_1_mouse_entered() -> void:
	#idk how this worked pero it is what it is
	if not(mouse_entered_e2 or mouse_entered_e3):
		mouse_entered_e1 = true

func _on_equipment_1_mouse_exited() -> void:
	if not Input.is_action_pressed("left_click"):
		mouse_entered_e1 = false


func _on_equipment_2_mouse_entered() -> void:
	if not(mouse_entered_e1 or mouse_entered_e3):
		mouse_entered_e2 = true

func _on_equipment_2_mouse_exited() -> void:
	if not Input.is_action_pressed("left_click"):
		mouse_entered_e2 = false


func _on_equipment_3_mouse_entered() -> void:
	if not(mouse_entered_e2 or mouse_entered_e1):
		mouse_entered_e3 = true

func _on_equipment_3_mouse_exited() -> void:
	if not Input.is_action_pressed("left_click"):
		mouse_entered_e3 = false
