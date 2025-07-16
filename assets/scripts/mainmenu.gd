# _ __  _ __ ___  _ __                                  
#| '_ \| '__/ _ \| '_ \                                 
#| |_) | | | (_) | |_) |                                
#| .__/|_|  \___/| .__/                                 
#|_|            _|_| __ _           _   _               
#  ___ ___   __| (_)/ _(_) ___ __ _| |_(_) ___  _ __    
# / __/ _ \ / _ | | |_| |/ __/ _ | __| |/ _ \| '_ \   
#| (_| (_) | (_| | |  _| | (_| (_| | |_| | (_) | | | |_ 
# \___\___/ \__,_a|_|_| |_|\___\__,_|\__|_|\___/|_| |_(_)
#
#MIT license (See README.md for info)
#Copyright (c) 2025 Spike Forsythe ❤️

extends Control

@onready var text_edit = $TextEdit

func _process(delta):
	Global.playerName = text_edit.text
	print(text_edit.text)
#Button assignment
func _on_exit_button_pressed():
	get_tree().quit()

func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://assets/scenes/optionsmenu.tscn")

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://assets/scenes/moldova.tscn")
