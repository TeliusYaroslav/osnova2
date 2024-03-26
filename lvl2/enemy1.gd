extends RigidBody2D
class_name Enemy

@export var start_x: int = 100
@export var end_x: int = 400
@export var speed: float = 2
var direction 
var animation_enemy

var health = 100
var player_inattack_zone = false 
var can_take_damage = true


func _ready():
	var start_pos = Vector2()
	start_pos.x = start_x
	
	start_pos.y = position.y
	
	position = start_pos
	
	animation_enemy = get_node("AnimationPlayer")
	
func _process(delta):
	deal_with_damage()
	animation_enemy.play('walk')
	
	if start_x >= end_x:
		direction = -1
	elif start_x <= end_x:
		direction = 1
	
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
	elif direction == 1:
		$AnimatedSprite2D.flip_h = false
	
	if position.x > end_x - 10 and position.x < end_x + 10:
		var tmp = start_x
		start_x = end_x
		end_x = tmp
	
	linear_velocity.x = direction * speed
	move_and_collide(linear_velocity)
	
func enemy():
	pass



		

func deal_with_damage():
	if player_inattack_zone:
		if can_take_damage == true:
			if Input.is_action_just_pressed("attac"):
				health = health - 35
				$take_damage_cooldown.start()
				can_take_damage = false
				print('Anamy health:', health)
				if health <= 0:
					self.queue_free()
				
func _on_hitbox_1_body_entered(body):
	if body.has_method("player"):
		player_inattack_zone = true
		#can_take_damage = true
		

func _on_hitbox_1_body_exited(body):
	if body.has_method("player"):
		player_inattack_zone = false
		#can_take_damage = false


func _on_take_damage_cooldown_timeout():
	can_take_damage = true
