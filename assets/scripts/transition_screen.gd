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

extends CanvasLayer

signal transition_halfway  # Emitted when screen is fully black
signal transition_finished # Emitted when fade back is complete
@export var black_screen_duration := 1  # Change this to adjust how long screen is fully black for

func fade_out():
	visible = true
	$AnimationPlayer.play("fade_to_black")

func fade_in():
	visible = true
	$AnimationPlayer.play("fade_to_normal")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		await get_tree().create_timer(black_screen_duration).timeout 
		emit_signal("transition_halfway")
	elif anim_name == "fade_to_normal":
		emit_signal("transition_finished")
		visible = false
