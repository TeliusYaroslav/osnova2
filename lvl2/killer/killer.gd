extends Area2D


class_name Killer

@onready var gg = $"../GG"




func _on_body_entered(body):
	if body.name == "GG":
		gg.hp -= 100
		
