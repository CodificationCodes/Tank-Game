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

extends CharacterBody2D

@export var speed := 110.0
@export var rotation_speed := 1.0  #radians per second
@export var lerp_weight := 0.1
@export var barrel_rotation_speed: float = 2.0
@onready var barrel = $Barrel1
@onready var lookat = $LookAt

func get_local_angle(global_angle: float) -> float:
	return wrapf(global_angle - rotation, -PI, PI)

var touching_wall = false

func _physics_process(delta):
	
	##barrel rotation with mouse pos
	#var mouse_pos = get_global_mouse_position()
	#var to_mouse =  (mouse_pos - global_position).angle()
	#
	#var local_angle = get_local_angle(to_mouse)
	#var clamped_angle = clamp(local_angle, deg_to_rad(-45), deg_to_rad(45))
	#
	#barrel.rotation = lerp_angle(barrel.rotation, clamped_angle, delta * 2)
	
	#q/e barrel rotation
	var rotation_input = 0
	
	if Input.is_action_pressed("tank2barleft"):
		rotation_input -= 1
	if Input.is_action_pressed("tank2barright"):
		rotation_input += 1
		
	barrel.rotation += rotation_input * rotation_speed * delta	
	
	#Rotation input 
	var rotate_input := Input.get_axis("tank2left", "tank2right")
	rotation += rotate_input * rotation_speed * delta
	
	#Forawrd/back input
	var move_input := Input.get_axis("tank2down", "tank2up")
	var direction := Vector2(cos(rotation), sin(rotation))
	velocity = velocity.lerp(direction * move_input * speed, lerp_weight)
	
#	if Input.is_action_just_pressed("tank1fire"):
#		pass
	move_and_slide()
