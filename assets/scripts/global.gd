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

extends Node

var playerName
var tank1IDselected : int = 1
var tank2IDselected : int = 1
var tank1health : int
var tank2health : int
var p1money : int
var p2money : int
var firstplay

func _ready():
	debug_loop()
	
func debug_loop() -> void:
	pass
#	while true:
#		print("Tank1ID: " + str(tank1health))
#		print("Tank2ID: " + str(tank1health))
#		print(" ")
#		await get_tree().create_timer(2.0).timeout
