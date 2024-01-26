extends Control



func _on_btn_calc_pressed():
	var rad = int($L1.text)
	var pi = 3.14159
	var circ = 2 * pi * rad
	var area = pi * rad**2
	$lblCirc.text = "Circumfrance is: " + str(circ)
	$lblArea.text = "Area is: " + str(area)


func _on_btn_clear_pressed():
	$lblCirc.text = ""
	$lblArea.text = ""
	$l1.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
