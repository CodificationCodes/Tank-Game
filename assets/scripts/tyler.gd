extends Sprite2D


func _physics_process(delta):
	if Input.is_action_pressed("tank2down"):
		position.y = position.y + 10

	if Input.is_action_pressed("tank2up"):
		position.y = position.y - 10

	if Input.is_action_pressed("tank2left"):
		position.x = position.x - 10

	if Input.is_action_pressed("tank2right"):
		position.x = position.x + 10
