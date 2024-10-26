extends Node2D

@onready var stand_still_timer := $StandStillTimer
@onready var timer_bar := $ProgressBar
@onready var timer_text := $TimerText

func update_timer(is_player_moving: bool):
	return
	if is_player_moving:
		stand_still_timer.stop()
		timer_text.text = str(stand_still_timer.wait_time).pad_decimals(2)
	elif stand_still_timer.is_stopped():
		stand_still_timer.start()
	
	if not stand_still_timer.is_stopped():
		update_visuals()

func update_visuals():
	timer_text.text = str(stand_still_timer.time_left).pad_decimals(2)
	timer_bar.value = stand_still_timer.time_left / stand_still_timer.wait_time
