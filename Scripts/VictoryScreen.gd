extends Control

func _ready() -> void:
	var player_one := $"../PlayerOne"
	var player_two := $"../PlayerTwo"
	
	if player_two == null:
		print("hej")
