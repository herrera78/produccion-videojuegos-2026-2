# res://src/scenes/simulation/step_3_summary.gd
extends Control
func _ready() -> void:
	$BtnMenu.pressed.connect(func(): EventBus.navigation_requested.emit("res://src/scenes/menu/menu_panel.tscn"))
	
