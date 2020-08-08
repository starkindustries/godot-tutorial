extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const ACCELERATION = 500
const MAX_SPEED = 100
const FRICTION = 500
var velocity = Vector2.ZERO
onready var animation_player = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
		
func _physics_process(delta):
	# TODO: Fix jitter and stutter:
	# https://docs.godotengine.org/uk/latest/tutorials/misc/jitter_stutter.html
	# https://youtu.be/EQA9MJ5_TxU?t=922
	
	# delta is time spent to calculate frame
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength(("ui_right")) - Input.get_action_strength(("ui_left"))
	input_vector.y = Input.get_action_strength(("ui_down")) - Input.get_action_strength(("ui_up"))
	
	# https://www.youtube.com/watch?v=EQA9MJ5_TxU
	# normalized()
	# Returns the vector scaled to unit length. Equivalent to v / v.length().
	input_vector = input_vector.normalized()	
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
