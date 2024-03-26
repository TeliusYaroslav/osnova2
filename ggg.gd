extends CharacterBody2D

const SPEED = 10

@onready var actionable_finder: Area2D = $Direction/ActionableFinder
var velocityy = Vector2.ZERO
var animated_player 
func _ready():
	var player = $AnimatedSprite2D
	

func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("right"):
		velocity.x += SPEED
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x -= SPEED
		$AnimatedSprite2D.play("walk")
		$AnimatedSprite2D.flip_h = true
	elif Input.is_action_pressed("up"):
		velocity.y -= SPEED
		$AnimatedSprite2D.play("up")
	elif Input.is_action_pressed("down"):
		$AnimatedSprite2D.play("down")
		velocity.y += SPEED
	else:
		$AnimatedSprite2D.stop()
	velocity = velocity.normalized() * SPEED
	move_and_collide(velocity)
	#var isleft = velocity.x < 0d



func _on_computer_three_body_entered(body):
	pass # Replace with function body.
