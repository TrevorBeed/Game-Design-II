extends Control



func _on_btn_calc_pressed():
	var speedlimit = int($txtLimit.text)
	var speed = int($txtSpeed.text)
	var milesOver = speed - speedlimit
	var fine = 20.0 + (milesOver * 5.0)
	$lblOut.text = "Fine: $%.2f" % fine


func _on_btn_clear_pressed():
	$txtSpeed.text = ""
	$txtLimit.text = ""
	$lblOut.text = "Fine: "


func _on_btn_exit_pressed():
	get_tree().quit()
