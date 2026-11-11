extends CharacterBody2D
@onready var mc = $AnimatedSprite2D

const SPEED = 300.0


func _physics_process(delta: float) -> void:

	var direction := Vector2.ZERO
	if Input.is_action_pressed("walk right"):
		direction.x += 1
	if Input.is_action_pressed("walk left"):
		direction.x += -1
	if Input.is_action_pressed("walk up"):
		direction.y += -1
	if Input.is_action_pressed("walk down"):
		direction.y += 1
	velocity = direction.normalized() * SPEED

	move_and_slide()
