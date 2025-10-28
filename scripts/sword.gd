extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var sword_damage: int = 10

func _on_area_entered(area: Area2D) -> void:
	if animation_player.is_playing():
		if area is HitboxComponent:
			area.damage(Attack.new(sword_damage))
