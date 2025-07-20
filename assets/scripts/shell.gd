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
#Script adapted from William Edwards @ bad games | he has a larger brain than me

extends Area2D

func _ready() -> void:
	position.x += sin(rotation) * 105
	position.y -= cos(rotation) * 105
	set_as_top_level(true)

func _physics_process(delta: float) -> void:
	position.x += sin(rotation) * 1000 * delta
	position.y -= cos(rotation) * 1000 * delta
	
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Tank1"):
		Global.tank1health -= 1
		print("Tank1Health: " + str(Global.tank1health))
	else:
		Global.tank2health -= 1
		print("Tank2Health: " + str(Global.tank2health)) 
	queue_free()
