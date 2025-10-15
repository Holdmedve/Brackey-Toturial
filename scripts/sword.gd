extends Area2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready() -> void:
	var combat_data = {
		"id": get_instance_id(),
		"node": self,
		"health": 0,
		"attack": 5,
	}
	CombatSystem.register(combat_data)

func _on_area_entered(area: Area2D) -> void:
	if animation_player.is_playing():
		CombatSystem.apply_hit(self.get_instance_id(), area.get_instance_id())
