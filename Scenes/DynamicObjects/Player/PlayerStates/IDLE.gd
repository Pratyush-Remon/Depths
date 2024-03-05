extends State
class_name IdleState

var player
# Called when the node enters the scene tree for the first time.
func enter_state():
	player = get_tree().get_first_node_in_group("Player")
	player.velocity = Vector2.ZERO

func update_state(_delta:float):
	print("Idle")
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		state_transition.emit(self,"move") 
	pass

func exit_state():
	pass
