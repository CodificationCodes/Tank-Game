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

extends Sprite2D

@export var min_angle: float = -30 #Min rotation angle
@export var max_angle: float = 12  #Max rotation angle

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	var direction = (mouse_pos - global_position).normalized()
	var target_rotation = direction.angle()
	
	#Radians to degrees
	var target_rotation_degrees = rad_to_deg(target_rotation)

	#Clamp rotation
	target_rotation_degrees = clamp(target_rotation_degrees, min_angle, max_angle)

	rotation = deg_to_rad(target_rotation_degrees)
