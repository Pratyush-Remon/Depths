extends CharacterBody2D
class_name Player

@export var in_water:bool = false
@export var weight:float = 25


func _physics_process(delta):
	move_and_slide()
	


func _on_area_2d_area_entered(area):
	if area.is_in_group("Water"):
		in_water = true


func _on_area_2d_area_exited(area):
	if area.is_in_group("Water"):
		in_water = false
