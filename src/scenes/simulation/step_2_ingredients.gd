# res://src/scenes/simulation/step_2_ingredients.gd
extends Control
func _ready() -> void:
	$BtnBack.pressed.connect(func(): EventBus.navigation_requested.emit("res://src/scenes/simulation/step_1_base.tscn"))
	$BtnNext.pressed.connect(func(): EventBus.navigation_requested.emit("res://src/scenes/simulation/step_3_summary.tscn"))
	
