extends CharacterBody2D
class_name Player

@export var in_water:bool = false


func _physics_process(delta):
	velocity.y = 200
	if Input.is_action_pressed("ui_up"):
		velocity.y = -400
	print(in_water)
	move_and_slide()
	


func _on_area_2d_area_entered(area):
	if area.is_in_group("Water"):
		in_water = true


func _on_area_2d_area_exited(area):
	if area.is_in_group("Water"):
		in_water = false
