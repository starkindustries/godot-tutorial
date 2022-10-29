extends Control

@onready var heartUIFull = $HeartUIFull
@onready var heartUIEmpty = $HeartUIEmpty

# Hearts
var hearts = 4: set = _set_hearts
func _set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if heartUIFull != null:
		heartUIFull.size.x = hearts * 15

# Max Hearts
var max_hearts = 4 : set = _set_max_hearts
func _set_max_hearts(value):
	max_hearts = max(value, 1)
	self.hearts = min(hearts, max_hearts)
	if heartUIEmpty != null: 
		heartUIEmpty.size.x = max_hearts * 15

func _ready():
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	PlayerStats.health_changed.connect(_set_hearts)
	PlayerStats.max_health_changed.connect(_set_max_hearts)
