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

extends CharacterBody2D

@export var speed := 220
@export var rotation_speed := 2.0
@export var lerp_weight := 0.1
@onready var NokiaExplode: AudioStreamPlayer = $AudioStreamPlayer
@onready var dev_car: CharacterBody2D = $"."
var can_fire = true

func _ready():
	Global.tank2health = 1

func _physics_process(delta):
	
	# Rotation input
	var rotate_input := Input.get_axis("tank2left", "tank2right")
	rotation += rotate_input * rotation_speed * delta
	
	# Forward/back movement
	var move_input := Input.get_axis("tank2down", "tank2up")
	var direction := Vector2(cos(rotation), sin(rotation))
	velocity = velocity.lerp(direction * move_input * speed, lerp_weight)
	
	# Run Fire
	if Input.is_action_just_pressed("tank2fire") and can_fire:
		can_fire = false
		fire()
		
	if Global.tank2health == 0:
		queue_free()
		
	move_and_slide()

# Plays IED explosion sound effect and hides, pauses, and removes the car
func fire():
	NokiaExplode.play()
	await get_tree().create_timer(3.2).timeout
	
	dev_car.hide()
	
	var explosion_area = $ExplosionRadius
	var bodies = explosion_area.get_overlapping_bodies()
	
	for body in bodies:
		if body.is_in_group("Tank1"):
			body.queue_free()
	
	await get_tree().create_timer(7.0).timeout
	queue_free()
