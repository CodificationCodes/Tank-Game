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
@export var abrams1 = preload("res://assets/scenes/vehicles/abrams1.tscn")
@export var abrams2 = preload("res://assets/scenes/vehicles/abrams2.tscn")
@export var devcar1 = preload("res://assets/scenes/vehicles/devCar1.tscn")
@export var devcar2 = preload("res://assets/scenes/vehicles/devCar2.tscn")
@export var t90_1 = preload("res://assets/scenes/vehicles/t90_1.tscn")
@export var t90_2 = preload("res://assets/scenes/vehicles/t90_2.tscn")
@export var _1_HEALTH_BAR_P_1 = preload("res://assets/scenes/healthbars/1HealthBarP1.tscn")
@export var _1_HEALTH_BAR_P_2 = preload("res://assets/scenes/healthbars/1HealthBarP2.tscn")
@export var _2_HEALTH_BAR_P_1 = preload("res://assets/scenes/healthbars/2HealthBarP1.tscn")
@export var _2_HEALTH_BAR_P_2 = preload("res://assets/scenes/healthbars/2HealthBarP2.tscn")
@export var _4_HEALTH_BAR_P_1 = preload("res://assets/scenes/healthbars/4HealthBarP1.tscn")
@export var _4_HEALTH_BAR_P_2 = preload("res://assets/scenes/healthbars/4HealthBarP2.tscn")
@export var _5_HEALTH_BAR_P_1 = preload("res://assets/scenes/healthbars/5HealthBarP1.tscn")
@export var _5_HEALTH_BAR_P_2 = preload("res://assets/scenes/healthbars/5HealthBarP2.tscn")

var healthbarP1
var healthbarP2

func _ready():
	transition_screen.visible = true
	transition_screen.transition_finished.connect(_on_transition_finished)
	transition_screen.fade_in()
	
	# Follows is the family reuinon of if statements. Im not proud of this, but it manages what vehicles and nametags get added to the map.
	if Global.tank1IDselected == 1:
		var tank1 = abrams1.instantiate()
		add_child(tank1)
		healthbarP1 = _5_HEALTH_BAR_P_1.instantiate()
		add_child(healthbarP1)
		tank1.rotation = deg_to_rad(90)
		tank1.position = Vector2(53, 90)
	elif Global.tank1IDselected == 2:
		var tank1 = t90_1.instantiate()
		add_child(tank1)
		healthbarP1 = _4_HEALTH_BAR_P_1.instantiate()
		add_child(healthbarP1)
		tank1.rotation = deg_to_rad(90)
		tank1.position = Vector2(53,90)
	else:
		var tank1 = devcar1.instantiate()
		add_child(tank1)
		healthbarP1 = _1_HEALTH_BAR_P_1.instantiate()
		add_child(healthbarP1)
		Global.tank1health = 1
		tank1.rotation = deg_to_rad(90)
		tank1.position = Vector2(53, 90)
		
	if Global.tank2IDselected == 1:
		var tank2 = abrams2.instantiate()
		add_child(tank2)
		healthbarP2 = _5_HEALTH_BAR_P_2.instantiate()
		add_child(healthbarP2)
		tank2.rotation = deg_to_rad(270)
		tank2.position = Vector2(1138, 590)
	elif Global.tank2IDselected == 2:
		var tank2 = t90_2.instantiate()
		add_child(tank2)
		healthbarP2 = _4_HEALTH_BAR_P_2.instantiate()
		add_child(tank2)
		tank2.rotation = deg_to_rad(270)
		tank2.position = Vector2(1138, 590)
	else:
		var tank2 = devcar2.instantiate()
		add_child(tank2)
		healthbarP2 = _1_HEALTH_BAR_P_2.instantiate()
		add_child(healthbarP2)
		Global.tank2health = 1
		tank2.rotation = deg_to_rad(270)
		tank2.position = Vector2(1138, 590)

func _process(delta):
	healthbarP1.get_child(0).frame = Global.tank1health
	healthbarP2.get_child(0).frame = Global.tank2health
	
	if Global.tank1health == 0:
		await get_tree().create_timer(4.0).timeout
		get_tree().change_scene_to_file("res://assets/scenes/healthbars/victory.tscn")
	elif Global.tank2health == 0:
		await get_tree().create_timer(4.0).timeout
		get_tree().change_scene_to_file("res://assets/scenes/ui/victory.tscn")

func _on_transition_finished():
	transition_screen.visible = false
