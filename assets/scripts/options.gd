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

func _on_fullscreen_pressed() -> void:
	# Toggle fullscreen in a script, like from a button press or input
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_return_pressed() -> void:
	get_tree().change_scene_to_file("res://assets/scenes/ui/newmenu.tscn")


func _on_clear_moneys_pressed() -> void:
	Global.p1money = 0
	Global.p2money = 0
	Global.firstplay = true
	saveManager.save()


func _on_add_moneys_pressed() -> void:
	Global.p1money = 9999999
	Global.p2money = 9999999
	saveManager.save()
