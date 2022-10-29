extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	# warning-ignore:return_value_discarded
	
	# Old Godot 3 way to connect signals:
	# self.connect("animation_finished", self, "_on_animation_finished")
	# New Godot 4 way:
	self.animation_finished.connect(_on_animation_finished)
	play("Animate")

func _on_animation_finished():
	queue_free()
