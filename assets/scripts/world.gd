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
