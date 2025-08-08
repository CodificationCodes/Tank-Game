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
#Script adapted from ChatGPT | First time using NavAgent and NavRegion so I needed extra help

extends Node2D

@onready var enemy = $TrainingEnemy
@onready var nav_agent: NavigationAgent2D = $TrainingEnemy/NavigationAgent2D
@onready var wait_timer: Timer = $TrainingEnemy/WaitTimer
@onready var epos_nodes := [$EPOS1, $EPOS2, $EPOS3, $EPOS4, $EPOS5, $EPOS6, $EPOS7, $EPOS8]

var current_target_index := -1
var speed := 100
var waiting := false

var objective1complete = false
var objective2complete = false
var objective3complete = false
var blockfirstobjectives = false
var tempblock = false

func _ready():
	randomize()
	wait_timer.timeout.connect(_on_wait_timer_timeout)
	choose_new_target()
	$CanvasLayer/VO2Script.hide()
	$CanvasLayer/VO3Script.hide()
	$CanvasLayer/DroneHealth.hide()
	$CanvasLayer/DroneHealth.frame = 6
	await get_tree().create_timer(1.5).timeout
	$VO1.play()

func _physics_process(delta):
	$CanvasLayer/DroneHealth.frame = Global.dronehealth
	
	if Global.dronehealth == 0 and tempblock == false:
		tempblock = true
		changescene()
		
	
	# Manages first objective
	if Input.is_action_pressed("tank1up") or Input.is_action_pressed("tank1down") or Input.is_action_pressed("tank1left") or Input.is_action_pressed("tank1right"):
		objective1complete = true
		
	if Input.is_action_pressed("tank1barleft") or Input.is_action_pressed("tank1barright"):
		objective2complete = true
		
	if waiting:
		return  # Enemy paused, waiting at stop
	
	if not nav_agent.is_navigation_finished():
		var next_pos = nav_agent.get_next_path_position()
		var direction = (next_pos - enemy.global_position).normalized()
		enemy.global_position += direction * speed * delta
	else:
		# Waiting at destination
		waiting = true
		wait_timer.start()
		
		
	# Update objectives display
	if objective1complete == true and blockfirstobjectives == false:
		$CanvasLayer/Objectives.frame = 1
	if objective2complete == true and blockfirstobjectives == false:
		$CanvasLayer/Objectives.frame = 2
	if objective1complete == true and objective2complete == true and blockfirstobjectives == false:
		$CanvasLayer/Objectives.frame = 3
		$Waypoint.show()
	if objective3complete == true:
		$CanvasLayer/Objectives.frame = 4

func choose_new_target():
	# Pick a random EPOS to pathfind to
	var new_index = current_target_index
	while new_index == current_target_index:
		new_index = randi() % epos_nodes.size()
	current_target_index = new_index
	
	# Set the navigation agent's target to the new position
	nav_agent.target_position = epos_nodes[current_target_index].global_position

func _on_wait_timer_timeout():
	waiting = false
	choose_new_target()
	
func _on_vo_1_finished() -> void:
	$CanvasLayer/VO1Script.hide() # Hides the subtitles once the VO is done

func _on_marker_entered(body: Node2D) -> void:
	if body.is_in_group("Tank1"):
		#$Waypoint/Marker.hide() #Hides the marker once the tank has hit it
		$Waypoint.global_position = Vector2(1000,1000)
		print($Waypoint.global_position)
		objective3complete = true
		$CanvasLayer/VO2Script.show()
		$VO2.play()
		blockfirstobjectives = true
		await get_tree().create_timer(21.81).timeout
		objective1complete = false
		objective2complete = false
		objective3complete = false
		$CanvasLayer/VO2Script.hide()
		$CanvasLayer/Objectives.frame = 5
		$CanvasLayer/DroneHealth.show()


func changescene():
	$TrainingEnemy.hide()
	$CanvasLayer/Objectives.frame = 6
	playvo()
	Global.firstplay = false
	saveManager.save()
	await get_tree().create_timer(10).timeout
	get_tree().change_scene_to_file("res://assets/scenes/ui/newmenu.tscn")
	
func playvo():
	$VO3.play()
	$CanvasLayer/VO3Script.show()
