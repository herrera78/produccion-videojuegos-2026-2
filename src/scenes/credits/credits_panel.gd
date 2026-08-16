# res://src/scenes/credits/credits_panel.gd
extends Control
func _ready() -> void:
   $BtnBack.pressed.connect(func():EventBus.navigation_requested.emit("res://src/scenes/menu/menu_panel.tscn")
   )
