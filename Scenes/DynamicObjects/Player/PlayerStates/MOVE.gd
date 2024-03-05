extends State
class_name MoveState

#variables
var speed = 200
var player

func enter_state():
	player = get_tree().get_first_node_in_group("Player")
	player.velocity=Vector2.ZERO
	

func update_state(_delta:float):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		player.velocity=Input.get_vector("ui_left","ui_right","ui_down","ui_up")*200
	else:
		state_transition.emit(self,"idle")


