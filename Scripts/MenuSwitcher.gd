extends Control

@export var current : Control:
	set(new_value):
		if current != null:
			current.visible = false
		current = new_value
		
		if current != null:
			current.visible = true
	get:
		return current

@onready var main_menu := $MainMenu
@onready var credits := $Credits

func _ready() -> void:
	current.visible = true

func _on_credits_button_pressed() -> void:
	current = credits


func _on_back_button_pressed() -> void:
	current = main_menu
