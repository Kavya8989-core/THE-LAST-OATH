extends CharacterBody2D
@onready var mc = $AnimatedSprite2D

const SPEED = 100
var last_direction = ""

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
	process_animation(direction)

	move_and_slide()
func process_animation(direction):
	if Input.is_action_pressed("walk right"):
		mc.play("walk right")
		last_direction = "right"
	elif Input.is_action_pressed("walk left"):
		mc.play("walk left")
		last_direction = "left"
	elif Input.is_action_pressed("walk up"):
		mc.play("walk top")
		last_direction = "top"
	elif Input.is_action_pressed("walk down"):
		mc.play("walk down")
		last_direction = "down"
	else:
		mc.play("idle " + last_direction)
