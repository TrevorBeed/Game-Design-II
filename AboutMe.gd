extends Control



func _on_btn_show_pressed():
	$Label.text = "I'm a 18 year old guy named Trevor"


func _on_btn_clear_pressed():
	$Label.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
