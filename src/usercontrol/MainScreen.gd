extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$SettingsPanel.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_exit_game_pressed():
	get_tree().quit()

func _on_fullscreen_button_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	if button_pressed == false:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_settings_pressed():
	$SettingsPanel.show()
	$Buttons.hide()


func _on_exit_settings_pressed():
	$SettingsPanel.hide()
	$Buttons.show()
