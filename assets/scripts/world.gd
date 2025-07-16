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
#Copyright (c) 2025 Spike Forsythe ❤️dw

extends Node2D
@onready var fire: AnimatedSprite2D = $Fire
@onready var label_node = $Tank1Nametag
@export var abrams1 = preload("res://assets/scenes/abrams1.tscn")
@export var abrams2 = preload("res://assets/scenes/abrams2.tscn")

func _ready():
	fire.play("loop")
	#Line 22-28 Insantiates the players selected tank as tank1
	if Global.tank1IDselected == 1:
		var tank1 = abrams1.instantiate()
		add_child(tank1)
	elif Global.tank1IDselected == 2:
		pass
	else:
		pass
	
	if Global.tank2IDselected == 1:
		var tank2 = abrams2.instantiate()
		add_child(tank2)
	elif Global.tank2IDselected == 2:
		pass
	else:
		pass
		
#func _process(delta):
#	# Move nametag to the tank
#	if label_node and tank_node:
#		label_node.global_position = tank_node.global_position + Vector2(-23, -50)
#		
#	label_node.text = Global.playerName
