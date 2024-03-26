extends RigidBody2D
class_name Bullet
var speed = 10
var direction = 1
var velocity = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = 0  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#position += transform.x * sp
	
	velocity.x = speed * direction
	var collision = move_and_collide(velocity)
	if collision:
		var collision_body  = collision.get_collider()
		print(collision_body)
		if collision_body.is_in_group("Player"):
			collision_body.hp -= 25
			queue_free()
		else:
			queue_free()
func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.hp -= 25
		queue_free()

