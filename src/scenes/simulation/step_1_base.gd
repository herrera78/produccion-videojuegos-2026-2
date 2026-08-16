extends Control
func _ready() -> void:
	$BtnNext.pressed.connect(func(): EventBus.navigation_requested.emit("res://src/scenes/simulation/step_2_ingredients.tscn"))
