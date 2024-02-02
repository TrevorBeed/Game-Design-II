extends Control



func _on_btn_calc_pressed():
	var l = int($leL.text)
	var w = int($leW.text)
	var h = int($leH.text)
	var Weight = int($leWeight.text)
	var size = l * w * h
	if size > 100000 and Weight <= 27:
		$lblOut.text = "Too Large"
	elif Weight > 27 and  size <= 100000:
		$lblOut.text = "Too Heavy"
	elif size > 100000 and Weight > 27:
		$lblOut.text = "Too Large and Too Heavy"
	else:
		$lblOut.text = "Package is good!"
	


func _on_btn_clear_pressed():
	$leL.text = ""
	$leW.text = ""
	$leH.text = ""
	$leWeight.text = ""
	$lblOut.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
