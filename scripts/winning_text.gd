extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Events.connect("teddybear_picked_up", self.on_teddybear_picked_up)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func on_teddybear_picked_up():
	self.visible = true
