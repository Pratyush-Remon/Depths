@icon("res://Scenes/DynamicObjects/Water/washer-svgrepo-com.svg")
extends Node
class_name FSM

#Variables for FSM
var count = 0
var states:Dictionary = {}
var current_state:State
@export var initial_state:State

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()]=child
			child.state_transition.connect(change_state)
	if initial_state:
		initial_state.enter_state()
		current_state = initial_state

func change_state():
	pass
