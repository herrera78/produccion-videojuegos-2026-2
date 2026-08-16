# res://src/scenes/menu/menu_panel.gd
extends Control

@onready var btn_simulation: Button = $VBoxContainer/BtnSimulacion
@onready var btn_config: Button = $VBoxContainer/BtnConfig
@onready var btn_credits: Button = $VBoxContainer/BtnCredits
@onready var btn_exit: Button = $VBoxContainer/BtnExit

func _ready() -> void:
	btn_simulation.pressed.connect(func(): EventBus.navigation_requested.emit("res://src/scenes/simulation/step_1_base.tscn"))
	btn_config.pressed.connect(func(): EventBus.navigation_requested.emit("res://src/scenes/config/config_panel.tscn"))
	btn_credits.pressed.connect(func(): EventBus.navigation_requested.emit("res://src/scenes/credits/credits_panel.tscn"))
	btn_exit.pressed.connect(func(): get_tree().quit())
	
