extends Area2D
var body_ready = false
var body_player : CharacterBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if body_ready:
		body_player.velocity.y = -50
		body_player.move_and_slide()
		


func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		body_ready = true
		body_player = body

func _on_body_exited(body):
	if body.name == "CharacterBody2D":
		body_ready = false
