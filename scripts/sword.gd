extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_area_entered(area: Area2D) -> void:
	if area.name == "Killzone" and animation_player.is_playing():
		area.get_parent().hit_by_sword()
