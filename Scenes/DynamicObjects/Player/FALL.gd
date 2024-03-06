extends State

var player

func enter_state():
	player=get_tree().get_first_node_in_group("Player")
	player.velocity = Vector2.ZERO

func update_state(_delta):
	if !player.is_on_floor():
		player.velocity.y = 9.8*player.weight
	if player.in_water == true:
		player.velocity.y = 2.*player.weight
	if player.is_on_floor():
		state_transition.emit(self,"idle")
	if player.in_water == true :
		if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right")or Input.is_action_pressed("ui_up")or Input.is_action_pressed("ui_down"):
			state_transition.emit(self,"move")
