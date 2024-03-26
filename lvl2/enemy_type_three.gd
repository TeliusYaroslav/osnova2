extends RigidBody2D
class_name Mag
@export var bullet : PackedScene
var player_inattack_zone = false 
var can_take_damage = true
var health = 100
@export var direction : bool = true

# Called when the node enters the scene tree for the first time.



func _physics_process(delta):
	deal_with_damage()
  
func deal_with_damage():
	if player_inattack_zone:
		if can_take_damage == true:
			if Input.is_action_just_pressed("attac"):
				health = health - 35
				$take_cooldown_damage.start()
				can_take_damage = false
				print('Anamy health:', health)
				if health <= 0:
					self.queue_free()
					
					
func _on_take_cooldown_damage_timeout():
	can_take_damage = true

  
func shoot():
	var b = bullet.instantiate()
	get_parent().call_deferred("add_child" , b)  
	#b.transform = $Node/Marker2D.transform
	if direction == true:
		b.position = $Markerright2D.global_position
		b.direction = 1
	else :
		b.direction = -1
		b.position = $Markerleft2D2.global_position

func _on_detection_area_body_entered(body):
	deal_with_damage()
	if body.has_method("player"):
		var player_direction = Vector2.RIGHT
		if body.global_position.x > global_position.x:
			player_direction = Vector2.LEFT
	## Разворачиваем мага в направлении игрока
		#look_at(global_position + player_direction)
	shoot()
	







