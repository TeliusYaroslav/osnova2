extends Area2D

@onready var player = $".."
@onready var killer = $"."
@onready var small_killer = $"."



func _on_body_entered(body):
	if body is Enemy:
		player.hp -= 25
	if body is Killer:
		player.hp -= 100	
	if body is SmallKiller:
		player.hp -= 100	
	if body is SecondTypeEnemy:
		player.hp -= 20
	if body is Bullet:
		player.hp -= 25
	if body is Mag:
		player.hp -=20 
		

