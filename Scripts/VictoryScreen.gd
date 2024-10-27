extends Control

@onready var victory_text := $Background/VictoryText

func _ready() -> void:
	var player_one : Player = $"../PlayerOne"
	var player_two : Player = $"../PlayerTwo"
	
	if player_one == null or player_two == null:
		print("Could not find both players")
		return
	
	player_one.died.connect(_on_player_won.bind(2, 1))
	player_two.died.connect(_on_player_won.bind(1, 2))

func get_victory_message(death_source: Player.DEATH_SOURCE, winner: int, loser: int) -> String:
	match death_source:
		Player.DEATH_SOURCE.CRUSH:
			return "Player %s crushed player %s" % [winner, loser]
		Player.DEATH_SOURCE.EXPLODED:
			return "Player %s blew up and player %s won!" % [loser, winner]
		_:
			return "We don't know how player %s died, but player %s won!" % [loser, winner]

func _on_player_won(death_source: Player.DEATH_SOURCE, winner: int, loser: int):
	victory_text.text = get_victory_message(death_source, winner, loser)
	visible = true

func _on_play_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
