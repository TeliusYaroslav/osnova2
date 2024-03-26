extends Area2D
var player_entered = false

@onready var game_manager = %GameManager




func _on_body_entered(body):
	if (body.name == "CharacterBody2D" and not player_entered):
		game_manager.add_point()
		player_entered = true

