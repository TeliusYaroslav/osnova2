extends StaticBody2D

#@onready var gold_key_manager = get_parent().get_parent().get_node("Gold_Key_Manager")
@onready var gold_key_manager = $"../Gold_Key_Manager"



func _on_area_2d_body_entered(body):
	if body.name == "GG" and gold_key_manager.points >= 1 :
		$open.show()
		get_tree().change_scene_to_file("res://komp_lvl.tscn")


func _on_area_2d_body_exited(body):
	$open.hide()
