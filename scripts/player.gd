extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var sword_animation_player: AnimationPlayer = $Sword/AnimationPlayer

enum State {ON_FLOOR, IN_AIR, JUMPED_IN_AIR}
var state: State = State.ON_FLOOR


func _physics_process(delta: float) -> void:
	if not is_on_floor() and state != State.JUMPED_IN_AIR:
		state = State.IN_AIR
	if is_on_floor():
		state = State.ON_FLOOR
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		sword_animation_player.play("swing")

	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		elif state == State.IN_AIR:
			velocity.y = JUMP_VELOCITY
			state = State.JUMPED_IN_AIR
	
	# Get 
	var direction := Input.get_axis("move_left", "move_right")
	
	#Flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#play animation
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	# apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
