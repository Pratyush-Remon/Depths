extends State
class_name IdleState

var player
# Called when the node enters the scene tree for the first time.
func enter_state():
	player = get_tree().get_first_node_in_group("Player")
	player.velocity = Vector2.ZERO

func update_state(_delta:float):
	if !player.is_on_floor():
		player.velocity = Vector2.ZERO
		state_transition.emit(self,"fall")
	if player.is_on_floor()	:
		if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
			state_transition.emit(self,"move") 
	if player.in_water == true :
		if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")or Input.is_action_pressed("ui_up")or Input.is_action_pressed("ui_down"):
			state_transition.emit(self,"move")
	else:
		player.velocity = Vector2.ZERO
		
func exit_state():
	pass
