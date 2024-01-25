extends Control



func _on_btn_calc_pressed():
	var length = int($txtLen.text)
	var width = int($txtWidth.text)
	var area = length * width
	var perim = 2 * length + 2 * width
	$lblArea.text = "Area:" + str(area)
	$lblPerim.text = "Perimeter: " + str(perim)
	#str string
	#int integer
	#float floating point (num w/decimal)


func _on_btn_clear_pressed():
	$lblArea.text = "Area:"
	$lblPerim.text = "Perimeter:"
	$txtLen.text = ""
	$txtWidth.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
