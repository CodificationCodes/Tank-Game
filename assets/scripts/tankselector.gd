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
#THIS IS THE OLD TANK SELECTOR, FOR REFERENCE ONLY

extends Control
# These are the tanks id's, 1 = abrams, 2 = another tank, 3 = dev car
var tank1selection = 1
var tank2selection = 1
var tank1currentframe = 0
var tank2currentframe = 0
@onready var tank1visref: AnimatedSprite2D = $Tank1VisualRef
@onready var tank2visref: AnimatedSprite2D = $Tank2VisualRef

func _process(_delta):
	#Locks the selection
	Global.tank1IDselected = tank1selection
	Global.tank2IDselected = tank2selection
	tank1visref.frame = tank1currentframe
	tank2visref.frame = tank2currentframe
	
# Allows the numbers to loop between 1-3
	if tank1selection == 0 or tank1selection == 4:
		tank1selection = 1
		tank1currentframe = 0
		
	if tank2selection == 0 or tank2selection == 4:
		tank2selection = 1
		tank2currentframe = 0

#func _on_play_button_pressed() -> void:
#	get_tree().change_scene_to_file("res://assets/scenes/moldova.tscn")

func _on_select_1_right_pressed() -> void:
	tank1selection = tank1selection + 1
	tank1currentframe += 1

func _on_select_1_left_pressed() -> void:
	if tank1selection == 1:
		tank1selection = 3
		tank1currentframe += 2
	else:
		tank1selection = tank1selection - 1
		tank1currentframe -= 1

func _on_select_2_right_pressed() -> void:
	tank2selection = tank2selection + 1
	tank2currentframe += 1

func _on_select_2_left_pressed() -> void:
	if tank2selection == 1:
		tank2selection = 3
		tank2currentframe += 2
	else:
		tank2selection = tank2selection - 1
		tank2currentframe -= 1
