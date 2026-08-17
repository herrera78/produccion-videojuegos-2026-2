# res://src/scenes/simulation/step_3_summary.gd
extends Control

@onready var lbl_details: Label = $LblDetails
@onready var lbl_total: Label = $LblTotal
@onready var btn_finalize: Button = $BtnFinalize

func _ready() -> void:
	# 1. Leer y renderizar la información almacenada en el Singleton persistente
	if GlobalManager.selected_ingredients.is_empty():
		lbl_details.text = "No seleccionó ningún ingrediente."
	else:
		# Unimos el arreglo de Strings con comas para una presentación elegante
		lbl_details.text = "Ingredientes elegidos:
- " + ", ".join(GlobalManager.selected_ingredients)
		
	lbl_total.text = "Precio Total a Pagar: $%d COP" % GlobalManager.total_price
	
	# 2. Conectar botón de finalización
	btn_finalize.pressed.connect(_on_finalize_pressed)

func _on_finalize_pressed() -> void:
	# 1. Reiniciamos el estado del Singleton para futuras compras
	GlobalManager.reset_order()
	
	# 2. Solicitamos la navegación de regreso al panel principal (Menú) de manera desacoplada
	EventBus.navigation_requested.emit("res://src/scenes/menu/menu_panel.tscn")
