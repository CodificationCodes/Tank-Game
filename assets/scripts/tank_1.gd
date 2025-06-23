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
@export var rotation_speed := 1.0
@export var lerp_weight := 0.1
@export var barrel_rotation_speed: float = 2.0
@onready var barrel = $Barrel1
@onready var lookat = $LookAt
var bullet_scene = load("res://assets/scenes/Bullet.tscn") as PackedScene


func _physics_process(delta):
	# Barrel rotation with Q/E
	var rotation_input = 0
	
	if Input.is_action_pressed("tank1barleft"):
		rotation_input -= 1
	if Input.is_action_pressed("tank1barright"):
		rotation_input += 1
		
	barrel.rotation += rotation_input * rotation_speed * delta  
	
	# Rotation input
	var rotate_input := Input.get_axis("tank1left", "tank1right")
	rotation += rotate_input * rotation_speed * delta
	
	# Forward/back movement
	var move_input := Input.get_axis("tank1down", "tank1up")
	var direction := Vector2(cos(rotation), sin(rotation))
	velocity = velocity.lerp(direction * move_input * speed, lerp_weight)
	
	if Input.is_action_just_pressed("tank1fire"):
		fire()
		#print("1fire")

	move_and_slide()

func fire():
	if bullet_scene:
		#print(rotation_degrees)
		var bullet = bullet_scene.instantiate()
		bullet.global_position = barrel.global_position
		bullet.rotation = barrel.global_rotation
		get_parent().add_child(bullet)
