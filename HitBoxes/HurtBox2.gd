extends Area2D

const HitEffect = preload("res://Effects/HitEffect.tscn")

signal invincibility_started
signal invincibility_ended

@onready var timer = $Timer
@onready var collisionShape = $CollisionShape2D

func start_invincibility(duration):
	emit_signal("invincibility_started")
	timer.start(duration)

func create_hit_effect():
	var effect = HitEffect.instance()
	var main = get_tree().current_scene
	main.add_child(effect)
	effect.global_position = global_position

func _on_Timer_timeout():
	emit_signal("invincibility_ended")

func _on_HurtBox_invincibility_started():
	collisionShape.set_deferred("disabled", true)

func _on_HurtBox_invincibility_ended():
	collisionShape.set_deferred("disabled", false)


