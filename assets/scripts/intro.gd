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

func _ready():
	$AudioStreamPlayer.play()
	saveManager.load_data()
	print("-User Information-")
	print("First time playing? " + str(Global.firstplay))
	print("Player 1 money: " + str(Global.p1money))
	print("Player 2 money: " + str (Global.p2money))
	saveManager.save()

func _on_button_pressed() -> void:
	$Click.play()
	if Global.firstplay == true:
		get_tree().change_scene_to_file("res://assets/scenes/tutorial.tscn")
	else:
		Global.firstplay = false
		get_tree().change_scene_to_file("res://assets/scenes/ui/newmenu.tscn")
