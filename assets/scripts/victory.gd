# _ __  _ __ ___  _ __                                
#| '_ \| '__/ _ \| '_ \                               
#| |_) | | | (_) | |_) |                              
#| .__/|_|  \___/| .__/                               
#|_|             |_|                                  
#               _ _  __ _           _   _             
#  ___ ___   __| (_)/ _(_) ___ __ _| |_(_) ___  _ __  
# / __/ _ \ / _` | | |_| |/ __/ _` | __| |/ _ \| '_ \ 
#| (_| (_) | (_| | |  _| | (_| (_| | |_| | (_) | | | |
# \___\___/ \__,_|_|_| |_|\___\__,_|\__|_|\___/|_| |_|
#
#MIT license (See README.md for info)
#Copyright (c) 2025 Spike Forsythe ❤️

extends Control

func _ready() -> void:
	# if statement between 19-26 chooses what tank to feature as winning
	if Global.winningtank == 1:
		$VictoryForeground.frame = 0
		Global.p1money += 100
		Global.p2money += -25
		saveManager.save()
	else:
		$VictoryForeground.frame = 1
		Global.p2money += 100
		Global.p2money += -25
		saveManager.save()

	# if statement 26-29 chooses what map to place on the background of the victory screen
	if Global.selectedmap == "moldova":
		$"VictoryBackground(Map)".frame = 0
	else:
		pass
	
	if Global.tank1IDselected == 1:
		$P1_Tank.frame = 0
	elif Global.tank1IDselected == 2:
		$P1_Tank.frame = 1
	else:
		$P1_Tank.frame = 2
		
func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/scenes/ui/newmenu.tscn")
