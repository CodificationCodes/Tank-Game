extends Node2D

@export var scroll_speed := 25.0 # pixels per second
@export var end_delay := 2.0 # seconds to wait before ending

var credit_label: Label
var screen_height: float
var done := false

func _ready():
	$Music.play() # Play BG music
	credit_label = $CreditText
	screen_height = get_viewport().get_visible_rect().size.y
	
	# Start below the screen
	credit_label.position.y = screen_height

func _process(delta):
	if done:
		return

	credit_label.position.y -= scroll_speed * delta

	# Ends once its off screen
	if credit_label.position.y + credit_label.size.y < 0:
		done = true
		await get_tree().create_timer(end_delay).timeout
		get_tree().change_scene_to_file("res://assets/scenes/ui/newmenu.tscn")
