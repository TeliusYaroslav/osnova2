extends RigidBody2D
class_name SecondTypeEnemy
@export var start_x: int = 200
var player_chase = false
var players = null
var speed = 200
var chase_direction = Vector2.ZERO
var previous_direction = Vector2.ZERO

var player_in_left_area = false
var player_in_right_area = false

var health = 100
var player_inattack_zone = false
var can_take_damage = true
var animation_enemy
func _ready():
	animation_enemy = get_node("AnimationPlayer")

func _physics_process(delta):
	deal_with_damage()
	
   #Проверяем, находится ли игрок в левой области
	if player_in_left_area:
		chase_direction = Vector2.LEFT
		$AnimatedSprite2D.flip_h = true 
		$AnimatedSprite2D.play("walk") # Направление вправо
  # Проверяем, находится ли игрок в правой области
	elif player_in_right_area:
		chase_direction = Vector2.RIGHT
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("walk")  # Направление влево
  
  # Если игрок преследуется и его позиция известна
	if player_chase and players != null:
	# Перемещаем бота в соответствии с текущим направлением
		position += chase_direction * speed * delta
  # Если игрок не обнаружен, возвращаемся в предыдущее направление
	elif not player_chase:
		position += previous_direction * speed * delta
	
	
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



#

func _on_detection_area_left_body_entered(body):
	if body.has_method("player"):
		players = body
		player_chase = true
		player_inattack_zone = true
		player_in_left_area = true
		chase_direction = Vector2.LEFT
	#chase_direction = Vector2.LEFT * speed


func _on_detection_area_left_body_exited(body):
	if body.has_method("player"):
		players = null
		player_chase = false
	#previous_direction = chase_direction
		player_inattack_zone = false
		player_in_left_area = false
		chase_direction = Vector2.ZERO
		$AnimatedSprite2D.stop()

#

func _on_detection_area_right_body_entered(body):
	if body.has_method("player"):
		players = body
		player_chase = true
		player_inattack_zone = true
	#chase_direction = Vector2.RIGHT * speed
		player_in_right_area = true
		chase_direction = Vector2.RIGHT


func _on_detection_area_right_body_exited(body):
	if body.has_method("player"):
		players = null
		player_chase = false
	#previous_direction = chase_direction
		player_inattack_zone = false
		player_in_right_area = false
		chase_direction = Vector2.ZERO
		$AnimatedSprite2D.stop()


func _on_take_cooldown_damage_timeout():
	can_take_damage = true
