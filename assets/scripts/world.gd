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

extends Node2D

@onready var label_node = $Tank1Nametag
@onready var transition_screen = $Transition/TransitionScreen
@export var abrams1 = preload("res://assets/scenes/abrams1.tscn")
@export var abrams2 = preload("res://assets/scenes/abrams2.tscn")
@export var devcar1 = preload("res://assets/scenes/devCar1.tscn") 
@export var devcar2 = preload("res://assets/scenes/devCar2.tscn") 
@export var t90_1 = preload("res://assets/scenes/t90_1.tscn") 
@export var t90_2 = preload("res://assets/scenes/t90_2.tscn") 

func _ready():
	transition_screen.visible = true
	transition_screen.transition_finished.connect(_on_transition_finished)
	transition_screen.fade_in()
	
	if Global.tank1IDselected == 1:
		var tank1 = abrams1.instantiate()
		add_child(tank1)
		tank1.rotation = deg_to_rad(90)
		tank1.position = Vector2(53, 90)
	elif Global.tank1IDselected == 2:
		var tank1 = t90_1.instantiate()
		add_child(tank1)
		tank1.rotation = deg_to_rad(90)
		tank1.position = Vector2(53,90)
	else:
		var tank1 = devcar1.instantiate()
		add_child(tank1)
		Global.tank1health = 1
		tank1.rotation = deg_to_rad(90)
		tank1.position = Vector2(53, 90)
		
	if Global.tank2IDselected == 1:
		var tank2 = abrams2.instantiate()
		add_child(tank2)
		tank2.rotation = deg_to_rad(270)
		tank2.position = Vector2(1138, 590)
	elif Global.tank2IDselected == 2:
		var tank2 = t90_2.instantiate()
		add_child(tank2)
		tank2.rotation = deg_to_rad(270)
		tank2.position = Vector2(1138, 590)
	else:
		var tank2 = devcar2.instantiate()
		add_child(tank2)
		Global.tank2health = 1
		tank2.rotation = deg_to_rad(270)
		tank2.position = Vector2(1138, 590)

func _on_transition_finished():
	transition_screen.visible = false
