# res://src/core/event_bus.gd
extends Node

# Señal para solicitar el cambio de entorno interactivo
signal navigation_requested(target_scene_path: String)

# Señal para notificar la modificación de parámetros globales
signal parameter_changed(param_name: String, value: Variant)
