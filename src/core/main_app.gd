# res://src/core/main_app.gd
extends Node

@onready var scene_container: Control = $SceneContainer
var current_scene: Node = null

func _ready() -> void:
	# Conectar el controlador central al EventBus global
	EventBus.navigation_requested.connect(_on_navigation_requested)
	# Cargar la escena inicial del menú de forma segura
	_on_navigation_requested("res://src/scenes/menu/menu_panel.tscn")

func _on_navigation_requested(target_scene_path: String) -> void:
	# 1. Liberar de memoria la escena activa previa
	if current_scene:
		current_scene.queue_free()
		current_scene = null # Limpieza de referencia segura

	# 2. Cargar dinámicamente el nuevo recurso de escena
	var new_scene_resource = load(target_scene_path)

	if new_scene_resource:
		current_scene = new_scene_resource.instantiate()
		scene_container.add_child(current_scene)
	else:
		printerr("Error crítico: No se pudo cargar el recurso de la escena en: ", target_scene_path)
