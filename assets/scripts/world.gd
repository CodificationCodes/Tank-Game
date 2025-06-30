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

extends Node2D

@onready var label_node = $Tank1Nametag
@onready var tank_node = $"Tank Body1"

func _ready():
	pass
	
func _process(delta):
	# Move label to the tank
	if label_node and tank_node:
		label_node.global_position = tank_node.global_position + Vector2(-23, -50)
		
	label_node.text = Global.playerName
