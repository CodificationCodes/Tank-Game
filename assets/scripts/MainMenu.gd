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

var tank1selection = 1
var tank2selection = 1
var tank1currentframe = 0
var tank2currentframe = 0
var mapselection = 1
@onready var tank1visref: AnimatedSprite2D = $Tank1VisualRef
@onready var tank2visref: AnimatedSprite2D = $Tank2VisualRef
@onready var p1moneyvisref: RichTextLabel = $p1money
@onready var p2moneyvisref: RichTextLabel = $p2money
@onready var transition_screen: CanvasLayer = $Transition/TransitionScreen

func _ready():
	transition_screen.visible = false
	transition_screen.transition_halfway.connect(_on_transition_halfway)

func _process(_delta):
	Global.tank1IDselected = tank1selection
	Global.tank2IDselected = tank2selection
	tank1visref.frame = tank1currentframe
	tank2visref.frame = tank2currentframe
	
	# Update the visrefs for the money
	p1moneyvisref.text = str(Global.p1money)
	p2moneyvisref.text = str(Global.p2money)
	
	# This manages the loop of the tank's visref (incredibly bad)
	if tank1selection == 0 or tank1selection == 4:
		tank1selection = 1
		tank1currentframe = 0
	if tank2selection == 0 or tank2selection == 4:
		tank2selection = 1
		tank2currentframe = 0

func _on_p_1_vehicle_up_pressed() -> void:
	$Click.play()
	tank1selection += 1
	tank1currentframe += 1
	
func _on_p_1_vehicle_down_pressed() -> void:
	$Click.play()
	if tank1selection == 1:
		tank1selection = 3
		tank1currentframe += 2
	else:
		tank1selection -= 1
		tank1currentframe -= 1

func _on_p_2_vehicle_up_pressed() -> void:
	$Click.play()
	tank2selection += 1
	tank2currentframe += 1

func _on_p_2_vehicle_down_pressed() -> void:
	$Click.play()
	if tank2selection == 1:
		tank2selection = 3
		tank2currentframe += 2
	else:
		tank2selection -= 1
		tank2currentframe -= 1

func _on_quit_pressed() -> void:
	$Click.play()
	saveManager.save()
	get_tree().quit()

func _on_begin_pressed() -> void:
	$Click.play()
	saveManager.save()
	transition_screen.fade_out()

func _on_settings_pressed() -> void:
	$Click.play()
	get_tree().change_scene_to_file("res://assets/scenes/ui/options.tscn")

func _on_transition_halfway():
	get_tree().change_scene_to_file("res://assets/scenes/moldova.tscn")


func _on_credits_pressed() -> void:
	$Click.play()
	get_tree().change_scene_to_file("res://assets/scenes/ui/credits.tscn")
