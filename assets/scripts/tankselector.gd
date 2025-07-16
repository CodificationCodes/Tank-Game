extends Control
# These are the tanks id's, 1 = abrams, 2 = another tank, etc
var tank1selection = 1
var tank2selection = 1

func _process(delta):
# Allows the numbers to loop between 1-3
	if tank1selection == 0 or tank1selection == 4:
		tank1selection = 1
		
	if tank2selection == 0 or tank2selection == 4:
		tank2selection = 1
	print(tank2selection)

func _on_play_button_pressed() -> void:
	Global.tank1IDselected = tank1selection
	get_tree().change_scene_to_file("res://assets/scenes/moldova.tscn")

func _on_select_1_right_pressed() -> void:
	tank1selection = tank1selection + 1

func _on_select_1_left_pressed() -> void:
	if tank1selection == 1:
		tank1selection = 3
	else:
		tank1selection = tank1selection - 1

func _on_select_2_right_pressed() -> void:
	tank2selection = tank2selection + 1

func _on_select_2_left_pressed() -> void:
	if tank2selection == 1:
		tank2selection = 3
	else:
		tank2selection = tank2selection - 1
