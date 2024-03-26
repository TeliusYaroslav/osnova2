extends Area2D

@onready var game_manager_2 = %Game_manager2



func _on_body_entered(body):
	if (body.name == "GG"):
		queue_free()
		game_manager_2.add_points()
