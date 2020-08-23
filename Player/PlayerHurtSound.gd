extends AudioStreamPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	# warning-ignore:return_value_discarded
	connect("finished", self, "queue_free")
