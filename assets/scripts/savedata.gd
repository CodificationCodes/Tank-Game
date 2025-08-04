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
#Script adapted from garrettrandolph @ DevWorm

extends Node

var save_path = "user://saveData.save"

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(Global.p1money)
	file.store_var(Global.p2money)
	
func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		Global.p1money = file.get_var(Global.p1money)
		Global.p2money = file.get_var(Global.p2money)
	else:
		print("data failed to save")
		Global.p1money = 0
		Global.p2money = 0 
