extends Control



func _on_btn_calc_pressed():
	$ItemList.add_item("Number     Square     Square Roots")
	for num in range(-25, 26):
		var cubed = num**3
		var cubedroot = (num * 1/3)
		var line = str(num) + "     " + str(cubed) + "     " + str(cubedroot)
		$ItemList.add_item(line)


func _on_btn_clear_pressed():
	$ItemList.clear()


func _on_btn_exit_pressed():
	get_tree().quit()
