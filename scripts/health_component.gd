extends Node2D
class_name HealthComponent

@export var MAX_HEALTH := 10
var health: int

func _ready() -> void:
	health = MAX_HEALTH

func damage(attack: Attack) -> void:
	health -= attack.damage_amount
	if health <= 0:
		get_parent().queue_free()
