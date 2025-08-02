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

signal transitioned

func _ready():
	transition()
	
func transition():
	$AnimationPlayer.play("fade_to_black")
	print("Fading to black")

func _on_animation_player_animation_finished(animName):
	if animName == "fade_to_black":
		print("Emit signal transitioned")
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_to_normal")
	if animName == "fade_to_normal":
		print("Finished fading")
