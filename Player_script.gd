extends CharacterBody2D

var speed = 400
var gravity = 1500
var jump_force = -575
var double_jump = 0
var attacking = false

@onready var animation_player = $AnimationPlayer
@onready var attack_area = $AttackArea
@onready var sprite = $AnimatedSprite2D

func _process(delta):
	if Input.is_action_just_pressed("punch") and not attacking:
		attacking = true
		sprite.play("punch")

	if Input.is_action_just_pressed("punch") and not attacking:
		attacking = true
		sprite.play("punch")

func _on_AnimatedSprite2D_frame_changed():
	if sprite.animation == "punch":
		match sprite.frame:
			2:
				attack_area.monitoring = true  # Enable hitbox on this frame
			4:
				attack_area.monitoring = false  # Disable it a few frames later


func _on_AttackArea_body_entered(body):
	if attacking and body.is_in_group("enemies"):
		body.take_damage(10)

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Horizontal movement
	if Input.is_action_pressed("move_right"):
		velocity.x = speed
		sprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		velocity.x = -speed
		sprite.flip_h = true
	else:
		velocity.x = 0

	# Play idle animation if not moving
	if velocity.x == 0 and velocity.y == 0 and not sprite.is_playing():
		sprite.play("Idle")

	# Jumping
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = jump_force
		double_jump = 1
	elif Input.is_action_just_pressed("jump") and double_jump == 1:
		velocity.y = jump_force
		double_jump = 0

	if is_on_floor():
		double_jump = 0

	move_and_slide()
