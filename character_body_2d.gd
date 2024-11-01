extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D


func _ready():
	add_to_group("player")

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sprite.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		velocity.x = direction * SPEED
		if is_on_floor():
			sprite.play("drive")
		sprite.flip_h = direction < 0  # Flip sprite based on direction
	elif is_on_floor():
		sprite.play("default")  # Only idle if on the ground
	if not is_on_floor() and velocity.y < 0:
		sprite.play("jump")

	move_and_slide()
