extends Control

@onready var victory_text := $Background/VictoryText

func _ready() -> void:
	var player_one := $"../PlayerOne"
	var player_two := $"../PlayerTwo"
	
	if player_one == null or player_two == null:
		return
		
	player_one.tree_exited.connect(_on_player_won.bind(1, 2))
	player_two.tree_exited.connect(_on_player_won.bind(2, 1))
	
func _on_player_won(winner: int, loser: int):
	victory_text.text = "Player %s won over player %s!" % [winner, loser]
	visible = true
