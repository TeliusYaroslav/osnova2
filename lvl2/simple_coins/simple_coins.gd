extends Area2D

@onready var game_manager_1 = %Game_Manager1




func _on_body_entered(body):
	if (body.name == "GG"):
		queue_free()
		game_manager_1.add_points()
