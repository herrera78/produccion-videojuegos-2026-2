# res://src/scenes/simulation/step_2_ingredients.gd
extends Control
# Declaración de una señal personalizada local con parámetros tipados
signal ingredient_selected(ingredient_name: String, price: int)

@onready var lbl_status: Label = $LblStatus
@onready var btn_cheese: Button = $GridContainer/BtnCheese
@onready var btn_tomato: Button = $GridContainer/BtnTomato
@onready var btn_back: Button = $HBoxNavigation/BtnBack
@onready var btn_next: Button = $HBoxNavigation/BtnNext

# Variable local temporal para dar feedback visual al estudiante en esta pantalla
var selected_count: int = 0
func _ready() -> void:
# Al emitirse la señal local, guardamos los datos directamente en el Singleton global
	ingredient_selected.connect(func(name: String, price: int) -> void:
		GlobalManager.add_ingredient(name, price)
)	

# 1. Conectar señales nativas de interacción local de ingredientes
	btn_cheese.pressed.connect(_on_ingredient_button_pressed.bind("Queso", 1500))
	btn_tomato.pressed.connect(_on_ingredient_button_pressed.bind("Tomate", 1000))
	# 2. Conectar la señal personalizada a un método local para retroalimentación
	ingredient_selected.connect(_on_ingredient_selected)
	# 3. Conectar la navegación global mediante el EventBus desacoplado
	btn_back.pressed.connect(func() -> void:
		EventBus.navigation_requested.emit("res://src/scenes/simulation/step_1_base.tscn")
	)
	btn_next.pressed.connect(func() -> void:
		EventBus.navigation_requested.emit("res://src/scenes/simulation/step_3_summary.tscn")
	)
func _on_ingredient_button_pressed(ingredient_name: String, price: int) -> void:
	# Emitimos nuestra señal personalizada al aire
	ingredient_selected.emit(ingredient_name, price)
func _on_ingredient_selected(ingredient_name: String, price: int) -> void:
	selected_count += 1
	lbl_status.text = "Ingrediente agregado: %s (+$%d). Total items: %d" % [ingredient_name, price, selected_count]
	print("Señal local capturada: ", ingredient_name, " por $", price)
