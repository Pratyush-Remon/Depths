extends State
class_name MoveState

#variables
var speed = 200
var player

func enter_state():
	player = get_tree().get_first_node_in_group("Player")
	player.velocity=Vector2.ZERO
	

func update_state(_delta:float):
	if player.in_water == true:
		if (Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down")):
			player.velocity=Input.get_vector("ui_left","ui_right","ui_up","ui_down")*200
			if player .in_water == false:
				state_transition.emit(self,"idle")
				
	if player.in_water == false:
		if !player.is_on_floor():
			player.velocity = Vector2.ZERO
			state_transition.emit(self,"fall")
		if Input.is_action_pressed("ui_left"):
			player.velocity.x = -200
			if !player.is_on_floor():
				player.velocity = Vector2.ZERO
				state_transition.emit(self,"fall")
		if Input.is_action_pressed("ui_right"):
			player.velocity.x = 200
			if !player.is_on_floor():
				player.velocity = Vector2.ZERO
				state_transition.emit(self,"fall")
	if Input.is_action_just_released("ui_right") or Input.is_action_just_released("ui_left") or Input.is_action_just_released("ui_up") or Input.is_action_just_released("ui_down"):
		player.velocity = Vector2.ZERO
		state_transition.emit(self,"idle")
	
		

