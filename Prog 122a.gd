extends Control



func _on_btn_calc_pressed():
	$ItemList.add_item("Number     Square     Square Roots")
	for num in range(1, 51):
		var numsquared = num**2
		var numsqrt = sqrt(num)
		var line = str(num) + "     " + str(numsquared) + "     " +str(numsqrt)
		$ItemList.add_item(line)

func _on_btn_clear_pressed():
	$ItemList.clear()


func _on_btn_exit_pressed():
	get_tree().quit()
