extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	position.x += cos(rotation - deg_to_rad(90)) * 80
	position.y += sin(rotation - deg_to_rad(90)) * 80


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += cos(rotation - deg_to_rad(90)) * 10
	position.y += sin(rotation - deg_to_rad(90)) * 10


#func _on_body_entered(body):
	#get_tree(queue_free())
