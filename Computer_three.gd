extends Area2D

@onready var counter_comp = $"../Counter_comp"




func _on_body_entered(body):
	if (body.name == "Main_gg" and counter_comp.points >= 3):
		get_tree().change_scene_to_file("res://scenes/main.tscn") 
#and counter_comp.points > 3
