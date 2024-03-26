extends Area2D

@onready var game_manager = %GameManager



func _on_body_entered(body):
	if (body.name == "CharacterBody2D" and game_manager.points > 3):
		get_tree().change_scene_to_file("res://lvl2.tscn")
