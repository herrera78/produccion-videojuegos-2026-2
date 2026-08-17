# res://src/core/global_manager.gd
extends Node

# Variables de estado global con tipado estricto
var selected_ingredients: Array[String] = []
var total_price: int = 0

# Función pública para mutar el estado global de forma segura
func add_ingredient(ingredient_name: String, price: int) -> void:
	selected_ingredients.append(ingredient_name)
	total_price += price
	print("Estado actualizado en GlobalManager: ", selected_ingredients, " | Total: $", total_price)

# Función para reiniciar la orden cuando el usuario finalice el proceso
func reset_order() -> void:
	selected_ingredients.clear()
	total_price = 0
	print("GlobalManager: Pedido reiniciado.")
